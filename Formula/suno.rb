class Suno < Formula
  desc "Generate AI music from your terminal — Suno v5.5 with voice personas, covers, remasters"
  homepage "https://github.com/199-biotechnologies/suno-cli"
  license "MIT"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-apple-darwin.tar.gz"
      sha256 "a4aa6fb3034b23a161575696abb0c79e167ede16a7b3b6ff176586b5a64dabe6"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-apple-darwin.tar.gz"
      sha256 "e6ecf79d617d43bbb489bdaa7a7a90832fdcb7600f11467a6e2052caf2054090"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "004faa343fe62d6580784f3e670adf6b31f0b70f6ad3d1a8cbcfc9905b7b3643"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "649d0f35ab181a7c9916496199bbd02aea72f967ae4ffa8cf68e5c9674affe8e"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno", shell_output("#{bin}/suno --version")
  end
end
