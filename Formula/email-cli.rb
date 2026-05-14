class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend"
  homepage "https://github.com/paperfoot/email-cli"
  url "https://github.com/paperfoot/email-cli/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "adb34d3430500d8e47208392fe4fb4528009b2c740f714edd9c1288d1c68811e"
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
