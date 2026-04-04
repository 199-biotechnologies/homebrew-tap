class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/199-biotechnologies/xmaster"
  version "1.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.5.2/xmaster-aarch64-darwin"
      sha256 "5a4ed9cf6c8007c2e66f03882cb9e3f5721cec58a08f61e506d31254103da85e"
    else
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.5.2/xmaster-x86_64-darwin"
      sha256 "31e623988342984c0d516a8432c2c955214c884841968cdad136891c2c66b7e5"
    end
  end

  on_linux do
    url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.5.2/xmaster-x86_64-linux"
    sha256 "17f89308aba2e3319505c9b623f19c59bae75cb7632436ef4b16c2d56ca22444"
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
