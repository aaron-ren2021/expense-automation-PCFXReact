# Expense Automation - Power Apps PCF React Solution

A comprehensive starter template for building Expense/Invoice Request automation in Power Apps using PCF (PowerApps Component Framework) with React components.

## 🚀 Features

- **PCF React Control**: Modern, responsive expense items list with selection capabilities
- **GitHub Codespaces Ready**: Complete development environment with Node 20, .NET 8, and pac CLI
- **Multi-Select Support**: Choose between single or multiple expense item selection
- **Theming**: Support for light, dark, and default themes
- **Automated CI/CD**: GitHub Actions for building and releasing managed solutions
- **Type-Safe**: Full TypeScript support with proper PCF typing
- **Accessibility**: WCAG compliant with keyboard navigation and screen reader support

## 📋 Quick Start

### 1. Open in GitHub Codespaces

Click the green "Code" button and select "Open with Codespaces" to get a fully configured development environment.

### 2. Local Development Setup

If you prefer local development:

```bash
# Clone the repository
git clone https://github.com/aaron-ren2021/expense-automation-PCFXReact.git
cd expense-automation-PCFXReact

# Run the setup script
npm run setup

# Start development
npm start
```

### 3. Prerequisites

- Node.js 20+
- .NET 8 SDK
- Power Platform CLI (`pac`)
- Power Apps Developer Account

### 4. Install Dependencies

```bash
# Install root dependencies
npm install

# Install PCF control dependencies
cd pcf-controls/ExpenseItemsList
npm install
```

## 🛠️ Development

### Building the PCF Control

```bash
# Build the React PCF control
npm run build:pcf

# Start the test harness for development
npm start

# Run linting
npm run lint
```

### Building the Solution

```bash
# Build the complete Power Platform solution
npm run build:solution

# Package as managed solution
npm run package
```

### Testing

The PCF control includes a test harness for development:

```bash
cd pcf-controls/ExpenseItemsList
npm start
```

This opens a local test environment at `http://localhost:8080` where you can test your control.

## 📦 Solution Structure

```
expense-automation-PCFXReact/
├── .devcontainer/           # GitHub Codespaces configuration
│   ├── devcontainer.json    # Container setup with Node 20, .NET 8, pac CLI
│   └── setup.sh            # Post-creation setup script
├── .github/workflows/       # CI/CD pipelines
│   └── build-and-release.yml # Automated build and release
├── pcf-controls/           # PCF React controls
│   └── ExpenseItemsList/   # Main expense list control
│       ├── components/     # React components
│       ├── css/           # Stylesheets
│       ├── strings/       # Localization resources
│       └── index.ts       # Main PCF control
├── solution/              # Power Platform solution
├── scripts/               # Build and deployment scripts
│   ├── setup-project.sh   # Project initialization
│   ├── build-solution.sh  # Solution building
│   ├── package-solution.sh # Solution packaging
│   └── deploy-solution.sh # Deployment script
└── dist/                  # Built solution packages
```

## 🎨 PCF Control Usage

### Basic Configuration

The ExpenseItemsList control can be configured with the following properties:

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `items` | Dataset | Collection of expense items | Required |
| `selectedItem` | Text | Currently selected item ID | Optional |
| `theme` | Choice | Visual theme (default/light/dark) | default |
| `allowMultiSelect` | Yes/No | Enable multiple item selection | No |

### Data Schema

Your expense items dataset should include these columns:

```javascript
{
  title: "Expense title",           // Text (Required)
  description: "Expense description", // Text (Optional)
  amount: 150.00,                   // Currency (Required)
  currency: "USD",                  // Text (Required)
  date: "2024-01-15",              // Date (Required)
  category: "Travel",              // Text (Required)
  status: "Pending",               // Choice (Required)
  vendor: "Hotel ABC",             // Text (Optional)
  receipturl: "https://...",       // URL (Optional)
}
```

## 🔧 Power Fx Integration Examples

### Basic Control Integration

Add the control to your Power App and bind it to a data source:

