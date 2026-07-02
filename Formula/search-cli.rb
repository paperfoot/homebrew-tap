class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.7.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "b289eda639c269c97da0ed082c8bb0dd99bdcc59a020fb55c7fc6fa1a9651f95"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.7.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "bb82590264d64229d80b2a9a6524262ed1c82a26235fb433682c9af22ae92759"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.7.0", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
