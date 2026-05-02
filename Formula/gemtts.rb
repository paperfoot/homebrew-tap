class Gemtts < Formula
  desc "Agent-friendly Gemini TTS CLI for expressive scripts and audio files"
  homepage "https://github.com/paperfoot/gemtts"
  url "https://crates.io/api/v1/crates/gemtts/0.1.4/download"
  sha256 "dddbe87ae634421ef9722ed3f65458b13a73ac5cf13022b4e9a482e356f5263f"
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
