class GeminiTtsCli < Formula
  desc "Agent-friendly Gemini TTS CLI for expressive scripts and audio files"
  homepage "https://github.com/paperfoot/gemini-tts-cli"
  url "https://crates.io/api/v1/crates/gemini-tts-cli/0.1.0/download"
  sha256 "979c74ca68946f43b272907c0a77670b9499d7e8b96d2d8285f36e8292fae5c2"
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
