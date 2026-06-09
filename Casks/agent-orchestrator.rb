cask "agent-orchestrator" do
  version "1.10.0"

  on_arm do
    sha256 "8bf69e4aeec0fc36d29f5fd102abe1b5931910a198528f10a9180f39a6790c6f"
    url "https://github.com/stantonSB/Agent-Orchestrator/releases/download/v#{version}/AgentOrchestrator-v#{version}-aarch64.dmg"
  end

  on_intel do
    sha256 "e00c9b707646e3f908759555378c9c906cf4115c0552a2b2057695e9e7d7f7a5"
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
