class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.6.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "a12b5d0deca96e68d88e90bd2085122fad771417e0f3ed23cb4a61b94471e361"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.6.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "a5f69d9595b536e491a6cbe70873a768b768f5c36c0147b78fba5243356cd6ac"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.6.1", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
