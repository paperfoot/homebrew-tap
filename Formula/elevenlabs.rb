class Elevenlabs < Formula
  desc "Agent-friendly CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.1/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "788f33f68196d59e79f5c657a5166f89ec8a2fff24098673bfe543cc77558d4b"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.1/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "c284e574d913c8171ffc6f69af0ce4fe53bfeeda4f29e1270fbfc837e75d14fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.1/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f02f07496d61f658a5ccbf6f3fc9561947f60334f9007c1ec75974b51efdd5e"
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
