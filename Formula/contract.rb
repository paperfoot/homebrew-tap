class Contract < Formula
  desc "Beautiful contracts from the CLI — NDA, consulting, MSA, SOW, service"
  homepage "https://github.com/paperfoot/contract-cli"
  # Install from crates.io rather than the GitHub tarball — the GitHub
  # source has a path-dep on ../finance-core which doesn't resolve at
  # brew build time. `cargo publish` already rewrote the dep to a
  # registry version in the .crate tarball.
  url "https://static.crates.io/crates/contract-cli/contract-cli-0.1.0.crate"
  sha256 "6d0f998ea2bb13bbec7be191883e3868c98882bd75f8818c29779422300719fc"
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
