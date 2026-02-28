#!/bin/bash
# PIV Framework Installer
# Copies framework files into the target project's .claude/ directory
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine target directory
TARGET_DIR="${1:-.}"
CLAUDE_DIR="${TARGET_DIR}/.claude"

echo "PIV Framework Installer"
echo "======================="
echo ""
echo "Target: ${TARGET_DIR}"
echo ""

# Create directory structure
mkdir -p "${CLAUDE_DIR}/commands/piv"
mkdir -p "${CLAUDE_DIR}/skills/agent-browser"
mkdir -p "${CLAUDE_DIR}/skills/e2e-test"
mkdir -p "${TARGET_DIR}/.agents/plans"

# Copy commands into piv/ subfolder
echo "Installing commands to .claude/commands/piv/ ..."
for cmd in "${SCRIPT_DIR}/commands/"*.md; do
    filename=$(basename "$cmd")
    if [ -f "${CLAUDE_DIR}/commands/piv/${filename}" ]; then
        echo "  Skipping ${filename} (already exists)"
    else
        cp "$cmd" "${CLAUDE_DIR}/commands/piv/"
        echo "  Installed ${filename}"
    fi
done

# Copy skills
echo "Installing skills..."
for skill_dir in "${SCRIPT_DIR}/skills/"*/; do
    skill_name=$(basename "$skill_dir")
    if [ -f "${CLAUDE_DIR}/skills/${skill_name}/SKILL.md" ]; then
        echo "  Skipping ${skill_name}/SKILL.md (already exists)"
    else
        cp "${skill_dir}SKILL.md" "${CLAUDE_DIR}/skills/${skill_name}/"
        echo "  Installed ${skill_name}/SKILL.md"
    fi
done

# Copy template
echo "Installing templates..."
if [ -f "${CLAUDE_DIR}/CLAUDE-template.md" ]; then
    echo "  Skipping CLAUDE-template.md (already exists)"
else
    cp "${SCRIPT_DIR}/templates/CLAUDE-template.md" "${CLAUDE_DIR}/"
    echo "  Installed CLAUDE-template.md"
fi

echo ""
echo "PIV Framework installed to ${CLAUDE_DIR}/"
echo ""
echo "Available commands (namespaced under /piv/):"
echo "  /piv/prime          - Load project context"
echo "  /piv/plan-feature   - Create implementation plan"
echo "  /piv/execute        - Execute a plan"
echo "  /piv/create-rules   - Generate CLAUDE.md"
echo "  /piv/create-prd     - Generate PRD"
echo "  /piv/init-project   - Project setup"
echo "  /piv/commit         - Git commit workflow"
echo ""
echo "Next steps:"
echo "  1. Customize .claude/commands/piv/init-project.md for your project"
echo "  2. Run /piv/create-rules to generate your CLAUDE.md"
echo "  3. Run /piv/prime to load project context"
