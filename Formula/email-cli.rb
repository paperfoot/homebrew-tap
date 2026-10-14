class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend"
  homepage "https://github.com/paperfoot/email-cli"
  url "https://github.com/paperfoot/email-cli/archive/refs/tags/v0.7.7.tar.gz"
  sha256 "804076dfab34c3fb7f55486a0c4f071977e1c0b79622d25380cb1c79a5025cf4"
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
