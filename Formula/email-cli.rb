class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend"
  homepage "https://github.com/paperfoot/email-cli"
  url "https://github.com/paperfoot/email-cli/archive/refs/tags/v0.6.5.tar.gz"
  sha256 "52e25b16bcfcb6490612390c5131189aa286808616d94b8d79d881de13fea1e4"
  license "MIT"
  head "https://github.com/paperfoot/email-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "email-cli", shell_output("#{bin}/email-cli --version")
    assert_match "agent-info", shell_output("#{bin}/email-cli --help")
  end
end
