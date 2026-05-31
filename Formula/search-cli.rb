class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 13 modes)"
  homepage "https://github.com/paperfoot/search-cli"
  version "0.6.0"
  license "MIT"

  # Prebuilt binaries (not a source build): the `rquest` dependency is fully
  # yanked on crates.io, so `cargo install` would fail to resolve. The release
  # binaries are built with --locked against the pinned version.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/search-cli/releases/download/v0.6.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "a7e3ae3ccd4b57df77eb5c08eef13ebb9153319d14075de5131617865aeb9da7"
    else
      url "https://github.com/paperfoot/search-cli/releases/download/v0.6.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "65bd7c006c3725a2a92c0c59723e00d4cda42974845de4b0a1127cd5f93eeb3f"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.6.0", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
