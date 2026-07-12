class Slika < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/slika"
  version "5.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/slika/releases/download/v5.0.0/slika-darwin-arm64"
      sha256 "aab4a8fc0f10a23fe99b8cd39b57a3e16d0330e9b760e5d5b2f8b82f5eb3c6d0"
    else
      url "https://github.com/paperfoot/slika/releases/download/v5.0.0/slika-darwin-x64"
      sha256 "0013540cce481f8d026cacd71c72b61726e8b3969a8e393d42db89f1db32859b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/slika/releases/download/v5.0.0/slika-linux-arm64"
      sha256 "7cada27c8245c6cf2e304d1eb0a82c73f683a0a4499af68e4faf8c59d6754977"
    else
      url "https://github.com/paperfoot/slika/releases/download/v5.0.0/slika-linux-x64"
      sha256 "cd7bc6f3356a49ce78303b87526840d90449675de21073d82d1045303b1bad26"
    end
  end

  def install
    bin_name = OS.mac? ? (Hardware::CPU.arm? ? "slika-darwin-arm64" : "slika-darwin-x64")
                       : (Hardware::CPU.arm? ? "slika-linux-arm64"  : "slika-linux-x64")
    bin.install bin_name => "slika"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slika --version")
  end
end
