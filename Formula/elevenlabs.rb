class Elevenlabs < Formula
  desc "Agent-friendly CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.0/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "5fa2d1e7231510a4bd365100e697a8ed34cb3d8f329f2a5822dba55c44a293c8"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.0/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "ed4806def794652c81ce3cb2f54e96f02126c4efb4217a0f46d0b4478afd4c1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.0/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20aeaa54212dfb3c914e13a50b1735e57323aa86030321e28f5c2f09d14ba146"
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
