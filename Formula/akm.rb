class Akm < Formula
  desc "Use macOS Keychain secrets in commands without copying their values"
  homepage "https://github.com/paperfoot/api-key-manager"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/paperfoot/api-key-manager/releases/download/v0.3.0/akm-arm64-apple-darwin.tar.gz"
    sha256 "a1aa20d9fc1a32c56f1dbdde1d457098632976cee95446828ef718da8d07297f"
  end

  on_intel do
    url "https://github.com/paperfoot/api-key-manager/releases/download/v0.3.0/akm-x86_64-apple-darwin.tar.gz"
    sha256 "3a8508c4a833bf51d3e383c899a02e87ec18b3f7eac3b958d165edd6ebab9f8a"
  end

  depends_on :macos => :sequoia

  head do
    url "https://github.com/paperfoot/api-key-manager.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "akm"
    end
  end

  def caveats
    <<~EOS
      Update optional agent instructions with: akm skill install
      For legacy Keychain migration, see:
        https://github.com/paperfoot/api-key-manager#upgrade-from-01-or-02
    EOS
  end

  test do
    require "json"
    assert_match "akm ", shell_output("#{bin}/akm --version")
    manifest = JSON.parse(shell_output("#{bin}/akm agent-info --command run"))
    assert_equal ["run"], manifest.fetch("data").fetch("commands").keys
  end
end
