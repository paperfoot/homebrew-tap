class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend"
  homepage "https://github.com/paperfoot/email-cli"
  url "https://github.com/paperfoot/email-cli/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "728e21ee6e82ae4b3f9f9f148a7ba9c0b28e5870ead4c6d9196bff4d7872c100"
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
