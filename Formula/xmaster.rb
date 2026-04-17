class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/199-biotechnologies/xmaster"
  version "1.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.3/xmaster-aarch64-darwin"
      sha256 "c6abfa9daaf12033cffe2e0b53f7cc12ebea9cdc0ee41a83828f04315980a8c7"
    else
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.3/xmaster-x86_64-darwin"
      sha256 "2ff38a76281e5031220446f9b05336c1b0b1ba063eaac5b4c8172ce0312bd3a1"
    end
  end

  on_linux do
    url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.3/xmaster-x86_64-linux"
    sha256 "20a7985bcce9d1c9ec957e6d66f9024ec4a6b574c717e34bbc004dee921234a7"
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
