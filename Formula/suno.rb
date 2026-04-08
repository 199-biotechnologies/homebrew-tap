class Suno < Formula
  desc "Generate AI music from your terminal — Suno v5.5 with voice personas, covers, remasters"
  homepage "https://github.com/199-biotechnologies/suno-cli"
  license "MIT"
  version "0.5.4"

  on_macos do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-apple-darwin.tar.gz"
      sha256 "64881d9ab8adc4efddc8843f671f781e1ddaedaf99f84799f5bb180406f41d8f"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-apple-darwin.tar.gz"
      sha256 "fab394ee67aa16da69706a3e197e836f6324745ff78102df067042096a3ef928"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44f857d27e6b1121c4c22e2dcf13b8f64012f459b3eaae5dce0f3f9dccb57dea"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bdeb9f1cf69ead2337181a71287aa538df3ba0a88a02da2e1cc0cee10be2b21"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno", shell_output("#{bin}/suno --version")
  end
end
