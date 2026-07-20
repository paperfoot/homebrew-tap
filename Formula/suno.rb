class Suno < Formula
  desc "Write and generate AI music from your terminal for Suno v5.5"
  homepage "https://github.com/paperfoot/suno-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.9.0/suno-aarch64-apple-darwin.tar.gz"
      sha256 "c01ef04296c8a14d276964fcee5f3aafbe79ba672646b24f26d30d4704fd1408"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.9.0/suno-x86_64-apple-darwin.tar.gz"
      sha256 "9d6a819efcfe1837260f81ed14979689350a0bed01a2d98f1a2f5ee7bc7fc7f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.9.0/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d29f59538a6fa4a2518b39050980ffbc22cea969f00f4defd5bcb2f8626a73d"
    end

    on_intel do
      url "https://github.com/paperfoot/suno-cli/releases/download/v0.9.0/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4e25411863837c490e840720b26a6fe98f921ecd802f4f8a1c1fcfec2345e23"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno 0.9.0", shell_output("#{bin}/suno --version")
    assert_match "agent-info", shell_output("#{bin}/suno --help")
  end
end
