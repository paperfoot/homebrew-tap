class Gemtts < Formula
  desc "Agent-friendly Gemini TTS CLI for expressive scripts and audio files"
  homepage "https://github.com/paperfoot/gemtts"
  url "https://crates.io/api/v1/crates/gemtts/0.1.1/download"
  sha256 "9d634c4afe2f95c8b51178c9e67d0e4a131cb35937bab2a9aeccd0b448e2122a"
  license "MIT"

  depends_on "rust" => :build
  depends_on "ffmpeg"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "gemtts", shell_output("#{bin}/gemtts --version")

    manifest = shell_output("#{bin}/gemtts agent-info")
    assert_match "\"speak <text>\"", manifest
    assert_match "\"voices list\"", manifest

    voices = shell_output("#{bin}/gemtts voices list --json")
    assert_match "\"Kore\"", voices
  end
end
