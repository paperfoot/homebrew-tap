class Engram < Formula
  desc "Local-first domain expertise and memory CLI for AI agents"
  homepage "https://github.com/paperfoot/engram-cli"
  url "https://crates.io/api/v1/crates/paperfoot-engram/0.1.2/download"
  sha256 "eddbff27eb33a3d9b35575b77fe2718c7a69ef990610341c76afd9d95f7a7fa1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "engram 0.1.2", shell_output("#{bin}/engram --version")
    assert_match "--dry-run", shell_output("#{bin}/engram ingest --help")
    assert_match "Local engram daemon/API", shell_output("#{bin}/engramd --help")
  end
end
