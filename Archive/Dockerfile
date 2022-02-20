# RUN ALL CONTAINERS FROM ROOT (folder with .sln file):
# docker-compose build
# docker-compose up
#
# RUN JUST THIS CONTAINER FROM ROOT (folder with .sln file):
# docker build --pull -t web -f src/Web/Dockerfile .
#
# RUN COMMAND
#  docker run --name eshopweb --rm -it -p 8080:8080 web
# FROM microsoft/dotnet:2.2-sdk AS build
# Changed to use the microsoft container registry (MCR), see https://github.com/dotnet/announcements/issues/197
FROM mcr.microsoft.com/dotnet/sdk:2.2 AS build

# Args
ARG FEED_URL
ARG FEED_ACCESSTOKEN

# Set environment variables
ENV NUGET_CREDENTIALPROVIDER_SESSIONTOKENCACHE_ENABLED true
ENV VSS_NUGET_EXTERNAL_FEED_ENDPOINTS="{\"endpointCredentials\": [{\"endpoint\":\"${FEED_URL}\", \"username\":\"docker\", \"password\":\"${FEED_ACCESSTOKEN}\"}]}"

WORKDIR /app

# Setup artifacts-credprovider
# RUN curl -L https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | sh
COPY artifacts-credprovider/Microsoft.NuGet.CredentialProvider.tar.gz /app/Microsoft.NuGet.CredentialProvider.tar.gz
RUN mkdir "$HOME/.nuget/" \
    && tar xzf Microsoft.NuGet.CredentialProvider.tar.gz -C "$HOME/.nuget/" "plugins/netcore"

COPY src /app

WORKDIR /app/Web
RUN dotnet restore -s "${FEED_URL}" \
    && dotnet publish -c Release -o out

# FROM microsoft/dotnet:2.2-aspnetcore-runtime AS runtime
# Changed to use the microsoft container registry (MCR), see https://github.com/dotnet/announcements/issues/197
FROM mcr.microsoft.com/dotnet/aspnet:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/Web/out .

# Optional: Set this here if not setting it from docker-compose.yml
# ENV ASPNETCORE_ENVIRONMENT Development
RUN groupadd -r devsecops \
    && useradd --no-log-init -r -g devsecops devsecops \
    && mkdir /home/devsecops \
    && chown -R devsecops /app \
    && chown -R devsecops /home/devsecops
ENV ASPNETCORE_URLS=http://+:8080
USER devsecops
ENTRYPOINT ["dotnet", "Web.dll", "--environment=development"]
