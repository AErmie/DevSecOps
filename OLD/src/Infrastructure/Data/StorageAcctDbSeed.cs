using Microsoft.eShopWeb.ApplicationCore.Entities;
using Microsoft.eShopWeb.ApplicationCore.Interfaces;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Azure.Storage;
using Microsoft.Azure.Storage.File;
using Newtonsoft.Json;

namespace Microsoft.eShopWeb.Infrastructure.Data
{
    public class StorageAcctDbSeed : IDbSeed {

        public StorageAcctDbSeed() {

        }
        public IEnumerable<CatalogBrand> GetPreconfiguredCatalogBrands()
        {
            var fileContent = this.LoadAzureStorageFileContents("CatalogBrands.json");
            if (fileContent == string.Empty)
                return new List<CatalogBrand>();

            return JsonConvert.DeserializeObject<List<CatalogBrand>>(fileContent);
        }

        public IEnumerable<CatalogType> GetPreconfiguredCatalogTypes()
        {
            var fileContent = LoadAzureStorageFileContents("CatalogTypes.json");
            if (fileContent == string.Empty)
                return new List<CatalogType>();

            return JsonConvert.DeserializeObject<List<CatalogType>>(fileContent);
        }

        public IEnumerable<CatalogItem> GetPreconfiguredItems()
        {
            var fileContent = LoadAzureStorageFileContents("CatalogItems.json");
            if (fileContent == string.Empty)
                return new List<CatalogItem>();

            return JsonConvert.DeserializeObject<List<CatalogItem>>(fileContent);
        }

        string LoadAzureStorageFileContents(string fileName)
        {
            var storageAccountCS = "REPLACEWITHCS";
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(storageAccountCS);

            // Create a CloudFileClient object for credentialed access to Azure Files.
            CloudFileClient fileClient = storageAccount.CreateCloudFileClient();
            CloudFileShare share = fileClient.GetShareReference("eshop");

            //// Ensure that the share exists.
            if (share.Exists())
            {
                // Get a reference to the root directory for the share.
                CloudFileDirectory rootDir = share.GetRootDirectoryReference();

                //Get a reference to the file we created previously.
                CloudFile file = rootDir.GetFileReference(fileName);

                // Ensure that the file exists.
                if (file.Exists())
                {
                    //download file content
                    return file.DownloadTextAsync().Result;
                }
            }

            return string.Empty;
        }
    }
}