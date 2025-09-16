# Contributing to Expense Automation PCF React

Thank you for your interest in contributing to this project! This guide will help you get started.

## 🚀 Quick Start

1. Fork the repository
2. Clone your fork
3. Open in GitHub Codespaces or set up locally
4. Run `npm run setup` to initialize the project
5. Make your changes
6. Test your changes
7. Submit a pull request

## 🛠️ Development Setup

### Prerequisites

- Node.js 20+
- .NET 8 SDK
- Power Platform CLI (`pac`)
- Git

### Local Development

```bash
# Install dependencies
npm install
cd pcf-controls/ExpenseItemsList
npm install

# Start development
npm start
```

### In GitHub Codespaces

Just open the repository in Codespaces - everything is pre-configured!

## 📝 Making Changes

### Code Style

- Use TypeScript for all new code
- Follow the existing code style
- Run `npm run lint` before submitting
- Add comments for complex logic

### Testing

- Run the structure verification: `bash tests/verify-structure.sh`
- Test your changes in the PCF test harness
- Ensure all scripts work correctly

### Commit Messages

Use clear, descriptive commit messages:

```
feat: add new expense filtering functionality
fix: resolve multi-select state issue
docs: update Power Fx examples
style: improve responsive design
```

## 🔄 Pull Request Process

1. Create a feature branch from `main`
2. Make your changes
3. Test thoroughly
4. Update documentation if needed
5. Submit a pull request with:
   - Clear description of changes
   - Screenshots for UI changes
   - Link to any relevant issues

## 📋 Areas for Contribution

- **Features**: New PCF control features
- **Documentation**: Improve guides and examples
- **Testing**: Add automated tests
- **Accessibility**: Enhance WCAG compliance
- **Performance**: Optimize rendering and data handling
- **Localization**: Add support for more languages

## 🐛 Reporting Issues

When reporting issues, please include:

- Description of the problem
- Steps to reproduce
- Expected behavior
- Screenshots if applicable
- Environment details

## 📚 Resources

- [PCF Documentation](https://docs.microsoft.com/powerapps/developer/component-framework/)
- [React Documentation](https://react.dev/)
- [Power Platform CLI](https://docs.microsoft.com/powerapps/developer/data-platform/powerapps-cli)

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

Thank you for contributing! 🎉