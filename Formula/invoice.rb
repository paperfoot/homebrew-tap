class Invoice < Formula
  desc "Beautiful invoices from the CLI — international, stateful, agent-friendly"
  homepage "https://github.com/paperfoot/invoice-cli"
  url "https://github.com/paperfoot/invoice-cli/archive/refs/tags/v0.5.13.tar.gz"
  sha256 "51ad567502f48c1c7203a48050282b511e51ec96aec711f0ca22a56050ae6f53"
  license "MIT"
  head "https://github.com/paperfoot/invoice-cli.git", branch: "main"

  depends_on "rust" => :build
  depends_on "typst"

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "invoice", shell_output("#{bin}/invoice --version")
    assert_match "agent-info", shell_output("#{bin}/invoice --help")
  end
end
