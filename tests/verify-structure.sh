#!/bin/bash

# Test script to verify project structure
set -e

echo "🧪 Running project structure tests..."

# Check if required files exist
echo "📋 Checking file structure..."

required_files=(
    ".devcontainer/devcontainer.json"
    ".devcontainer/setup.sh"
    ".github/workflows/build-and-release.yml"
    "package.json"
    "README.md"
    "pcf-controls/ExpenseItemsList/ControlManifest.Input.xml"
    "pcf-controls/ExpenseItemsList/index.ts"
    "pcf-controls/ExpenseItemsList/package.json"
    "pcf-controls/ExpenseItemsList/components/ExpenseItemsListComponent.tsx"
    "pcf-controls/ExpenseItemsList/css/ExpenseItemsList.css"
    "scripts/setup-project.sh"
    "scripts/build-solution.sh"
    "scripts/package-solution.sh"
    "scripts/deploy-solution.sh"
)

all_files_exist=true

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file"
        all_files_exist=false
    fi
done

if [ "$all_files_exist" = true ]; then
    echo "✅ All required files exist!"
else
    echo "❌ Some required files are missing!"
    exit 1
fi

# Check if scripts are executable
echo "📋 Checking script permissions..."
for script in scripts/*.sh; do
    if [ -x "$script" ]; then
        echo "✅ $script is executable"
    else
        echo "❌ $script is not executable"
    fi
done

# Check package.json structure
echo "📋 Checking package.json..."
if grep -q "expense-automation-pcf-react" package.json; then
    echo "✅ Root package.json has correct name"
else
    echo "❌ Root package.json name issue"
fi

if grep -q "expense-items-list-pcf" pcf-controls/ExpenseItemsList/package.json; then
    echo "✅ PCF package.json has correct name"
else
    echo "❌ PCF package.json name issue"
fi

# Check if CSS has required classes
echo "📋 Checking CSS structure..."
if grep -q "expense-items-list" pcf-controls/ExpenseItemsList/css/ExpenseItemsList.css; then
    echo "✅ CSS has base classes"
else
    echo "❌ CSS missing base classes"
fi

# Check TypeScript interfaces
echo "📋 Checking TypeScript interfaces..."
if grep -q "IExpenseItem" pcf-controls/ExpenseItemsList/components/ExpenseItemsListComponent.tsx; then
    echo "✅ TypeScript interfaces defined"
else
    echo "❌ TypeScript interfaces missing"
fi

# Check manifest structure
echo "📋 Checking PCF manifest..."
if grep -q "ExpenseItemsList" pcf-controls/ExpenseItemsList/ControlManifest.Input.xml; then
    echo "✅ PCF manifest has correct control name"
else
    echo "❌ PCF manifest issues"
fi

echo ""
echo "🎉 Project structure verification completed!"
echo ""
echo "📖 Next steps:"
echo "1. Open in GitHub Codespaces or set up local environment"
echo "2. Run 'npm run setup' to initialize the project"  
echo "3. Start development with 'npm start'"
echo ""