```powerfx
// Set the Items property to your expense data
ExpenseItemsList.Items = Filter(Expenses, Status <> "Deleted")

// Handle selection changes
OnSelect: Set(SelectedExpense, ExpenseItemsList.SelectedItem)
```

### Advanced Scenarios

#### 1. Filter Expenses by Category

```powerfx
// In a dropdown for category selection
ExpenseItemsList.Items = Filter(
    Expenses, 
    CategoryFilter.Selected.Value = "All" || 
    Category = CategoryFilter.Selected.Value
)
```

#### 2. Calculate Total Amount

```powerfx
// Display total of selected items
Sum(
    Filter(Expenses, ID in ExpenseItemsList.SelectedItems),
    Amount
)
```

#### 3. Multi-Select with Actions

```powerfx
// Approve multiple selected expenses
ForAll(
    Filter(Expenses, ID in ExpenseItemsList.SelectedItems),
    Patch(Expenses, ThisRecord, {Status: "Approved"})
);
Refresh(Expenses)
```

#### 4. Dynamic Theming

```powerfx
// Switch theme based on user preference
ExpenseItemsList.Theme = If(
    UserSettings.DarkMode,
    "dark",
    "light"
)
```

#### 5. Status-Based Filtering

```powerfx
// Filter by status with dynamic buttons
Switch(
    StatusFilter.Selected.Value,
    "All", Expenses,
    "Pending", Filter(Expenses, Status = "Pending"),
    "Approved", Filter(Expenses, Status = "Approved"),
    "Rejected", Filter(Expenses, Status = "Rejected")
)
```

#### 6. Search and Filter Combination

```powerfx
// Combine search with category filtering
Filter(
    Expenses,
    (SearchInput.Text = "" || 
     SearchInput.Text in Title || 
     SearchInput.Text in Description) &&
    (CategoryDropdown.Selected.Value = "All" || 
     Category = CategoryDropdown.Selected.Value)
)
```

## 🚀 Deployment

### Automated Deployment (Recommended)

The repository includes GitHub Actions that automatically:

1. Build the PCF control on every push
2. Package the solution
3. Create releases with downloadable managed solutions
4. Deploy to development environments

### Manual Deployment

```bash
# Package the solution
npm run package

# Deploy to your environment
npm run deploy https://yourorg.crm.dynamics.com
```

### Import to Power Platform

1. Download the `ExpenseAutomationSolution_managed.zip` from releases
2. Go to Power Platform admin center
3. Select your environment
4. Navigate to Solutions
5. Import the downloaded solution
6. Configure the ExpenseItemsList control in your Power Apps

## 🎯 Customization

### Theming

Modify the CSS in `pcf-controls/ExpenseItemsList/css/ExpenseItemsList.css` to customize the appearance:

```css
/* Custom theme example */
.expense-items-list.custom {
    --primary-color: #6366f1;
    --secondary-color: #f3f4f6;
    --text-color: #1f2937;
    --border-color: #e5e7eb;
}
```

### Adding New Properties

1. Update `ControlManifest.Input.xml`
2. Modify the TypeScript interfaces
3. Update the React component
4. Rebuild the control

### Extending Functionality

The control is designed to be extensible. You can:

- Add new expense item fields
- Implement custom validation
- Add export/import capabilities
- Integrate with external services

## 🧪 Testing

### Unit Tests

```bash
cd pcf-controls/ExpenseItemsList
npm test
```

### Integration Testing

Use the PCF test harness to test your control with mock data:

```bash
npm start
```

## 📚 Additional Resources

- [PCF Documentation](https://docs.microsoft.com/powerapps/developer/component-framework/)
- [Power Apps Documentation](https://docs.microsoft.com/powerapps/)
- [React Documentation](https://react.dev/)
- [Power Platform CLI](https://docs.microsoft.com/powerapps/developer/data-platform/powerapps-cli)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For issues and questions:

1. Check the [Issues](https://github.com/aaron-ren2021/expense-automation-PCFXReact/issues) page
2. Create a new issue with detailed information
3. Include steps to reproduce any bugs

---

**Happy coding! 🎉**
