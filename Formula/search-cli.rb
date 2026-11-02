class SearchCli < Formula
  desc "Multi-provider search CLI for AI agents (13 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "451dc90f149559e8a0f4fe0e26f698fe8dd408fb6efc418702d84a04056270f7"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "a0a07e882eb773f6fdd8091399dcffe65d308ea631037d65f93b8f3ac745ea9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.0/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8580676c6ef4a88556ebcee50fdd5b53d8b76e60ef70038d56480a3c2399878"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.0/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1050ef8027061bd46ed96dce748cde70b733c7cba27427a9782adc2a0f654e6e"
    end
  end

  def install
    bin.install "search"
  end

  test do
    # Without a terminal, --version prints a JSON envelope:
    # {"data": {"usage": "search 0.10.0"}, "status": "success", ...}
    assert_match(/"usage":\s*"search #{Regexp.escape(version.to_s)}"/, shell_output("#{bin}/search --version"))
    assert_match "login", shell_output("#{bin}/search --help")
  end
end
