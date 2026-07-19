class Suno < Formula
  desc "Generate AI music from your terminal for Suno v5.5"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.6.0/suno-aarch64-apple-darwin.tar.gz"
      sha256 "193e8865293da0c1235ba7ee66a77dac7bc4fe39f9b5a7e239635ddb5bf22ee8"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.6.0/suno-x86_64-apple-darwin.tar.gz"
      sha256 "8f451f333dda3a9ac409e6930bef3754cb4d4eb0d897929ab1c1572ebd36d4dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.6.0/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5fb9cf3cc1d877170f6135115a2c82bd40f442780aa910de67b3e8ba9f363d2"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.6.0/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e495ad2592762a4c181eece0ad8fc67ae1417576d95fe5dbab438495b8d6839"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.6.0", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
