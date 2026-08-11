class Engram < Formula
  desc "Local-first domain expertise and memory CLI for AI agents"
  homepage "https://github.com/paperfoot/engram-cli"
  url "https://static.crates.io/crates/paperfoot-engram/paperfoot-engram-0.4.1.crate"
  sha256 "3ddba808bd6620d95839373f0d4776e02705b0111db1eaee92ed4ee164dfb3fc"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "engram 0.4.1", shell_output("#{bin}/engram --version")
    assert_match "--dry-run", shell_output("#{bin}/engram ingest --help")
    assert_match "Local engram daemon/API", shell_output("#{bin}/engramd --help")
  end
end
