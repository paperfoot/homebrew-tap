class Onchain < Formula
  desc "Fast EVM and Zcash queries, transaction investigation, and swap quotes"
  homepage "https://github.com/paperfoot/onchain-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/onchain-cli/releases/download/v0.2.2/onchain-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "f31afab91e4853c9e7377cb0b20b2211f25cf419df9f84dd6486332b3605cb8c"
    end

    on_intel do
      url "https://github.com/paperfoot/onchain-cli/releases/download/v0.2.2/onchain-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "9961b446b978b92ba921531181476d376264f6bb459b32ef25bdaca05a426907"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/paperfoot/onchain-cli/releases/download/v0.2.2/onchain-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75dfabf7e1b41ae56f4873b9f09cf8cbbd9be8ae7ae8c7481cefd22e23969c7f"
    end

    on_intel do
      url "https://github.com/paperfoot/onchain-cli/releases/download/v0.2.2/onchain-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b9faa424f5ea8f7669266962dd1e4c33f1a89afc9fd273b6cde372c67b16d11"
    end
  end

  def install
    bin.install "onchain"
    prefix.install "LICENSE", "README.md"
  end

  test do
    require "json"

    assert_equal "onchain #{version}", shell_output("#{bin}/onchain --version").strip
    amount = JSON.parse(shell_output("#{bin}/onchain --json zcash amount 0.00000001"))
    assert_equal "1", amount.dig("result", "zatoshis")
  end
end
