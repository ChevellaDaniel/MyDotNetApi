# ---- Build Stage ----
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy everything and build
COPY . ./
RUN dotnet publish -c Release -o out

# ---- Runtime Stage ----
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .

# Expose the default port
EXPOSE 80

# Start the app
ENTRYPOINT ["dotnet", "LocalStackS3Demo.dll"]
