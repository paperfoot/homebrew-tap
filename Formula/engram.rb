class Engram < Formula
  desc "Local-first domain expertise and memory CLI for AI agents"
  homepage "https://github.com/paperfoot/engram-cli"
  url "https://crates.io/api/v1/crates/paperfoot-engram/0.1.1/download"
  sha256 "da17b228d4857a45b0b28ba490d3a08036ed55cb069f628fe01f31b9a869d57c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "engram 0.1.1", shell_output("#{bin}/engram --version")
    assert_match "--dry-run", shell_output("#{bin}/engram ingest --help")
    assert_match "Local engram daemon/API", shell_output("#{bin}/engramd --help")
  end
end
