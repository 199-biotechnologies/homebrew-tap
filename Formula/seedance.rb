class Seedance < Formula
  desc "Generate video with ByteDance Seedance 2.0 from the terminal. Agent-friendly."
  homepage "https://github.com/199-biotechnologies/seedance"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/seedance/releases/download/v0.1.1/seedance-aarch64-darwin"
      sha256 "953c97032eb2701d624e4e7a6f9b3557abf3f72f490caf945b2a42a1643e4bfd"
    else
      url "https://github.com/199-biotechnologies/seedance/releases/download/v0.1.1/seedance-x86_64-darwin"
      sha256 "e02a8ec1c2e45bc059eb039ddd75c90ff5b105871ebbf203d493820d6a02e3c2"
    end
  end

  on_linux do
    url "https://github.com/199-biotechnologies/seedance/releases/download/v0.1.1/seedance-x86_64-linux"
    sha256 "d84ad7c94f51748483ad7dfe105c5baf4612eab386a90c27671b1995ae7781c6"
  end

  def install
    binary = Dir["seedance*"].first
    bin.install binary => "seedance"
  end

  test do
    assert_match "seedance", shell_output("#{bin}/seedance --version")
    assert_match "success", shell_output("#{bin}/seedance agent-info")
  end
end
