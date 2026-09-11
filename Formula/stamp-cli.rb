class StampCli < Formula
  include Language::Python::Virtualenv

  desc "Create signature graphics, company seals, and office stamps"
  homepage "https://github.com/paperfoot/stamp-cli"
  url "https://github.com/paperfoot/stamp-cli/releases/download/v0.3.2/stamp_cli-0.3.2-py3-none-any.whl"
  sha256 "69ff8580e0fa3c8a0463ca85b4861316b0220a5da8b98662b05c5961c9ee3569"
  license "MIT"

  # Native wheels already use portable loader paths; preserve their Mach-O IDs.
  preserve_rpath

  depends_on "python@3.14"

  # Upstream wheels keep installation fast and avoid compiling graphics libraries.
  # These exact versions and hashes also appear in stamp-cli's release lockfile.

  resource "click" do
    url "https://files.pythonhosted.org/packages/58/50/6c0d534c5f134586a8e1ba4e330569e32f057e33372ae556463212fb4cd3/click-8.5.0-py3-none-any.whl"
    sha256 "255bc9599cf7748b4b1a446ccc735421bd08a2ae529a8b88597d3de5664ee360"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/e6/35/f894ceb867118c0261d0f69a9bd516b045a3754238f76c88a49513ac7a83/fonttools-4.65.0-py3-none-any.whl"
    sha256 "3060b8c1fc2329fa20265b7c138614143ea7c1624e26c5c180c76aeb74deae6f"
  end

  on_macos do
    on_arm do
      resource "pillow" do
        url "https://files.pythonhosted.org/packages/c7/da/32c752228ae345f489e3a42499d817b6c3996da7e8a3bc7a04fc806b243b/pillow-12.3.0-cp314-cp314-macosx_11_0_arm64.whl"
        sha256 "e158cb00350dc278f3b91551101aa7d12415a66ebf2c91d8d5ac14e56ddd3ad0"
      end

      resource "resvg-py" do
        url "https://files.pythonhosted.org/packages/74/bf/4083b177388125e5ce2ab9fa4cd9efd881fa133dd97e5b2d4ca68e543256/resvg_py-0.5.0-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "7b43f942157f5d16126e108dab8ab37e4bc2b198099e5f6274b753a3b1ac7b6e"
      end
    end
    on_intel do
      resource "pillow" do
        url "https://files.pythonhosted.org/packages/85/e2/73c77d218410b14f5f2d565e8a998d5317b7b9c75368d29985139f7a46f0/pillow-12.3.0-cp314-cp314-macosx_10_15_x86_64.whl"
        sha256 "ba54cfebe86920a559a7c4d6b9050791c20513650a1952ebe3368c7dc70306f8"
      end

      resource "resvg-py" do
        url "https://files.pythonhosted.org/packages/ed/36/3408156e9cba54d1ef5793377f39be4096660933cc6df155ba425315bf09/resvg_py-0.5.0-cp310-abi3-macosx_10_12_x86_64.whl"
        sha256 "9d3f5c2544d6b5f74847513e07e6ab6a70f9e7f0d8a141bc16bd4b0c555f4234"
      end
    end
  end

  on_linux do
    on_arm do
      resource "pillow" do
        url "https://files.pythonhosted.org/packages/b1/9d/8b2c807dbef61a5197c047afe99823787eb66f63daf9fb2432f91d6f0462/pillow-12.3.0-cp314-cp314-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "e9aeb04d6aef139de265b29683e119b638208f88cf73cdd1658aa07221165321"
      end

      resource "resvg-py" do
        url "https://files.pythonhosted.org/packages/52/92/1dfd0d7b5f8dbb16f9c889bba0d7477ab514d1f2a81a5f904662215103bc/resvg_py-0.5.0-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "1e66216f78c84a27d34ce75f4535d8e26565771be4f1848ddc71e8a7ce78973a"
      end
    end
    on_intel do
      resource "pillow" do
        url "https://files.pythonhosted.org/packages/5c/44/c85361f65dbe00eea8576ee467c768d25129989efb76e94f205e9ca9bb46/pillow-12.3.0-cp314-cp314-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
        sha256 "251bf95b67017e27b13d82f5b326234ca62d70f9cf4c2b9032de2358a3b12c7b"
      end

      resource "resvg-py" do
        url "https://files.pythonhosted.org/packages/9e/08/217f2289ceb16a4eafd9c9c6f69aa3221ef047a6abe4ff1ce5c8d6be87d8/resvg_py-0.5.0-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "84f2378ecc7a8e38b03429efaefc816daec1b1970114909a6f973393b297c91b"
      end
    end
  end

  def install
    wheel_dir = buildpath/"wheels"
    wheel_dir.mkpath
    app_wheel = wheel_dir/"stamp_cli-#{version}-py3-none-any.whl"
    cp cached_download, app_wheel

    venv = virtualenv_create(libexec, "python3.14", system_site_packages: false)
    resources.each do |r|
      wheel = wheel_dir/r.downloader.basename
      cp r.cached_download, wheel
      venv.pip_install wheel, build_isolation: false
    end
    venv.pip_install_and_link app_wheel, build_isolation: false
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stamp --version")

    system bin/"stamp", "sign", "--name", "Alex Morgan", "--layout", "signature-only",
           "--script-font", "sans", "-o", "signature.png"
    assert_path_exists testpath/"signature.png"

    report = JSON.parse(shell_output("#{bin}/stamp inspect signature.png --json"))
    assert report["ok"]
    assert_equal "png", report["format"]
    assert_equal "\x89PNG\r\n\x1a\n".b, (testpath/"signature.png").binread(8)
  end
end
