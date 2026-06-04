class Engram < Formula
  desc "Local-first domain expertise and memory CLI for AI agents"
  homepage "https://github.com/paperfoot/engram-cli"
  url "https://crates.io/api/v1/crates/paperfoot-engram/0.1.3/download"
  sha256 "33a80d59fe15050a1de4bfd3d311b6b6a29adca666622465aed70f2ee6e64177"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "engram 0.1.3", shell_output("#{bin}/engram --version")
    assert_match "--dry-run", shell_output("#{bin}/engram ingest --help")
    assert_match "Local engram daemon/API", shell_output("#{bin}/engramd --help")
  end
end
