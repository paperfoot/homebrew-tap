class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "9fd2cc1005828962a021a1c6bf67424e41d8c4bc3e8f40f86854019593e6be9b"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "6fbec2a1dea0f0b609272d35efadd8e6815553fdd9922dac7316816f6cec01c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.0/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85648cef55cefb3985379b15d276d43463d610046fedacb7990c03ff9d6cbf78"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.0/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8ca67cba27ab739af884d55fa398e62c1bc22871a1efb04ded93adac839f404"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search #{version}", shell_output("#{bin}/search --version")
    assert_match "login", shell_output("#{bin}/search --help")
  end
end
