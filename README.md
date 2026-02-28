# PIV Framework

**Plan-Implement-Verify** development framework for Claude Code with E2E testing.

Extracted from [coleam00/link-in-bio-page-builder](https://github.com/coleam00/link-in-bio-page-builder) and packaged as a standalone, reusable framework.

## What It Does

PIV provides structured AI-assisted development workflows via Claude Code commands and skills. Commands are namespaced under `/piv/` to keep them separate from your project's own commands.

### Commands (`.claude/commands/piv/`)

| Command | Description |
|---------|-------------|
| `/piv/prime` | Load project context - analyzes structure, docs, key files |
| `/piv/plan-feature` | Create comprehensive implementation plan with codebase analysis |
| `/piv/execute` | Execute an implementation plan task-by-task with validation |
| `/piv/create-rules` | Generate `CLAUDE.md` project rules from codebase analysis |
| `/piv/create-prd` | Generate a Product Requirements Document |
| `/piv/init-project` | Project setup instructions (customize per project) |
| `/piv/commit` | Atomic git commit workflow |

### Skills (`.claude/skills/`)

| Skill | Description |
|-------|-------------|
| `agent-browser` | Headless browser automation via Vercel Agent Browser CLI |
| `e2e-test` | Comprehensive E2E testing with parallel sub-agents, browser testing, and DB validation |

### Templates

| File | Description |
|------|-------------|
| `CLAUDE-template.md` | Template for generating project-specific `CLAUDE.md` rules |

## Installation

### Quick Install (into current project)

```bash
./install.sh
```

This copies the framework files into your project's `.claude/` directory under a `piv/` subfolder.

### Manual Install

```bash
# Copy commands (into piv/ subfolder)
mkdir -p /path/to/project/.claude/commands/piv
cp -r commands/* /path/to/project/.claude/commands/piv/

# Copy skills
cp -r skills/* /path/to/project/.claude/skills/

# Copy template
cp templates/CLAUDE-template.md /path/to/project/.claude/
```

### Via DevTemplate Menu

If using [devtemplate](https://github.com/Steve-Klingele/devtemplate), run the installation menu and select **PIV Framework** from the **Orchestration** category.

## Workflow

```
/piv/prime                              # 1. Load project context
/piv/plan-feature "Add user auth"       # 2. Create implementation plan
/piv/execute .agents/plans/add-user-auth.md  # 3. Execute the plan
/piv/commit                             # 4. Commit changes
```

For E2E testing after implementation, the `e2e-test` skill launches parallel sub-agents for structure analysis, DB schema mapping, and bug hunting, then tests every user journey with browser automation.

## Customization

- **`init-project.md`**: Replace with your project's setup commands
- **`CLAUDE-template.md`**: Adapt sections for your tech stack
- Commands are markdown files - edit them to fit your workflow

## Credits

Original framework by [Cole Medin](https://github.com/coleam00) in the [link-in-bio-page-builder](https://github.com/coleam00/link-in-bio-page-builder) project.
