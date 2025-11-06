#!/bin/bash

# Package solution script for creating managed solution
set -e

echo "📦 Packaging Expense Automation Solution..."

# Ensure solution is built
echo "🔨 Building solution first..."
bash scripts/build-solution.sh

# Create output directory
mkdir -p dist

# Package the solution
echo "📋 Creating managed solution package..."
cd solution

# Export as managed solution
pac solution export --name ExpenseAutomationSolution --managed --path ../dist/ExpenseAutomationSolution_managed.zip

# Export as unmanaged solution (for development)
pac solution export --name ExpenseAutomationSolution --path ../dist/ExpenseAutomationSolution_unmanaged.zip

cd ..

echo "✅ Solution packaging completed!"
echo "📁 Managed solution: dist/ExpenseAutomationSolution_managed.zip"
echo "📁 Unmanaged solution: dist/ExpenseAutomationSolution_unmanaged.zip"