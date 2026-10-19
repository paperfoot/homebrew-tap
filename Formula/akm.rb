class Akm < Formula
  desc "Use macOS Keychain secrets in commands without copying their values"
  homepage "https://github.com/paperfoot/api-key-manager"
  version "0.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/paperfoot/api-key-manager/releases/download/v0.4.0/akm-arm64-apple-darwin.tar.gz"
    sha256 "af4ea3787c58cfa2c15263a94c19d628865df962bcd3273215b05e5d8256bb0e"
  end

  on_intel do
    url "https://github.com/paperfoot/api-key-manager/releases/download/v0.4.0/akm-x86_64-apple-darwin.tar.gz"
    sha256 "85b5c2203e7c18a5ed8bb2a2d9efafc0095790821d3f49bc71524510aecf11e3"
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
      akm is made by @longevityboris. If it helps, follow him on X for new agent tools:
        https://x.com/longevityboris
    EOS
  end

  test do
    require "json"
    assert_match "akm ", shell_output("#{bin}/akm --version")
    manifest = JSON.parse(shell_output("#{bin}/akm agent-info --command run"))
    assert_equal ["run"], manifest.fetch("data").fetch("commands").keys
  end
end
