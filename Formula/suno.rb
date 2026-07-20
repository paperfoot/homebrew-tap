class Suno < Formula
  desc "Write and generate AI music from your terminal for Suno v5.5"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.8.0/suno-aarch64-apple-darwin.tar.gz"
      sha256 "9ffd2979ca5a36f7910be25d7cdde2dd4fb20b4f734487891637dcb0cb611a79"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.8.0/suno-x86_64-apple-darwin.tar.gz"
      sha256 "34c0c5cd8a13d72ae55ff950d295e4afb186a40fc19930d9ce26d4a5bce89cd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.8.0/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7da6c7359bb73866e81057688be46e4a43ee0244bc2885da63396bef3d416027"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.8.0/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86bb3027f8603b32113e3a9c38aba6f814135b07f10387f085466ab6da108943"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.8.0", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
