#!/bin/bash

# Validation script to ensure the project is ready for deployment
set -e

echo "🔍 Validating Expense Automation PCF Project..."

# Check if Node.js version is correct
NODE_VERSION=$(node --version | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo "❌ Node.js 20 or higher is required. Current version: $(node --version)"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"

# Check if npm dependencies are installed at root
if [ ! -d "node_modules" ]; then
    echo "⚠️  Root dependencies not installed. Installing..."
    npm install
fi

echo "✅ Root dependencies installed"

# Check PCF control dependencies
cd pcf-controls/ExpenseItemsList
if [ ! -d "node_modules" ]; then
    echo "⚠️  PCF control dependencies not installed. Installing..."
    npm install
fi

echo "✅ PCF control dependencies installed"

# Test PCF control build
echo "🔨 Testing PCF control build..."
npm run build
echo "✅ PCF control builds successfully"

# Test linting
echo "🧹 Testing ESLint..."
npm run lint
echo "✅ ESLint passes"

# Check if generated types exist
if [ ! -f "generated/ManifestTypes.d.ts" ]; then
    echo "⚠️  Generated types not found. They should be created during build."
fi

# Check if bundle was created
if [ ! -f "out/controls/bundle.js" ]; then
    echo "❌ Bundle file not found after build"
    exit 1
fi

echo "✅ Bundle file created successfully"

cd ../..

echo "🎉 Project validation completed successfully!"
echo ""
echo "The PCF control is ready for:"
echo "1. Local development testing (npm start)"
echo "2. Solution building (requires PAC CLI in CI/CD)"
echo "3. Deployment to Power Platform environments"
echo ""