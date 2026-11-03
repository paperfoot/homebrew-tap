class SearchCli < Formula
  desc "Web search for AI agents: ten engines, auto routing, rank fusion, cost"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "7860343072925e8f3f1a4d3eee85ec59a37e5b9b4104bcf04d79f6f35becd371"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "37848231881ca88134360e8184a8008c811dae906b0393bfa787b507bf1ccceb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.0/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcea53bf0d67398302d6d5a6bde7d947658f99746e1b8136a991df113c0340f1"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.0/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aaaaecb7d06d8acb587c2a509fd5bc8a90601698eb6b10c6dc2d1b4befb110f3"
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
