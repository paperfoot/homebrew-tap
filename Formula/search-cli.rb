class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "677d17064f390188fbabbc3ebd5c77e0610366bea0f921a00272a1666b9630ef"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "ad36b722cac01e174e6c4a35be757c4e663985ceb269110f1147e597e3e076df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.1/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f95c1c0f46c296a9eb9883588fef53969f1c60be1398eb50234046219d5873c"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.14.1/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbd756c08adf6ce5a128e162a7552c3a68240118c7a24e87caa2096a1340b996"
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
