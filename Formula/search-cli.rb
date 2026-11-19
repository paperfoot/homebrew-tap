class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.2/search-aarch64-apple-darwin.tar.gz"
      sha256 "da517288c63d74ec201ba0307a9e5c68bcd04343240dc60e2ad13377efd46be3"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.2/search-x86_64-apple-darwin.tar.gz"
      sha256 "d137eafc5fbd22f40c44ab5ba20b5b91e61516bfbca8014e0cdd115db42f8c18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.2/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccdcd6bb794d235a68dffe9e5e97065da07f846ca6f0751b2fb30ed476219078"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.2/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fa58e83698b38be01ba726a7ab56bfcf38885d29ac9d5faa6c6e834e3f6aa5a"
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
