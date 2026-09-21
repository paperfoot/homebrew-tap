class Elevenlabs < Formula
  desc "CLI for ElevenLabs speech, transcription, music, voices, and agents"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.0/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "efcfb38554911ba1e27ca053189fdb9faa9b2f408d209cfd097365e039b2aec1"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.0/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "4977a517ef56edff3d1bd9191c9679b349f97d1b27bd502e0261fd1aed9f147a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.4.0/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a2b6c2aee3d892904674d5c4f75b9e6fd0be12682ab6a2f8e2327b8008034fa"
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
    assert_equal 391, catalog.fetch("data").fetch("total_operations")
    preview = JSON.parse(shell_output("#{bin}/elevenlabs api call history.list --query page_size=2 --dry-run"))
    assert_equal 2, preview.fetch("data").fetch("query").fetch("page_size")
  end
end
