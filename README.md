# AI PRD Workflow

<div align="center">
  <img src="https://img.shields.io/badge/PRD-Workflow-blue?style=for-the-badge&logo=github" alt="PRD Workflow" width="200"/>
  <h3>AI-Powered Product Development</h3>
</div>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
![Status: Active](https://img.shields.io/badge/Status-Active-brightgreen)

A collection of reusable AI prompts to streamline your product development workflow. Copy and paste these prompts into any AI assistant (Claude, ChatGPT, Cursor, Windsurf, or any AI-powered IDE) to automate common tasks in your product development process.

## Quick Start

1. Pick a prompt from [Available Prompts](#available-prompts) below
2. Copy its contents (or use `./copy-prompt.sh --list` to browse)
3. Paste into any AI assistant with your project context attached

New here? Check the [examples/url-shortener](examples/url-shortener/) folder for sample outputs from every step.

> [!TIP]
> **Why PRD & RFC Driven Development?** This approach significantly improves AI collaboration by providing clear boundaries, reducing hallucinations, and ensuring consistent understanding between humans and AI. [Jump to full benefits](#benefits-of-prd--rfc-driven-development)

## Table of Contents
- [Benefits of PRD & RFC Driven Development](#benefits-of-prd--rfc-driven-development)
- [Available Prompts](#available-prompts)
- [Recommended Workflow](#recommended-workflow)
- [Examples](#examples)
- [How to Use](#how-to-use)
- [Compatibility](#compatibility)
- [Quick Tips](#quick-tips)
- [Contributing](#contributing)
- [License](#license)

## Benefits of PRD & RFC Driven Development

Following a structured PRD & RFC driven development approach offers significant advantages, especially when collaborating with AI tools:

<div align="center">
  <table>
    <tr>
      <td align="center"><b>Enhanced AI<br>Collaboration</b></td>
      <td align="center"><b>Improved<br>Development</b></td>
      <td align="center"><b>Business<br>Benefits</b></td>
      <td align="center"><b>AI-Specific<br>Advantages</b></td>
    </tr>
  </table>
</div>

### Enhanced AI Collaboration
- **Clearer Instructions**: Well-defined PRDs and RFCs provide AI with precise context, resulting in more accurate implementations
- **Reduced Hallucinations**: Structured documentation minimizes AI's tendency to fill in gaps with incorrect assumptions
- **Consistent Mental Model**: Both humans and AI work from the same documented understanding

### Improved Development Process
- **Boundary Setting**: Clearly defined scope prevents AI from implementing unwanted features
- **Incremental Verification**: Breaking work into RFCs allows validation at each step
- **Traceability**: Each implementation traces back to specific requirements
- **Reduced Rework**: Clear specifications minimize major revisions

### Business Benefits
- **Predictable Outcomes**: Structured approach leads to more predictable timelines and results
- **Knowledge Preservation**: Documentation persists even as team members or AI tools change
- **Stakeholder Alignment**: PRDs create shared understanding between business, technical teams, and AI
- **Faster Onboarding**: New team members or AI tools quickly understand goals and constraints

### AI-Specific Advantages
- **Context Window Optimization**: Focused RFCs help AI work within context window limitations
- **Targeted Expertise**: Different aspects can be directed to specialized AI models or prompts
- **Quality Control**: Structured documentation provides clear criteria for AI to self-evaluate

## Available Prompts

| Prompt | Description |
|--------|-------------|
| [Interactive PRD Creation](interactive-prd-creation-prompt.md) | Create a PRD through a guided step-by-step questioning process |
| [PRD Comprehensive Verification](prd-comprehensive-verification-prompt.md) | Verify and improve your PRD by identifying gaps and quality issues |
| [PRD to Features Extraction](prd-to-features-prompt.md) | Extract and organize features from your PRD |
| [PRD to Rules](prd-to-rules-prompt.md) | Generate technical guidelines and standards for development |
| [PRD to RFCs](prd-to-rfcs-prompt.md) | Break down your PRD into manageable implementation units |
| [Implementation Template](implementation-prompt-template.md) | Template for implementing individual RFCs |
| [Code Review](code-review-prompt.md) | Review implementation against RFC, rules, security, and performance |
| [Testing Strategy](testing-strategy-prompt.md) | Generate comprehensive test plan from features and RFCs |
| [PRD Change Management](prd-change-management-prompt.md) | Manage changes to your PRD during development |

## Recommended Workflow

<div align="center">
  <pre>
  ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐
  │  Create  │   │  Verify  │   │ Extract  │   │  Create  │   │ Generate │   │Implement │   │  Code    │   │ Testing  │
  │   PRD    │──>│   PRD    │──>│ Features │──>│  Rules   │──>│   RFCs   │──>│   RFCs   │──>│  Review  │──>│ Strategy │
  └──────────┘   └──────────┘   └──────────┘   └──────────┘   └──────────┘   └──────────┘   └──────────┘   └──────────┘
  </pre>
</div>

### Initial Development
1. **Create PRD** - Start with a vague idea and develop it into a complete PRD using the Interactive Creation prompt
2. **Verify PRD** - Identify critical gaps and improve quality using the Comprehensive Verification prompt
3. **Extract Features** - Transform your verified PRD into organized features with priorities and acceptance criteria
4. **Create Rules** - Establish technical guidelines and standards based on your PRD and features
5. **Generate RFCs** - Break down the project into logical, manageable implementation units
6. **Implement RFCs** - Use the implementation template for each RFC to guide development
7. **Code Review** - Review each implementation against its RFC specification and project standards
8. **Testing Strategy** - Generate and execute a comprehensive test plan for implemented features

### Managing Changes
When new requirements or changes arise during development:
1. **Analyze Changes** - Use the Change Management prompt to assess impact and integration strategy
2. **Update Documents** - Revise affected PRD, features, rules, and RFCs based on the analysis
3. **Continue Implementation** - Resume development with the updated documentation

## Examples

The [examples/](examples/) folder contains complete sample outputs for a URL shortener project, demonstrating each step of the workflow:

- [PRD](examples/url-shortener/PRD.md) - Product Requirements Document
- [Features](examples/url-shortener/FEATURES.md) - Extracted features with MoSCoW prioritization
- [Rules](examples/url-shortener/RULES.md) - Development standards and guidelines
- [RFCs](examples/url-shortener/RFCs/) - Implementation units (3 RFCs)

Use these as a reference for what each prompt produces.

## How to Use

### Method 1: Manual Copy
1. Open the desired prompt file
2. Copy the entire contents
3. Paste into your AI assistant
4. Attach your PRD or relevant documents
5. Let the AI process your request

### Method 2: Using the Copy Script
```bash
# Make the script executable (first time only)
chmod +x copy-prompt.sh

# List all available prompts
./copy-prompt.sh --list

# Copy a prompt to clipboard
./copy-prompt.sh interactive-prd-creation-prompt.md
```

Then paste the prompt into your AI assistant and proceed as normal.

## Compatibility

These prompts work with any modern LLM, including:
- **Claude** (Anthropic) - Claude 3.5, Claude 4.x
- **GPT-4 / ChatGPT** (OpenAI) - GPT-4, GPT-4o, GPT-4.5
- **Gemini** (Google) - Gemini 1.5, Gemini 2.x
- **Local models** - Llama, Mistral, etc. (with sufficient context windows)

They also work in AI-powered IDEs like **Cursor**, **Windsurf**, **Cline**, and **GitHub Copilot**.

## Quick Tips

- Provide complete documents when possible
- Answer any clarifying questions the AI asks
- Review and customize AI outputs before implementation
- Use the prompts in sequence for best results
- For complex projects, iterate through prompts as needed

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on submitting new prompts, quality standards, and testing approach.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">Made with care for better product development with AI</p>
