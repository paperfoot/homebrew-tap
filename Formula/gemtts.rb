class Gemtts < Formula
  desc "Agent-friendly Gemini TTS CLI for expressive scripts and audio files"
  homepage "https://github.com/paperfoot/gemtts"
  url "https://crates.io/api/v1/crates/gemtts/0.1.3/download"
  sha256 "0adf6b7429e3f0519a522b01bee354b67403d76173686a8beb988c89b4ad1e42"
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
