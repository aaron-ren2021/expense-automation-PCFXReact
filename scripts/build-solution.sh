#!/bin/bash

# Build solution script
set -e

echo "🔨 Building Expense Automation Solution..."

# Build PCF control first
echo "📦 Building PCF control..."
cd pcf-controls/ExpenseItemsList
npm run build
cd ../..

# Build solution
echo "🏗️ Building Power Platform solution..."
if [ -d "solution" ]; then
    cd solution
    
    # Build the solution
    pac solution clone --name ExpenseAutomationSolution --version 1.0.0.0
    
    # Restore solution dependencies
    dotnet restore
    
    # Build solution
    dotnet build --configuration Release
    
    cd ..
    echo "✅ Solution build completed successfully!"
else
    echo "❌ Solution directory not found. Run 'npm run setup' first."
    exit 1
fi