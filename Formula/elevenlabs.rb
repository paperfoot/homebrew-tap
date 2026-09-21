class Elevenlabs < Formula
  desc "CLI for ElevenLabs speech, transcription, music, voices, and agents"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.3/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "16590f06a858425d14c361e2bd2ca138fe50cdfc6cb7bfe1f6222020b89ccd9b"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.3/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "0ea700cbe8780f802b110d931bd246a7a37833aab3a7001a27fbc8645c1a7d19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.3.3/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fe554bc2b86f1078e141ca5606d87220755cc7a4714670af0b6a21c0431d4d1"
    end
  end

  def install
    bin.install "elevenlabs"
  end

  test do
    require "json"

    assert_match "elevenlabs", shell_output("#{bin}/elevenlabs --version")
    assert_match "agent-info", shell_output("#{bin}/elevenlabs --help")

    # Structured manifest must parse as JSON and list known commands.
    manifest = shell_output("#{bin}/elevenlabs agent-info")
    assert_match "\"commands\"", manifest
    assert_match "\"tts <text>\"", manifest

    scoped = JSON.parse(shell_output("#{bin}/elevenlabs agent-info --command tts"))
    assert_equal ["tts <text>"], scoped.fetch("commands").keys
  end
end
