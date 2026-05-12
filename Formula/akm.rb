class Akm < Formula
  desc "Agent-driven macOS Keychain CLI for API keys"
  homepage "https://github.com/paperfoot/api-key-manager"
  url "https://github.com/paperfoot/api-key-manager/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "08865b490203481e63c290fd134bb3dcba4e21db73ad1958bf01af747eca5746"
  license "MIT"
  head "https://github.com/paperfoot/api-key-manager.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "akm 0.1.2", shell_output("#{bin}/akm --version")
    assert_match "agent-info", shell_output("#{bin}/akm --help")
  end
end
