class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "3c7b162a6fb9639c5d051959f73f598eebdcdb8f9855a41dd4b6604092a44891"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "21b3319679aa0a9d1add76d783d060e085a485accaae6857781f463ef334ac80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.0/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f97fb432d59df3d3b57a51563b8ebe6caac107ce4825b5e79a58f78198f965e"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.0/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6adcc8d06415a285c425649133ba7a25789abf952e83ce2a819dc7472accde61"
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
