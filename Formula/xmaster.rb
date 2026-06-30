class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.7.5"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.5/xmaster-aarch64-darwin"
      sha256 "50cb6567381db43672fb4b948d77fec92251a71a2fdac042329167ebb4fc49ad"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.5/xmaster-x86_64-darwin"
      sha256 "f13dde98d691b4e183b278ec053529f69934676633618fa7422b284518363db2"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.5/xmaster-x86_64-linux"
    sha256 "1f54bb1f425b9764fe4c380140f73f773cd6ed230a58251234189a7a394f70fc"
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
