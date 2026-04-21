class Elevenlabs < Formula
  desc "Agent-friendly CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.2/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "e5eda84043bd66b97f4311bab0550a6a6a22bdf5fb7608a98cd3be4055675622"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.2/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "5223164d42bd89840c8d938b1011c17a282e8d305fef76037de98300c21cd9fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.2/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86b09d5fa4cddcf2e1c24542118a967c3423537d60d018a696d9063649725014"
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
