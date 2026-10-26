class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.12.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.12.0/xmaster-aarch64-darwin"
      sha256 "147bfcaa1002f994c69217f17ec50429b2db92904f0486d330d2d7791c53fd17"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.12.0/xmaster-x86_64-darwin"
      sha256 "8d214ba39e3bca1d3ce4805e055f8e26771656054af0641635b3f85b0a77cdd0"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.12.0/xmaster-x86_64-linux"
    sha256 "9c60622cdaebad10e7765a496c8cda314a0763b17c5c7b60e411f3c03405a7d8"
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
