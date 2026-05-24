class Aiseo < Formula
  desc "Agent-first SEO / GEO / AEO auditor"
  homepage "https://github.com/paperfoot/aiseo"
  url "https://github.com/paperfoot/aiseo/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "697a3434093e9d9c3880a581ed73151485398a518b305ab3841d2439cafe10d2"
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
