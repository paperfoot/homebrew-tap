class Anima < Formula
  desc "Agent-friendly local Anima Base v1.0 anime/manga/comic image-gen CLI"
  homepage "https://github.com/paperfoot/anima"
  url "https://github.com/paperfoot/anima/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/paperfoot/anima.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "anima", shell_output("#{bin}/anima --version")
    assert_match "generate", shell_output("#{bin}/anima --help")
  end
end
