class SearchCli < Formula
  desc "Web search for AI agents: ten engines, TikTok, YouTube, X, Reddit, rank fusion"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "960b993f596709064c3e269dc5da132100014c6f59ea6295879c5bd145c6c7c8"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "e2eb8040bbcb0b5606ebc69c9e566fe65a8524839d185b1a33c70fb5c5e92bfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.0/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72da552e2d4a0ab795c18be779ab1638bbae485d66e89c7e602630ab2ab76873"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.13.0/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b2fea4643c2a91d0840f57b307ddf2fadd1bc87fc9f0556009621f3178dacce"
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
