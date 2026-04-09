class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/199-biotechnologies/xmaster"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.1/xmaster-aarch64-darwin"
      sha256 "aa211f1a9af2913f4f00a75ef4830be4edd8f383c0430ecc02866e92db65795c"
    else
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.1/xmaster-x86_64-darwin"
      sha256 "df807b375ab69ee40c3baa1f7f745c533da55d856f25c9a2ae3c9d9e8b895afe"
    end
  end

  on_linux do
    url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.1/xmaster-x86_64-linux"
    sha256 "b749c15c1e2cfc8a4f7863f1981c255354c4896ae8dcf1c947cd1fb1591edddb"
  end

  def install
    binary = Dir["xmaster*"].first
    bin.install binary => "xmaster"
  end

  test do
    assert_match "xmaster", shell_output("#{bin}/xmaster --version")
    assert_match "success", shell_output("#{bin}/xmaster agent-info")
  end
end
