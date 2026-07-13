class Contract < Formula
  desc "Beautiful contracts from the CLI — NDA, NCNDA, consulting, MSA, SOW, service, loan"
  homepage "https://github.com/paperfoot/contract-cli"
  # Install from crates.io rather than the GitHub tarball — the GitHub
  # source has a path-dep on ../finance-core which doesn't resolve at
  # brew build time. `cargo publish` already rewrote the dep to a
  # registry version in the .crate tarball.
  url "https://static.crates.io/crates/contract-cli/contract-cli-0.2.1.crate"
  sha256 "d0556d4a9694b15f500be43cc3cfe3febd073d51e76a9a065e4971e9abfdbf4f"
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
