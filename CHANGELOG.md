# Changelog

All notable changes to this project will be documented in this file.

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [2.0.0] - 2026-03-21

### Added
- Code Review prompt for reviewing implementations against RFCs
- Testing Strategy prompt for generating comprehensive test plans
- Examples folder with complete URL shortener sample project
- CONTRIBUTING.md with prompt submission guidelines
- CHANGELOG.md
- MIT LICENSE file
- `--list` and `--help` flags for copy-prompt.sh
- Compatibility section in README
- Quick Start section in README

### Changed
- All prompts trimmed ~30-40% for modern LLMs (less verbose, more effective)
- Removed Cursor-specific `@file` references from implementation template
- Standardized MoSCoW terminology across all prompts
- Overhauled README with updated workflow diagram, examples section, and tool-agnostic language
- Rebranded from "cursor-ai-prd-workflow" to "ai-prd-workflow"
- Updated workflow to include Code Review and Testing steps

### Fixed
- README referenced LICENSE file that didn't exist

## [1.0.0] - 2025-03-01

### Added
- Interactive PRD Creation prompt
- PRD Comprehensive Verification prompt
- PRD to Features Extraction prompt
- PRD to Rules prompt
- PRD to RFCs prompt
- Implementation Prompt Template
- PRD Change Management prompt
- copy-prompt.sh clipboard helper script
- README with workflow documentation
