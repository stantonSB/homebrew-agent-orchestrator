cask "agent-orchestrator" do
  version "1.9.6"

  on_arm do
    sha256 "f2209c295f5a89a4c880b975d2c8b52d1e9aca4e00e348111782600a5806e698"
    url "https://github.com/stantonSB/Agent-Orchestrator/releases/download/v#{version}/AgentOrchestrator-v#{version}-aarch64.dmg"
  end

  on_intel do
    sha256 "343b4476112d8f8edc4406b1532deeb0afde1d3fc126b6b3a1df3aaabd39d8a9"
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
