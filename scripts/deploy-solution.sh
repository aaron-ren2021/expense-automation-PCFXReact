#!/bin/bash

# Deploy solution script
set -e

echo "🚀 Deploying Expense Automation Solution..."

# Check if environment URL is provided
if [ -z "$1" ]; then
    echo "❌ Environment URL is required"
    echo "Usage: ./scripts/deploy-solution.sh <environment-url>"
    echo "Example: ./scripts/deploy-solution.sh https://myorg.crm.dynamics.com"
    exit 1
fi

ENVIRONMENT_URL=$1

# Check if managed solution exists
if [ ! -f "dist/ExpenseAutomationSolution_managed.zip" ]; then
    echo "📦 Managed solution not found. Creating it..."
    bash scripts/package-solution.sh
fi

# Authenticate with Power Platform (this will open browser for auth)
echo "🔐 Authenticating with Power Platform..."
pac auth create --url $ENVIRONMENT_URL

# Import the managed solution
echo "📥 Importing managed solution to $ENVIRONMENT_URL..."
pac solution import --path dist/ExpenseAutomationSolution_managed.zip --force-overwrite

echo "✅ Solution deployed successfully!"
echo "🌐 Check your Power Platform environment: $ENVIRONMENT_URL"