class Seedance < Formula
  desc "Generate video with ByteDance Seedance 2.0 / 2.5 from the terminal. Agent-friendly."
  homepage "https://github.com/paperfoot/seedance-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.3.0/seedance-aarch64-darwin"
      sha256 "d9c7bcd1a527f11cddc832551cac038f5611200ae0922e5081ea48a2f7bc93b3"
    else
      url "https://github.com/paperfoot/seedance-cli/releases/download/v0.3.0/seedance-x86_64-darwin"
      sha256 "2da20fc93160350ab066ea24a34605fcf483059ebb54adad3b7eade03dae3983"
    end
  end

  on_linux do
    url "https://github.com/paperfoot/seedance-cli/releases/download/v0.3.0/seedance-x86_64-linux"
    sha256 "c51f020cd3168b403868800d12ef979be2dcece0806a9076a4488f07b18e8bb5"
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
