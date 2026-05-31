class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.6.2/search-aarch64-apple-darwin.tar.gz"
      sha256 "f52ca13d9c26f6fce7ec6839a1dc3904f05c8497b7891e47fd50948ad254c831"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.6.2/search-x86_64-apple-darwin.tar.gz"
      sha256 "25885fb9276b54f480eb6099470a2f6ebcbf18952a8eb75928ae390ba3376bdf"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.6.2", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
