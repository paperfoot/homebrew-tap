class Elevenlabs < Formula
  desc "CLI for ElevenLabs speech, transcription, music, voices, and agents"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.2/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "62dcd5c93d519f405ebdb65dba48be8efe230f4164e871e0f91b9e77b4dfd899"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.2/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "edf7e45e0ca0dea2ce6cfc6999085228fcd94ae790da3dddf319b7629c91d8bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.2/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70be843e4a0b51a034a985d6f174130e260d18529c598e083374f524d229860d"
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
