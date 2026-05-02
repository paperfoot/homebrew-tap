class GeminiTtsCli < Formula
  desc "Agent-friendly Gemini TTS CLI for expressive scripts and audio files"
  homepage "https://github.com/paperfoot/gemini-tts-cli"
  url "https://crates.io/api/v1/crates/gemini-tts-cli/0.1.1/download"
  sha256 "05b6f1b8426901633b59d2f61d79be6784e8b9b8d40316f482d0da89943cf9c5"
  license "MIT"

  depends_on "rust" => :build
  depends_on "ffmpeg"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "gemini-tts-cli", shell_output("#{bin}/gemini-tts-cli --version")

    manifest = shell_output("#{bin}/gemini-tts-cli agent-info")
    assert_match "\"speak <text>\"", manifest
    assert_match "\"voices list\"", manifest

    voices = shell_output("#{bin}/gemini-tts-cli voices list --json")
    assert_match "\"Kore\"", voices
  end
end
