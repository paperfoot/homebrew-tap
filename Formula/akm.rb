class Akm < Formula
  desc "Agent-driven macOS Keychain CLI for API keys"
  homepage "https://github.com/paperfoot/api-key-manager"
  url "https://github.com/paperfoot/api-key-manager/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "5cdf7513adf8e5546b7eefee4bef8533ca0f9d3c2819f7ab177f9032f1bd58e1"
  license "MIT"
  head "https://github.com/paperfoot/api-key-manager.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "akm 0.1.3", shell_output("#{bin}/akm --version")
    assert_match "agent-info", shell_output("#{bin}/akm --help")
  end
end
