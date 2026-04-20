class Seedance < Formula
  desc "Generate video with ByteDance Seedance 2.0 from the terminal. Agent-friendly."
  homepage "https://github.com/paperfoot/seedance-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.1.3/seedance-aarch64-darwin"
      sha256 "456853f2468db3a1886a527540886729c76abfadd52d5fa0afbc78cbf2d8b9da"
    else
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.1.3/seedance-x86_64-darwin"
      sha256 "2d751147897feefa6b8161880db40fd516be2a4b7e056b35c0fcdb5b0e463316"
    end
  end

  on_linux do
    url "https://github.com/paperfoot/seedance-cli/releases/download/v0.1.3/seedance-x86_64-linux"
    sha256 "0091f00c15062285d7e7bd0262b7d5448e008226b374477823117117d6d2de22"
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
