---
description: Initialize and set up the project for local development
---

# Initialize Project

Analyze the project structure and run the necessary commands to set up and start the project locally.

## Process

### 1. Detect Project Type

Examine the repository for configuration files to determine the stack:

- `package.json` → Node.js (check for `npm`, `yarn`, `pnpm`, `bun`)
- `pyproject.toml` / `requirements.txt` → Python (check for `uv`, `pip`, `poetry`)
- `go.mod` → Go
- `Cargo.toml` → Rust
- `docker-compose.yml` / `compose.yml` → Docker services
- `.env.example` → Environment configuration needed

### 2. Create Environment File

```bash
# Copy environment template if it exists
cp .env.example .env 2>/dev/null || echo "No .env.example found"
```

Review `.env` and note any required values (API keys, database URLs, etc.).

### 3. Install Dependencies

Run the appropriate install command based on the detected package manager.

### 4. Set Up Services

If the project uses databases or other services (Docker, local DB, etc.), start them.

### 5. Run Migrations

If the project has database migrations, apply them.

### 6. Start Development Server

Start the development server using the project's dev command.

### 7. Validate Setup

Verify the application is running and healthy:
- Check health endpoints if available
- Confirm the main page loads
- Verify database connectivity

## Output

Report the access points, running services, and any manual configuration still needed.

## Notes

- Customize this file with your project's specific setup commands
- Replace the generic steps above with exact commands for your stack
- Keep validation steps non-interactive and scriptable
