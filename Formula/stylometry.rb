class Stylometry < Formula
  desc "Authorship-verification CLI with calibrated Burrows/Cosine Delta"
  homepage "https://github.com/paperfoot/stylometry-cli"
  url "https://github.com/paperfoot/stylometry-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "cb2577ee0a54502f5b4b0124ef6228592d5e66c774f94290e76bfe679a571fcd"
  license "MIT"
  head "https://github.com/paperfoot/stylometry-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "stylometry", shell_output("#{bin}/stylometry --version")
    assert_match "success", shell_output("#{bin}/stylometry agent-info")
  end
end
