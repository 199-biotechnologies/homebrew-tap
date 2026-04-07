class SunoCli < Formula
  desc "Generate AI music from your terminal — Suno v5.5 with voice personas, covers, remasters"
  homepage "https://github.com/199-biotechnologies/suno-cli"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-apple-darwin.tar.gz"
      sha256 "3716dba4b7c2ea6fca18d4f2ba716c435d10fab5fd637227a84350e513e80d09"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-apple-darwin.tar.gz"
      sha256 "8dd542ec86c1ff3d6ecbb1712d11eb46ee7d97345bdcb29149458eb62addedce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4602060306940f8f2833062eae626138b6b873c5afd2d67c4076d1c03485f8c9"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e42acf97fb9bfa89e41da7ad16b869795a666b4bd024bb46264b3de2272d8ad"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno-cli", shell_output("#{bin}/suno --version")
  end
end
