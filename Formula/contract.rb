class Contract < Formula
  desc "Beautiful contracts from the CLI — NDA, NCNDA, consulting, MSA, SOW, service, loan"
  homepage "https://github.com/paperfoot/contract-cli"
  # Install from crates.io rather than the GitHub tarball — the GitHub
  # source has a path-dep on ../finance-core which doesn't resolve at
  # brew build time. `cargo publish` already rewrote the dep to a
  # registry version in the .crate tarball.
  url "https://static.crates.io/crates/contract-cli/contract-cli-0.2.0.crate"
  sha256 "df2db217e134222ba36bb759fba896e3b908fb043d56ab19a786f4a49aa797e2"
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
