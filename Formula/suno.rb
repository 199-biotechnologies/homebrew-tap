class Suno < Formula
  desc "Generate AI music from your terminal — Suno v5.5 with voice personas, covers, remasters"
  homepage "https://github.com/199-biotechnologies/suno-cli"
  license "MIT"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-apple-darwin.tar.gz"
      sha256 "3baac563637fadd999e39ec01244f8e5178d41f17900bdc272306695b9903d96"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-apple-darwin.tar.gz"
      sha256 "1a7dca02ac7ff269c7c19f6ece0ef48a9b8c45dca82fd9bf16df01622e72bf84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee95c6edf5808c30f70b51e4954dec9a7791e6f0b3868e1af8f30882f4238e36"
    end
    on_intel do
      url "https://github.com/199-biotechnologies/suno-cli/releases/download/v#{version}/suno-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a148b6f0105fc56951f35939aa9ea39a5daefad32a0226242abc2ba862ffc52"
    end
  end

  def install
    bin.install "suno"
  end

  test do
    assert_match "suno", shell_output("#{bin}/suno --version")
  end
end
