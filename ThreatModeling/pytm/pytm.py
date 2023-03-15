#!/usr/bin/env python3

import email
from pytm import (
    TM,
    Actor,
    Boundary,
    Classification,
    Data,
    Dataflow,
    Datastore,
    Lambda,
    Server,
    DatastoreType,
)
from pytm.pytm import TLSVersion

tm = TM("Django.nv Advanced Threat Model")
tm.description = "Django.nv Advanced is an advanced analytical data processing system that supports processing of raw mathematical data to scientific data"
tm.isOrdered = True # automatically order data flows
tm.mergeResponses = True # indicate request and response through a double arrowed data flow
tm.assumptions = [
"Web Application Firewalls from the API Gateway Vendor decreases automated attacks on the system",
"SSL Termination on the DMZ is safe for now",
"Data Processor has core processing logic, should it be in the DMZ or internal network?"
]


internet = Boundary("Internet Boundary")

dmz = Boundary("DMZ")

intranet = Boundary("Intranet Boundary")


user = Actor("User")
user.inBoundary = internet

tpa = Actor("Third Party Applications")
tpa.inBoundary = internet


frontend = Server("Javascript FrontEnd")
frontend.inBoundary = internet
frontend.controls.sanitizesInput = False
frontend.controls.encodesOutput = True # front end reactjs natively encodes output before rendering

apigateway = Server("API Gateway")
apigateway.inBoundary = internet
apigateway.controls.sanitizesInput = True # because there is a web application firewall
apigateway.controls.encodesOutput = False # 
apigateway.controls.authorizesSource = True # using apikey for identificaton of callers, and OAuth 2.0 for authz

webserver = Server("Web Server")
webserver.inBoundary = dmz
webserver.OS = "RHEL"
webserver.controls.isHardened = False
webserver.controls.sanitizesInput = False
webserver.controls.encodesOutput = True
webserver.controls.authorizesSource = False
webserver.sourceFiles = ["django.nv/taskManager"]

dataprocessor = Server("Data Processor")
dataprocessor.inBoundary = dmz
dataprocessor.OS = "RHEL"
dataprocessor.controls.isHardened = True
dataprocessor.controls.sanitizesInput = False
dataprocessor.controls.encodesOutput = False
dataprocessor.controls.authorizesSource = True # data processor has rules to allow connections only from the web server
dataprocessor.sourceFiles = ["django.nv/fixtures"]

emailerprocess = Server("Emailer Process")
emailerprocess.inBoundary = intranet
emailerprocess.OS = "RHEL"
emailerprocess.controls.isHardened = False
emailerprocess.controls.sanitizesInput = False
emailerprocess.controls.encodesOutput = False
emailerprocess.controls.authorizesSource = False

smtpserver = Server("SMTP Server")
smtpserver.inBoundary = intranet
smtpserver.OS = "RHEL"
smtpserver.controls.isHardened = False
smtpserver.controls.authorizesSource = False
smtpserver.controls.authenticatesSource = True # only accepts connections from known users via user id and password
smtpserver.port = 25
smtpserver.protocol = "SMTP"


rawdatastore = Datastore("Raw Data")
rawdatastore.inBoundary = intranet
rawdatastore.OS = "RHEL"
rawdatastore.controls.isHardened = True
rawdatastore.type = DatastoreType.SQL
rawdatastore.inScope = True
rawdatastore.maxClassification = Classification.RESTRICTED # stores raw input from users
rawdatastore.storesPII = True # stores user information
rawdatastore.port = 3306
rawdatastore.protocol = "TCP"

processedscientificdatastore = Datastore("Processed Scientific Data")
processedscientificdatastore.inBoundary = intranet
processedscientificdatastore.OS = "RHEL"
processedscientificdatastore.controls.isHardened = True
processedscientificdatastore.type = DatastoreType.SQL
processedscientificdatastore.inScope = True
processedscientificdatastore.maxClassification = Classification.TOP_SECRET # stores the crown jewel, the processed scientific data
processedscientificdatastore.storesSensitiveData = True


tpa_to_apigateway = Dataflow(tpa, apigateway, "Web Request (HTTPS)")
tpa_to_apigateway.protocol = "HTTPS" # internet facing connections use HTTPS
tpa_to_apigateway.dstPort = 443
tpa_to_apigateway.tlsVersion = TLSVersion.TLSv11

apigateway_to_tpa = Dataflow(apigateway, tpa, "Web Response (HTTPS)")
apigateway_to_tpa.protocol = "HTTPS"  # internet facing connections use HTTPS
apigateway_to_tpa.dstPort = 443
apigateway_to_tpa.tlsVersion = TLSVersion.TLSv11

user_to_frontend = Dataflow(user, frontend, "User Action")

frontend_to_user = Dataflow(user, frontend, "User Action")

frontend_to_apigateway = Dataflow(frontend, apigateway, "Web Request (HTTPS)")
frontend_to_apigateway.protocol = "HTTPS" # internet facing connections use HTTPS
frontend_to_apigateway.dstPort = 443
frontend_to_apigateway.tlsVersion = TLSVersion.TLSv11

apigateway_to_frontend = Dataflow(apigateway, frontend, "Web Response (HTTPS)")
apigateway_to_frontend.protocol = "HTTPS" # internet facing connections use HTTPS
apigateway_to_frontend.dstPort = 443
apigateway_to_frontend.tlsVersion = TLSVersion.TLSv11


