class SearchCli < Formula
  desc "Web search for AI agents: ten engines, auto routing, rank fusion, cost"
  homepage "https://github.com/paperfoot/search-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "92441af4f32cef944933540034c1d3f3f7d78f66af7a3211a184c62ee9604f47"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "5c8953135425940b8fdf6fb9e3a826bc4b0dac03008a7bb03bfa0f105ea6c7b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.1/search-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a347c8246c4c70960b21cd7969b50ace740413e7d1575d48591418b6e28b00c7"
    end
    on_intel do
      url "https://github.com/paperfoot/search-cli/releases/download/v0.10.1/search-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcfd4197ab6ce155f0b68afbf51ec3ee6bf7f53098c065defa329f5c11886da0"
    end
  end

  def install
    bin.install "search"
  end

  test do
    # Without a terminal, --version prints a JSON envelope:
    # {"data": {"usage": "search 0.10.1"}, "status": "success", ...}
    assert_match(/"usage":\s*"search #{Regexp.escape(version.to_s)}"/, shell_output("#{bin}/search --version"))
    assert_match "login", shell_output("#{bin}/search --help")
  end
end
