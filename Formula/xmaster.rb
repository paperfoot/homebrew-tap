class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.9.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.9.1/xmaster-aarch64-darwin"
      sha256 "2cf7335cb7d3b20b7d35c3aea48ba1325e51b800c9bac20a54b79843240cd0e5"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.9.1/xmaster-x86_64-darwin"
      sha256 "38f4769208b0ec6a583657713c1433927cd28d05487e44a2d2a1a35cf69e6256"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.9.1/xmaster-x86_64-linux"
    sha256 "9b65e995013dd3ce0b931058a1e9ac9ee7f5ef39fb0f51a9aea722ec934530ee"
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
