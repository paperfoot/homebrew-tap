class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.8.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.8.0/xmaster-aarch64-darwin"
      sha256 "024c527e7771581a2b79a025444868d552305405594317a0af6b6ea1ff565f4e"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.8.0/xmaster-x86_64-darwin"
      sha256 "d1b3fc98d9acccdf8e6948f189cd3a7863702c0e738bd08392412ca5fc130da1"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.8.0/xmaster-x86_64-linux"
    sha256 "869d35571a43f742e74c440013976a6c4b266274545907a9b6367338fb8a5127"
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
