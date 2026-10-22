class Stylometry < Formula
  desc "Capture a writer's voice, brief AI agents to write in it, check drafts"
  homepage "https://github.com/paperfoot/stylometry-cli"
  url "https://github.com/paperfoot/stylometry-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "6fc539e6f38498125932345eec176a8051078b681be11d14c21e5959ae7bb8a2"
  license all_of: ["MIT", "CC-BY-SA-4.0"]
  head "https://github.com/paperfoot/stylometry-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "stylometry", shell_output("#{bin}/stylometry --version")
    assert_match "success", shell_output("#{bin}/stylometry agent-info")
  end
end
