class SunoCli < Formula
  desc "Generate AI music from your terminal — Suno v5.5 with tags, exclude, vocal control"
  homepage "https://github.com/199-biotechnologies/suno-cli"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-apple-darwin.tar.gz"
      # sha256 will be updated after first release build completes
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno-cli", shell_output("#{bin}/suno --version")
  end
end
