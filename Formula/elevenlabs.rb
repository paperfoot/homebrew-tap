class Elevenlabs < Formula
  desc "Agent-friendly CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.1/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "2d03a2a6103fb13fbb102832d3f88ede8d54c3fdbc134f2e938b18ba2b106bd5"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.1/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "071ab68fa3e24c9f3773f95a22b9d90d5d137c974321ec76f9770d16ae2d1301"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.1/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d2d90b150218030d668ca519873b833ce47d2857b0ea29e617cf361b897bbc9"
    end
  end

  def install
    bin.install "elevenlabs"
  end

  test do
    assert_match "elevenlabs", shell_output("#{bin}/elevenlabs --version")
    assert_match "agent-info", shell_output("#{bin}/elevenlabs --help")

    # Structured manifest must parse as JSON and list known commands.
    manifest = shell_output("#{bin}/elevenlabs agent-info")
    assert_match "\"commands\"", manifest
    assert_match "\"tts <text>\"", manifest
  end
end
