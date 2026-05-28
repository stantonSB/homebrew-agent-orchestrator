cask "agent-orchestrator" do
  version "1.8.0"

  on_arm do
    sha256 "c8c309604953a2c64c25f1c390ee080b686b862a2ee0b90a8cb33248c787933c"
    url "https://github.com/stantonSB/Agent-Orchestrator/releases/download/v#{version}/AgentOrchestrator-v#{version}-aarch64.dmg"
  end

  on_intel do
    sha256 "X86_64_SHA256"
    url "https://github.com/stantonSB/Agent-Orchestrator/releases/download/v#{version}/AgentOrchestrator-v#{version}-x86_64.dmg"
  end

  name "Agent Orchestrator"
  desc "Desktop app for running parallel Claude Code terminal sessions"
  homepage "https://github.com/stantonSB/Agent-Orchestrator"

  livecheck do
    url "https://github.com/stantonSB/Agent-Orchestrator"
    strategy :github_latest
  end

  app "Agent Orchestrator.app"

  zap trash: [
    "~/Library/Application Support/com.xbridge.agent-orchestrator",
    "~/Library/Caches/com.xbridge.agent-orchestrator",
    "~/Library/Preferences/com.xbridge.agent-orchestrator.plist",
    "~/Library/Saved Application State/com.xbridge.agent-orchestrator.savedState",
  ]
  # Note: Agent Orchestrator installs hooks in ~/.claude/settings.json and
  # ~/.claude.json on first launch. These are shared config files used by
  # Claude Code and are intentionally NOT removed on uninstall to avoid
  # breaking other tools. Users can manually remove the
  # "agent-orchestrator-notify" hook entries if desired.
end
