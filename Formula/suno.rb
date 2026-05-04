class Suno < Formula
  desc "Generate AI music from your terminal for Suno v5.5"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.7/suno-aarch64-apple-darwin.tar.gz"
      sha256 "44631442f3147cef978921c485b4e34037e094ab3df64b5b226ea2c7e236e14b"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.7/suno-x86_64-apple-darwin.tar.gz"
      sha256 "47225fa9c1954bd1b2edd04ff08ade41a465c8cee4f94c7a6673e46a3035b963"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.7/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee75fc61afdc1ea8546f1b9a15d91a005fd4cadeefca938e18a0df0f0cd107f3"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.5.7/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd50135449a0b7a9bc58b48f6ac645ca9ec485adc1069e4a62ae4e1e9542fa6e"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.5.7", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
