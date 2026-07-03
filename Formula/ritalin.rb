class Ritalin < Formula
  desc "Executive function for AI coding agents"
  homepage "https://github.com/paperfoot/ritalin-cli"
  url "https://github.com/paperfoot/ritalin-cli/archive/refs/tags/v0.4.7.tar.gz"
  sha256 "5cf1bfa436f7e8677899f738f91579883b564616de8333158e9da873581b7c91"
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
