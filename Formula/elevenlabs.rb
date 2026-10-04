class Elevenlabs < Formula
  desc "CLI for ElevenLabs speech, transcription, music, voices, and agents"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.1/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "230731066dd0f65a98ac20e78d9a2c2311a9f5535ee5d3ba8de8c424c1b679be"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.1/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "328be14273b626d812fca3baaf088539b9d4055a123908b60dc41d16c2e4abdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.1/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85b0d5f4bba5578f0d0dc2f89ce45d62134988bae4769087203725133285413f"
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

    catalog = JSON.parse(shell_output("#{bin}/elevenlabs api list"))
    assert_equal 406, catalog.fetch("data").fetch("total_operations")
    preview = JSON.parse(shell_output("#{bin}/elevenlabs api call history.list --query page_size=2 --dry-run"))
    assert_equal 2, preview.fetch("data").fetch("query").fetch("page_size")
  end
end
