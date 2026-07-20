class Suno < Formula
  desc "Generate AI music from your terminal for Suno v5.5"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.7.0/suno-aarch64-apple-darwin.tar.gz"
      sha256 "09ee19eb34d78cd5f958e6f52aa79f8c3271bf5ecb5a3f6cc2f0fb6b767f4ad8"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.7.0/suno-x86_64-apple-darwin.tar.gz"
      sha256 "27c489a54fbd4d32d5efa9d9e4771027befd08fb6c456b761f6e55afcd6f508b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.7.0/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75f4beb8db362c1de7870b64605d237b2fa531a0ac626cc597896d5e411898b7"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.7.0/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b80bb8aa8349fa8782c14644cb43a54c4f95cf97a2d4e846c0a3e1d6c48e5a8e"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.7.0", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
