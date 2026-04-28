class Engram < Formula
  desc "Local-first domain expertise and memory CLI for AI agents"
  homepage "https://github.com/paperfoot/engram-cli"
  url "https://crates.io/api/v1/crates/paperfoot-engram/0.1.0/download"
  sha256 "55c396f05e48797da586dde8aa2725ad9be7dcac9ac95ebe5fefac972b55faca"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "engram 0.1.0", shell_output("#{bin}/engram --version")
    assert_match "Local engram daemon/API", shell_output("#{bin}/engramd --help")
  end
end
