# ---- Runtime Stage Only ----
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app

# Copy the already published files into the container
COPY . .

# Expose the default port
EXPOSE 80

# Start the app
ENTRYPOINT ["dotnet", "LocalStackS3Demo.dll"]
