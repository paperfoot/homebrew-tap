class Suno < Formula
  desc "Write and generate AI music from your terminal for Suno v6"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.10.1/suno-aarch64-apple-darwin.tar.gz"
      sha256 "141b405652771bfbea7ebaba07bb33a01ac0dc24cce37db73bba423c66c91e33"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.10.1/suno-x86_64-apple-darwin.tar.gz"
      sha256 "d4c5954f8c111c4bc78619cbae4edb0b3f7b6fc13fff81e50cd87a290b58dc81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.10.1/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37e0e629f1f20feb68e849e870a1bbb80f10cd5dba8e909dc4e8369674ab624d"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.10.1/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec5acebe7637927db107221248941c356440e96ad8933461daba454b90a03ca7"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.10.1", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
