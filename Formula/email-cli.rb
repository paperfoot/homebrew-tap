class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend"
  homepage "https://github.com/paperfoot/email-cli"
  url "https://github.com/paperfoot/email-cli/archive/refs/tags/v0.6.6.tar.gz"
  sha256 "950a442c365a35941b626ed3533445d6df00998c4a4eaccb25553c38d851aa80"
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
