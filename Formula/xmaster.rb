class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.7.4"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.4/xmaster-aarch64-darwin"
      sha256 "d48c7dac1fc15a7c96d076df5cec6f415f602f7a3ef2765452b1ec69a7b9334e"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.4/xmaster-x86_64-darwin"
      sha256 "a0bb6d59d247e799291cfc039cdde2c1257f31291659cec681983135a60bc6ad"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.4/xmaster-x86_64-linux"
    sha256 "f15d4cd72a2becf1872b5a5cfda9fd22be84c3755dc817c845cddd69c61a9424"
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
