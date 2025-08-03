# Gemini Interaction Guide

This document outlines how to effectively interact with the Gemini AI assistant in this project.

## Getting Started

- **Ask questions directly:** You can ask me to explain code, suggest optimizations, or help you find specific information within the project.
- **Request code changes:** I can help you with refactoring, adding new features, or fixing bugs. Please be specific about your requirements.
- **Use tools:** I have access to a variety of tools to help you with your tasks. For example, I can read and write files, search for code, and run shell commands.

## Best Practices

- **Provide context:** The more context you provide, the better I can understand your request and provide a relevant response.
- **Be specific:** Avoid ambiguous requests. Instead of saying "fix the code," try to describe the problem in detail and provide the relevant file paths.
- **Review my changes:** I will always ask for your approval before making any changes to your codebase. Please review the changes carefully before approving them.

## Example Interactions

### General Questions & Refactoring
- "Explain the `bootstrap/database.go` file."
- "What is the difference between the `serve` and `key` commands in `app/cmd/`?"
- "Refactor the `app/http/controllers/api/v1/users_controller.go` to use a different validation library."
- "Run the tests for the `app/models/user` package."

### Feature Development (Following the Recommended Workflow)
- "I want to add a new 'products' feature. Please create the `Product` model, `ProductRequest` validator, and `ProductsController` for me."
- "Add a new API endpoint to `routes/api.go` to handle creating a product. It should be a POST request to `/v1/products` and use the `ProductsController.Store` method."
- "In `app/http/controllers/api/v1/products_controller.go`, implement the `Store` method to validate the request and create a new product."