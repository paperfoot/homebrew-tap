class Contract < Formula
  desc "Beautiful contracts from the CLI — NDA, NCNDA, consulting, MSA, SOW, service, loan"
  homepage "https://github.com/paperfoot/contract-cli"
  # Install from crates.io rather than the GitHub tarball — the GitHub
  # source has a path-dep on ../finance-core which doesn't resolve at
  # brew build time. `cargo publish` already rewrote the dep to a
  # registry version in the .crate tarball.
  url "https://static.crates.io/crates/contract-cli/contract-cli-0.3.2.crate"
  sha256 "69f59cf8544c5d0621c56fcab8ed14592d22e64fe0f3be73370bd2a08d1a694a"
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
