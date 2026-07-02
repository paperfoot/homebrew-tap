class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.7.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "d92ca7ed40ea15dffae406cc8235b1cedb1266c48f9f21d4b780020a46a82f4c"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.7.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "d65fc6bbaee77692b8fca6a6fb2f65df88b0e5582b3cce8a5b1c113ec4d62384"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.7.1", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
