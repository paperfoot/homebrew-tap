class Suno < Formula
  desc "Generate AI music from your terminal for Suno v5.5"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.5/suno-aarch64-apple-darwin.tar.gz"
      sha256 "374c3e331a9f91859256a64f86c003c14107ae2b41cdce5c0a5a9e3a8bab5cb3"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.5/suno-x86_64-apple-darwin.tar.gz"
      sha256 "2831d6739762e77ca297cf6da1993c05052b362558bf2eb0ed141c84156a3f5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.5/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5437df69860ece576bc220518df589fca8871d71efc8b59b66c8e0250dcd049b"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.5/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fb084004155f988e070681242900d463d915156b6b429790ddbea356c826b41"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.5.5", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
