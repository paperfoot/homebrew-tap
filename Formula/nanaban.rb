class Nanaban < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/nanaban-cli"
  version "4.3.0"
  license "MIT"

  deprecate! date: "2026-07-13", because: "renamed to slika (brew install paperfoot/tap/slika)"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.3.0/nanaban-darwin-arm64"
      sha256 "b6aef8c3d25ec7ee7b9595406c9661a22bee8f26fff34e605110082e4a5af650"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.3.0/nanaban-darwin-x64"
      sha256 "16843d7c7b70c3c1f7d1a3b06560c51da0c17fe1bdadbf2f85ca6da7e911ae9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.3.0/nanaban-linux-arm64"
      sha256 "8761f8f42c0a5299bba29ba2a8ab271cf809be820ff4a621e1f16c46690f8f89"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.3.0/nanaban-linux-x64"
      sha256 "c448d0502f371f7c9bd5f81acdd7fa614f41a606586dc171e8fcccf4b4f318cd"
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
