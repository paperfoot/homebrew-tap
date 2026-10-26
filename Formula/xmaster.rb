class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.12.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.12.1/xmaster-aarch64-darwin"
      sha256 "764e14d3bd9f3cb917beb449cd783a86843dc9cd1e5992ad80adc5f7377688b8"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.12.1/xmaster-x86_64-darwin"
      sha256 "f4a2d61452c5c0a30e82beacfee49e8e589f744f46118ce92487dd8666e7595e"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.12.1/xmaster-x86_64-linux"
    sha256 "dc1ce2bfabd8a796746961f7a64fc7678730b1a161e1ed33006960a3d0516573"
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
