class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "6e047d66c6194d632cbb4e5d9e834fbfbca805c670d1b85507f67439d1276445"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "cb6c1d30183a86191a23ee504f8245e4635a5a1a5d2346bcd03ce462103f29d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.1/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f3350850766eb1f3cf6e933f732a7da26ff6cbfeb851601a301548caabf4cd2"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.12.1/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a03425ab26c6a00d821e6ccb36e20fcb638b68be4a03854c48ad51ca8a02e3e"
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
