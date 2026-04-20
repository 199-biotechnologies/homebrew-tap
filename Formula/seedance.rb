class Seedance < Formula
  desc "Generate video with ByteDance Seedance 2.0 from the terminal. Agent-friendly."
  homepage "https://github.com/paperfoot/seedance-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.2.1/seedance-aarch64-darwin"
      sha256 "d857d4ff0023efdf58e696d60b7f78b65a5f6cdcb7bf180e320a9dd6a25d6700"
    else
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.2.1/seedance-x86_64-darwin"
      sha256 "8eac4ab81d4f58e8f7476b51fe3ef58220b23ea82281f2f2d16c023d5c80a5c6"
    end
  end

  on_linux do
    url "https://github.com/paperfoot/seedance-cli/releases/download/v0.2.1/seedance-x86_64-linux"
    sha256 "4adbaf6f1bdaf835c52d2da75d850a832af733df414bf6fb0d52ce917037a47f"
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
