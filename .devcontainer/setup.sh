#!/bin/bash

# Update system packages
sudo apt-get update

# Install Power Platform CLI
echo "Installing Power Platform CLI..."
sudo npm install -g @microsoft/generator-powerapps
sudo npm install -g @types/powerapps-component-framework

# Install pac CLI
curl -L -o pac-linux https://aka.ms/PowerAppsCLI-linux
sudo chmod +x pac-linux
sudo mv pac-linux /usr/local/bin/pac

# Verify installations
echo "Verifying installations..."
node --version
dotnet --version
pac --version

# Install project dependencies if package.json exists
if [ -f "package.json" ]; then
  echo "Installing npm dependencies..."
  npm install
fi

# Install .NET dependencies if solution file exists
if [ -f "*.sln" ]; then
  echo "Restoring .NET dependencies..."
  dotnet restore
fi

echo "Development environment setup complete!"