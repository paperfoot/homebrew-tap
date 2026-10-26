class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.11.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.11.0/xmaster-aarch64-darwin"
      sha256 "8a8fbc74b2d3b6d91e510bc918c576240fa9a0d21d07432d3806bba280d7d1f5"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.11.0/xmaster-x86_64-darwin"
      sha256 "caa5245676d1d3ad93fff56787f02c60c095a8fc88168c7965ae756e565ee26e"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.11.0/xmaster-x86_64-linux"
    sha256 "8552c7fead4dc8a8f9218b3aec6d23211de37f99f919224d6dff5d0a491efade"
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
