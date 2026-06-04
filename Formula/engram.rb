class Engram < Formula
  desc "Local-first domain expertise and memory CLI for AI agents"
  homepage "https://github.com/paperfoot/engram-cli"
  url "https://static.crates.io/crates/paperfoot-engram/paperfoot-engram-0.1.4.crate"
  sha256 "34fafcff44e01f621d7e853fc99d6d3d929064d8ff22dab1654c137cd9a4566b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "engram 0.1.4", shell_output("#{bin}/engram --version")
    assert_match "--dry-run", shell_output("#{bin}/engram ingest --help")
    assert_match "Local engram daemon/API", shell_output("#{bin}/engramd --help")
  end
end
