class Elevenlabs < Formula
  desc "Agent-friendly CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.2/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "9235a65a42232b3d8308ae1dc2367f08937d15306dc375f5966820b907e5737e"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.2/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "f50cd3235703863582c768e14484676bbfe1767b9a62817dfe6f5eefbe086337"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.2/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b20a0abb1c9c72b0bfad5bbe0605152b2f850258daed3ec5922874ff8a5e5678"
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
