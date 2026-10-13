class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.10.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.10.0/xmaster-aarch64-darwin"
      sha256 "febb15fa8228059fc4d0f848df0e32702d186df7d540c964184caefc131d1c06"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.10.0/xmaster-x86_64-darwin"
      sha256 "f6c34de428ae6adbdb7afd966bf05ea96d2a1eb40752b75dea1b1a1d554dff5d"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.10.0/xmaster-x86_64-linux"
    sha256 "1fb63a7d197b03f85c4c0e26084dd95d5d810556036c0566cace268eb4836e33"
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
