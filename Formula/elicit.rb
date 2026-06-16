class Elicit < Formula
  desc "Agent-grade CLI for the Elicit research API: search, reports, systematic reviews"
  homepage "https://github.com/paperfoot/elicit-cli"
  url "https://github.com/paperfoot/elicit-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "09dfb036a0d06239161615985f9b69d50ff9fff6841e8c9930c9484d8e20264c"
  license "MIT"
  head "https://github.com/paperfoot/elicit-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "elicit", shell_output("#{bin}/elicit --version")
  end
end
