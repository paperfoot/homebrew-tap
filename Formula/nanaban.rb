class Nanaban < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/nanaban-cli"
  version "7.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v7.0.0/nanaban-darwin-arm64"
      sha256 "b79528a547719ca04a72dc44ac41665fe6d73393d0f665809d22eaef86e86d75"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v7.0.0/nanaban-darwin-x64"
      sha256 "0047c42895a7fedf03c118fec8dba7c5137f0d1e99a88769b801ef16bb3b50ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v7.0.0/nanaban-linux-arm64"
      sha256 "bd57e4ce8b5e3daf6a672905cf71f6fc94259ec99218f8f1a7208c3d4e50b2fd"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v7.0.0/nanaban-linux-x64"
      sha256 "6f71307f2cf678a7998a98a74a56382503ac27577227891fd19a3cbc692f3da1"
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
