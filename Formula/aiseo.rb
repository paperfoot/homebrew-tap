class Aiseo < Formula
  desc "Agent-first SEO / GEO / AEO auditor"
  homepage "https://github.com/paperfoot/aiseo"
  url "https://github.com/paperfoot/aiseo/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "f2d55dabb13e0cf986337288072fba937fa21bda47f25242317654c370dcdd32"
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
