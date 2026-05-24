class Aiseo < Formula
  desc "Agent-first SEO / GEO / AEO auditor"
  homepage "https://github.com/paperfoot/aiseo"
  url "https://github.com/paperfoot/aiseo/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "871dbae2c5b5e8334a657f5496d5609f5aee377ae24dfea95a71db703b77c14f"
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
