class Contract < Formula
  desc "Beautiful contracts from the CLI — NDA, consulting, MSA, SOW, service"
  homepage "https://github.com/paperfoot/contract-cli"
  url "https://github.com/paperfoot/contract-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c47aaa70e85f1b04e58e5ead3aa69b403b197750f54538e4c2413a900361a194"
  license "MIT"
  head "https://github.com/paperfoot/contract-cli.git", branch: "main"

  depends_on "rust" => :build
  depends_on "typst"

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "contract", shell_output("#{bin}/contract --version")
    assert_match "agent-info", shell_output("#{bin}/contract --help")
  end
end
