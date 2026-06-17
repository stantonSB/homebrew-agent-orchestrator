cask "agent-orchestrator" do
  version "1.12.0"

  on_arm do
    sha256 "196f6f342abc9c396aab6f2f8d579293c7f2564badaefbfe3654629acbbe7f82"
    url "https://github.com/stantonSB/Agent-Orchestrator/releases/download/v#{version}/AgentOrchestrator-v#{version}-aarch64.dmg"
  end

  on_intel do
    sha256 "cb1f10e66020ab05eb115e287906ccb21b05b52e80253c67a99e28aec4fa817e"
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
