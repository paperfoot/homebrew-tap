class Aiseo < Formula
  desc "Agent-first SEO / GEO / AEO auditor"
  homepage "https://github.com/paperfoot/aiseo"
  url "https://github.com/paperfoot/aiseo/archive/refs/tags/v0.7.4.tar.gz"
  sha256 "e3ea69d44b9372ffdc072f5bb3a3b3da67d4a4fac7ddfb7d0e5a1daecd24a45f"
  license "MIT"
  head "https://github.com/paperfoot/aiseo.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "aiseo", shell_output("#{bin}/aiseo --version")
    assert_match "audit", shell_output("#{bin}/aiseo --help")
  end
end
