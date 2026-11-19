class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "dd43ca68d6127d06fec953bc4af542112c875e9b9e9b62582c415ab419c2bf83"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "b06a5451f0550267d7db2a11bae3b44f9a7708f099a02c62e99dc49c9b810ca5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.1/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "370237272f0c788c195dac61f7476d644ac6f3b21fbcdc2f6681c782fe0f6bf2"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.1/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e598e2e26131710f15d2c7ba51267608b85891afc7895e331dab590da64d5ea4"
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
