class Stylometry < Formula
  desc "Capture a writer's voice, brief AI agents to write in it, check drafts"
  homepage "https://github.com/paperfoot/stylometry-cli"
  version "0.5.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/stylometry-cli/releases/download/v0.5.1/stylometry-cli-aarch64-apple-darwin.tar.xz"
      sha256 "79fb66a4c92fdac47e1baf06a1cbb0fe695af6984f30825f55e86596f1077c9c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/paperfoot/stylometry-cli/releases/download/v0.5.1/stylometry-cli-x86_64-apple-darwin.tar.xz"
      sha256 "e6ba0ac9fa980f5a0dbc8494cf344dcd820798ae4b5f1108c4d9b034eef62ec3"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/stylometry-cli/releases/download/v0.5.1/stylometry-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2cc52816abe180e9e95dd1d4e1cdfcf6cfd01a7eb2cc242e5f3910a3df40325a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/paperfoot/stylometry-cli/releases/download/v0.5.1/stylometry-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dd8585bb3b62c5db69f3078d117d2fa4c467d9880c384ce4d95f70f53628c73d"
    end
  end
  license all_of: ["MIT", "CC-BY-SA-4.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "stylometry"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "stylometry"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "stylometry"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "stylometry"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    assert_match "stylometry", shell_output("#{bin}/stylometry --version")
    assert_match "success", shell_output("#{bin}/stylometry agent-info")
  end
end
