class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.7.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.2/xmaster-aarch64-darwin"
      sha256 "fa1151d6d46be5639872ce9cc6f820cbde6665bb20852d96364abed8b30596bb"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.2/xmaster-x86_64-darwin"
      sha256 "e5e4e78abe3cbdad725ed993112d7f3666c50f5367042e7ef25993d1d23aa5df"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.2/xmaster-x86_64-linux"
    sha256 "611ce378d5ad84a77cc446858905c94f3fbc12ece5104482fedd07688f67bb9d"
  end

  def install
    binary = Dir["xmaster*"].first
    bin.install binary => "xmaster"
  end

  test do
    assert_match "xmaster", shell_output("#{bin}/xmaster --version")
    assert_match "success", shell_output("#{bin}/xmaster agent-info")
  end
end
