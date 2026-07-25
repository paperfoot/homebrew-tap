class SearchCli < Formula
  desc "Multi-provider search CLI for AI agents (13 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.9.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "349db03ab8dcc376a1ca09ef67fe6868fb0ee826db39a2b56f29fe3ba91a9ac7"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.9.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "39e253c8c0c352cc37f205f24b07c3ca4ce93e2784cccaecd54ae9c5367b7666"
    end
  end

  # Linux ships without the stealth provider: wreq/BoringSSL does not link
  # there, so the extract chain starts at jina instead.
  on_linux do
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.9.0/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70d266b1f6519555b152d7fb6f8a2585edc434c784c8b0bd2aeec062d7f247da"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.9.0", shell_output("#{bin}/search --version")
    assert_match "login", shell_output("#{bin}/search --help")
  end
end
