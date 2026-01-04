# 06. Tools and Integrations

This document describes external tools and integrations available to AI agents working on the Cackle project.

## 6.1. Overview

AI agents may have access to various tools and services depending on their capabilities. This document covers integrations that enhance the development workflow, particularly for notifications and communication.

**Important:** Not all agents support all integrations. Features requiring MCP (Model Context Protocol) support are optional for agents without this capability.

---

## 6.2. Slack Notifications (MCP)

The Slack notifications integration allows AI agents to send messages to Slack channels when completing milestones, such as committing code to the repository.

### Supported Agents

- **Claude Code**: Full MCP support via the `slack-notifications` MCP server
- **Other agents**: This feature is optional. Agents without MCP support may skip Slack notifications.

### Prerequisites

1. A Slack workspace with a bot token
2. The `slack-notifications` MCP server (from the `slack-agent` project)
3. An MCP-compatible AI agent

### Configuration for Claude Code

Add the following to your Claude Code MCP configuration:

```json
{
  "mcpServers": {
    "slack-notifications": {
      "command": "python",
      "args": ["/path/to/slack-agent/slack_mcp_server.py"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-your-bot-token-here",
        "SLACK_DEFAULT_CHANNEL": "#dev-notifications"
      }
    }
  }
}
```

### Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SLACK_BOT_TOKEN` | Yes | - | Slack bot token (starts with `xoxb-`) |
| `SLACK_DEFAULT_CHANNEL` | No | `#general` | Default channel for notifications |
| `SLACK_TIMEOUT` | No | `30` | Request timeout in seconds |
| `SLACK_MAX_RETRIES` | No | `3` | Maximum retry attempts |

### Available MCP Tools

#### `send_slack_message`
Send a notification message to Slack.

**Parameters:**
- `message` (string, required): The message to send
- `channel` (string, optional): Target channel (uses default if not specified)
- `level` (string, optional): Message level - `info`, `success`, `warning`, or `error`

**Example:**
```
send_slack_message("Completed implementation of user authentication", "#dev-notifications", "success")
```

#### `send_slack_success`
Send a success notification (convenience wrapper).

**Parameters:**
- `message` (string, required): The success message
- `channel` (string, optional): Target channel

**Example:**
```
send_slack_success("All tests passing", "#ci-cd")
```

#### `send_slack_warning`
Send a warning notification.

**Parameters:**
- `message` (string, required): The warning message
- `channel` (string, optional): Target channel

#### `send_slack_error`
Send an error notification.

**Parameters:**
- `message` (string, required): The error message
- `channel` (string, optional): Target channel

### When to Send Notifications

Per `AGENTS.md` Rule 5, agents with MCP support should send a Slack notification each time they commit to the local git repository. Example workflow:

1. Agent completes implementation
2. Agent commits changes: `git commit -m "Add user authentication endpoint"`
3. Agent sends notification: `send_slack_success("Committed: Add user authentication endpoint", "#dev-notifications")`

### Obtaining a Slack Bot Token

1. Go to [Slack API](https://api.slack.com/apps)
2. Create a new app or select an existing one
3. Navigate to "OAuth & Permissions"
4. Add the following bot token scopes:
   - `chat:write` - Send messages
   - `channels:read` - View basic channel info (optional)
5. Install the app to your workspace
6. Copy the "Bot User OAuth Token" (starts with `xoxb-`)

### Troubleshooting

**Messages not sending:**
- Verify the bot token is valid and has `chat:write` scope
- Ensure the bot has been invited to the target channel
- Check that channel names include the `#` prefix

**MCP server won't start:**
- Verify Python 3.8+ is installed
- Check that all dependencies are installed: `pip install -r requirements.txt`
- Ensure `SLACK_BOT_TOKEN` environment variable is set

---

## 6.3. Future Integrations

This section is reserved for additional tool integrations as they are added to the project. Potential future integrations include:

- CI/CD pipeline notifications
- Issue tracker integration
- Code review automation
