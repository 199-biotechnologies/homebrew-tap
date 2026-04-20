class Seedance < Formula
  desc "Generate video with ByteDance Seedance 2.0 from the terminal. Agent-friendly."
  homepage "https://github.com/paperfoot/seedance-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.2.0/seedance-aarch64-darwin"
      sha256 "82090f4fdfe164be0b9f9f0924537b7fe3fde11b4d1aac4d437e4b3c580e59b1"
    else
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.2.0/seedance-x86_64-darwin"
      sha256 "3dbaac0c80787f652e15894d9b4f1ceefb5528f664bf772c0b2ae50321469508"
    end
  end

  on_linux do
    url "https://github.com/paperfoot/seedance-cli/releases/download/v0.2.0/seedance-x86_64-linux"
    sha256 "44270fa6030cf6b970ac321019a76476b03bceaf826907d399689952794c5f7d"
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
