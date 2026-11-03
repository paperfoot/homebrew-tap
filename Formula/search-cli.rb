class SearchCli < Formula
  desc "Web search for AI agents: ten engines, auto routing, rank fusion, cost"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "bdf1a96e5f3b4c078eec548cf21eb3375ecddc5a1b36e2956d8414a793d84afb"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "d13461cda1cc2816edc466b5d8e22db3933991f3a9dd62974b0a78ed3ff5fb57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.1/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e5f6eac97aeb88a25add32b0134a1af16c9a633935b85d4e5e865e3529c19ec"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.11.1/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3d5bfd378a1e4debfa42ad173436e02477bad8d8bab7bc5b97710f04a7adef3"
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
