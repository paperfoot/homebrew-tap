class Ritalin < Formula
  desc "Executive function for AI coding agents"
  homepage "https://github.com/paperfoot/ritalin-cli"
  url "https://github.com/paperfoot/ritalin-cli/archive/refs/tags/v0.4.6.tar.gz"
  sha256 "3f472221ee748992799bb150bde1aeab69ae9fd582a33fcd35d72fa0da92ed0d"
  license "MIT"
  head "https://github.com/paperfoot/ritalin-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "ritalin", shell_output("#{bin}/ritalin --version")
    assert_match "success", shell_output("#{bin}/ritalin agent-info")
  end
end
