class Akm < Formula
  desc "Agent-driven macOS Keychain CLI for API keys"
  homepage "https://github.com/paperfoot/api-key-manager"
  url "https://github.com/paperfoot/api-key-manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0da5d0aa9f04dfa3adce40f0c3b28581e9358369812fe96344b0e7c7c97c596e"
  license "MIT"
  head "https://github.com/paperfoot/api-key-manager.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "akm 0.1.0", shell_output("#{bin}/akm --version")
    assert_match "agent-info", shell_output("#{bin}/akm --help")
  end
end
