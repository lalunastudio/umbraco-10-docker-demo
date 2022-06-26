
########################
### build
########################
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

ARG PROJECT

WORKDIR /src

ENV PROJECT=${PROJECT}

COPY . .

RUN dotnet restore "${PROJECT}.csproj"

RUN dotnet publish "${PROJECT}.csproj" --configuration Release --no-restore --output /app

########################
### final
########################
FROM mcr.microsoft.com/dotnet/aspnet:6.0 

ARG PROJECT

WORKDIR /app

ENV ASPNETCORE_URLS "http://*:4000"

ENV DLL="${PROJECT}.dll"

COPY --from=build /app .

RUN echo "#!/bin/sh\ndotnet ${DLL}" > ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

EXPOSE 4000

ENTRYPOINT ["./entrypoint.sh"]
