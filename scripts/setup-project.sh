#!/bin/bash

# Setup script for the Expense Automation PCF project
set -e

echo "🚀 Setting up Expense Automation PCF Project..."

# Check if pac CLI is installed
if ! command -v pac &> /dev/null; then
    echo "❌ pac CLI is not installed. Please install it first."
    echo "Run: npm install -g @microsoft/powerapps-cli"
    exit 1
fi

# Check if Node.js 20+ is installed
NODE_VERSION=$(node --version | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo "❌ Node.js 20 or higher is required. Current version: $(node --version)"
    exit 1
fi

echo "✅ Prerequisites check passed"

# Install root dependencies
echo "📦 Installing root dependencies..."
npm install

# Navigate to PCF control directory
cd pcf-controls/ExpenseItemsList

# Check if pcf-scripts is available globally, if not install it
if ! npm list -g pcf-scripts &> /dev/null; then
    echo "📦 Installing pcf-scripts globally..."
    npm install -g pcf-scripts
fi

# Install PCF control dependencies
echo "📦 Installing PCF control dependencies..."
npm install

# Initialize PCF project if not already done
if [ ! -f "generated/ManifestTypes.d.ts" ]; then
    echo "🔧 Initializing PCF project..."
    npm run refreshTypes
fi

# Build the PCF control
echo "🔨 Building PCF control..."
npm run build

cd ../..

# Create solution project if it doesn't exist
if [ ! -d "solution/ExpenseAutomationSolution" ]; then
    echo "🏗️ Creating Power Platform solution..."
    mkdir -p solution
    cd solution
    
    pac solution init --publisher-name "ExpenseAutomation" --publisher-prefix "ea"
    
    # Add PCF control to solution
    pac solution add-reference --path ../pcf-controls/ExpenseItemsList
    
    cd ..
fi

echo "✅ Project setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Run 'npm start' to start the PCF test harness"
echo "2. Run 'npm run build:solution' to build the solution"
echo "3. Run 'npm run package' to create a managed solution"
echo ""