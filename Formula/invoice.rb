class Invoice < Formula
  desc "Beautiful invoices from the CLI — international, stateful, agent-friendly"
  homepage "https://github.com/paperfoot/invoice-cli"
  # Install from crates.io — same reasoning as the contract formula:
  # the GitHub source has a path-dep on ../finance-core; the .crate
  # tarball is already path-free.
  url "https://static.crates.io/crates/invoice-cli/invoice-cli-0.5.13.crate"
  sha256 "361b36f05496649859758f82af0754c657be2dfbd87d6e820f6a41d352c0bac4"
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
