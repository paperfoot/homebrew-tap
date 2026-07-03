class Aiseo < Formula
  desc "Agent-first SEO / GEO / AEO auditor"
  homepage "https://github.com/paperfoot/aiseo"
  url "https://github.com/paperfoot/aiseo/archive/refs/tags/v0.7.5.tar.gz"
  sha256 "c87d8b87d73aac07c6aa9cf79a173bf3830b18c76833ab50e581749cbc6b3716"
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
