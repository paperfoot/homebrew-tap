class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (13 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.8.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "d395541471078b433db5a1f4ca2ecf32457c6d3632e6a1d4ee314446af4d9907"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.8.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "3d584bdd6b8e40e4ba5779a2166397200f8f8568ffc36d830b06de7db96f3469"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.8.0", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
