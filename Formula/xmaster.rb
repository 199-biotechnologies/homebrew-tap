class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  version "1.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.4/xmaster-aarch64-darwin"
      sha256 "4d55608ca32448124c8db9cbba2ad7f6db83297d3ca4eff7ac27fec1e4b7811c"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.4/xmaster-x86_64-darwin"
      sha256 "c95b8cd7d0020729405b792f85adc02c9179c4d50228980fcb5f5d4afcb81599"
    end
  end

  on_linux do
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.4/xmaster-x86_64-linux"
    sha256 "042fdd6cf19a859114527f59ef676fc77ad13cfb81dc4bd53e64ddcb7a8befd1"
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
