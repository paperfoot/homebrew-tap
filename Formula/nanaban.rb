class Nanaban < Formula
  desc "Image generation from the terminal (GPT Image 2, Nano Banana, GPT-5 Image)"
  homepage "https://github.com/paperfoot/nanaban-cli"
  version "4.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.1/nanaban-darwin-arm64"
      sha256 "16dbfb0ae578c1bb0c6be8dcff33c436cc63e910fb51afad053254612710ad68"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.1/nanaban-darwin-x64"
      sha256 "50253658773c1edb6c89d0d662e4caa11c5b57c9369a297b06e3be125c65f510"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.1/nanaban-linux-arm64"
      sha256 "7f68ab56518a407d62d5f80b3eed1c23bc6b6d255530512bbf848ebae1eb7a7f"
    else
      url "https://github.com/paperfoot/nanaban-cli/releases/download/v4.2.1/nanaban-linux-x64"
      sha256 "605b9894757b0016eacb6264673b2824239299c55ea189a96ed42367e33386b3"
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
