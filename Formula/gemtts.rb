class Gemtts < Formula
  desc "Agent-friendly Gemini TTS CLI for expressive scripts and audio files"
  homepage "https://github.com/paperfoot/gemtts"
  url "https://crates.io/api/v1/crates/gemtts/0.1.2/download"
  sha256 "d262a230d27a4031e4be9ba906ddd469234eebff19f19f01fb42fdfdb7ebb998"
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