apigateway_to_webserver = Dataflow(apigateway, webserver, "Web Request (HTTPS)")
apigateway_to_webserver.protocol = "HTTPS" # internet facing connections use HTTPS
apigateway_to_webserver.dstPort = 443
apigateway_to_webserver.tlsVersion = TLSVersion.TLSv11
apigateway_to_webserver.usesSessionTokens = True

webserver_to_apigateway = Dataflow(webserver, apigateway, "Web Response (HTTPS)")
webserver_to_apigateway.protocol = "HTTPS" # internet facing connections use HTTPS
webserver_to_apigateway.dstPort = 443
webserver_to_apigateway.tlsVersion = TLSVersion.TLSv11
webserver_to_apigateway.usesSessionTokens = True


webserver_to_dataprocessor = Dataflow(webserver, dataprocessor, "Query Processed Data (HTTP)")
webserver_to_dataprocessor.protocol = "HTTP"
webserver_to_dataprocessor.dstPort = 80

processedscientificdata = Data("Processed Scientific Data")
processedscientificdata.description = "Analytical data after processing"
processedscientificdata.classification = Classification.TOP_SECRET
processedscientificdata.isDestEncryptedAtRest = True


dataprocessor_to_webserver = Dataflow(dataprocessor, webserver, "Read Processed Data (HTTP)")
dataprocessor_to_webserver.protocol = "HTTP"
dataprocessor_to_webserver.dstPort = 80
dataprocessor_to_webserver.data = processedscientificdata


rawdata = Data("Raw Data")
rawdata.description = "Raw Data input from the user"
rawdata.classification = Classification.SENSITIVE
rawdata.isDestEncryptedAtRest = False
rawdata.isPII = True


webserver_to_rawdatastore = Dataflow(webserver, rawdatastore, "Store Raw Data (TCP/3306)")
webserver_to_rawdatastore.protocol = "TCP"
webserver_to_rawdatastore.dstPort = 3306
webserver_to_rawdatastore.data = rawdata

rawdatastore_to_webserver = Dataflow(rawdatastore, webserver, "Read Raw Data (TCP/3306)")
rawdatastore_to_webserver.protocol = "TCP"
rawdatastore_to_webserver.dstPort = 3306
rawdatastore_to_webserver.data = rawdata

rawdatastore_to_dataprocessor = Dataflow(rawdatastore, dataprocessor, "Read Raw Data (TCP/3306)")
rawdatastore_to_dataprocessor.protocol = "TCP"
rawdatastore_to_dataprocessor.dstPort = 3306
rawdatastore_to_dataprocessor.data = rawdata

dataprocessor_to_processedscientificdatastore = Dataflow(dataprocessor, processedscientificdatastore, "Store processed data (ACME/2249)")
dataprocessor_to_processedscientificdatastore.protocol = "TCP-ACME"
dataprocessor_to_processedscientificdatastore.dstPort = 2249
dataprocessor_to_processedscientificdatastore.data = processedscientificdata

processedscientificdatastore_to_dataprocessor = Dataflow(processedscientificdatastore, dataprocessor, "Read processed data (ACME/2249)")
processedscientificdatastore_to_dataprocessor.protocol = "TCP-ACME"
processedscientificdatastore_to_dataprocessor.dstPort = 2249
processedscientificdatastore_to_dataprocessor.data = processedscientificdata


processedscientificdatastore_to_emailerprocess = Dataflow(processedscientificdatastore, emailerprocess, "Trigger processing done notification (ACME/2249")
processedscientificdatastore_to_emailerprocess.protocol = "TCP-ACME"
processedscientificdatastore_to_emailerprocess.dstPort = 2249

emailerprocess_to_rawdatastore = Dataflow(emailerprocess, rawdatastore, "Query user data (TCP/3306)")
emailerprocess_to_rawdatastore.protocol = "TCP"
emailerprocess_to_rawdatastore.dstPort = 3306
emailerprocess_to_rawdatastore.data = rawdata

rawdatastore_to_emailerprocess = Dataflow(rawdatastore, emailerprocess, "Read User Data (TCP/3306)")
rawdatastore_to_emailerprocess.protocol = "TCP"
rawdatastore_to_emailerprocess.dstPort = 3306
rawdatastore_to_emailerprocess.data = rawdata

emailerprocess_to_smtpserver = Dataflow(emailerprocess, smtpserver, "Queue Email (SMTP/25)")
emailerprocess_to_smtpserver.protocol = "SMTP"
emailerprocess_to_smtpserver.dstPort = 25


userIdToken = Data(
    name="User ID Token",
    description="Unique token that represents the user real data in the secret database",
    classification=Classification.TOP_SECRET,
    traverses=[frontend_to_apigateway, apigateway_to_webserver, webserver_to_dataprocessor],
    processedBy=[webserver, dataprocessor],
)

userAccessToken = Data(
    name="User Access Token",
    description="Unique token that represents the user real data in the secret database",
    classification=Classification.TOP_SECRET,
    traverses=[frontend_to_apigateway, apigateway_to_webserver, webserver_to_dataprocessor],
    processedBy=[webserver, dataprocessor],
)


if __name__ == "__main__":
    tm.process()
