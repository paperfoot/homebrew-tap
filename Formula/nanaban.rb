class Nanaban < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/nanaban"
  version "5.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.0.1/nanaban-darwin-arm64"
      sha256 "ce81c28356f802fe35fb99900680d28709053966d27694e61150d87a08161d46"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.0.1/nanaban-darwin-x64"
      sha256 "bc09dd64a8162f3bab87b3cdf43108bad1cb7dccaee0f32e17cda16381834bc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.0.1/nanaban-linux-arm64"
      sha256 "4e9b775489b87187305e29be6e233ce38c18253d53ce5531bd65a75569cbd142"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v5.0.1/nanaban-linux-x64"
      sha256 "9b741cb5b15ed7c8b26596dc82f9a65ead7c924008300a272bfe1057d9f63506"
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
