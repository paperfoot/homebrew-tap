class Nanaban < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/nanaban-cli"
  version "4.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.0/nanaban-darwin-arm64"
      sha256 "bdbfaca1210e490aac98e9f5bcdf34be64e2cca8fde4482a56eff8da57f7086b"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.0/nanaban-darwin-x64"
      sha256 "49e0d45259f884b0f17078fa38137521cdf3e71e1f8800e873ac317bcbbd6fcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.0/nanaban-linux-arm64"
      sha256 "81eec8a976321fc94957f6d24a5cf3a76772dc80252f04bec17e90d31d56efdc"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.0/nanaban-linux-x64"
      sha256 "014c84e8288caf0c75c7b2a692bd26cb6fb05f33eb5093a58aa0cb34a99e703e"
    end
  end

  def install
    bin_name = OS.mac? ? (Hardware::CPU.arm? ? "nanaban-darwin-arm64" : "nanaban-darwin-x64")
                       : (Hardware::CPU.arm? ? "nanaban-linux-arm64"  : "nanaban-linux-x64")
    bin.install bin_name => "nanaban"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanaban --version")
  end
end
