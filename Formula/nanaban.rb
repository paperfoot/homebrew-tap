class Nanaban < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/nanaban-cli"
  version "5.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.1.0/nanaban-darwin-arm64"
      sha256 "02a865c2ff2b6322a2df0395d903ac8024bbd520d4f3d2586040be1e9010f4f9"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.1.0/nanaban-darwin-x64"
      sha256 "1b4a08f13b4e020f736d085658f8590ed846df7af16dd144e84c344c6221569a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.1.0/nanaban-linux-arm64"
      sha256 "26779ba9cc6f873bfc9d9cb90bea2c5b46f0e982d587fa3d08bcb4b40648cb9a"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.1.0/nanaban-linux-x64"
      sha256 "069ceae06cf9a7db3de53b5af8a5a525c1dcf2f3e0b5c22ab1ee5329db8fc981"
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
