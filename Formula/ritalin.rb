class Ritalin < Formula
  desc "Executive function for AI coding agents"
  homepage "https://github.com/paperfoot/ritalin-cli"
  url "https://github.com/paperfoot/ritalin-cli/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "e7606ce452305c6844abfd1a1b309dc1c244d8733199ecb04bfda8067aee7753"
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
