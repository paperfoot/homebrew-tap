class Akm < Formula
  desc "Agent-driven macOS Keychain CLI for API keys"
  homepage "https://github.com/paperfoot/api-key-manager"
  url "https://github.com/paperfoot/api-key-manager/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7b5e453daa37592b2cb1f5111ea274624d65131b41a0af3ea402d782a3aaf168"
  license "MIT"
  head "https://github.com/paperfoot/api-key-manager.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "akm 0.1.1", shell_output("#{bin}/akm --version")
    assert_match "agent-info", shell_output("#{bin}/akm --help")
  end
end
