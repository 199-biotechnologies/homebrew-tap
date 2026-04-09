class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/199-biotechnologies/xmaster"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.0/xmaster-aarch64-darwin"
      sha256 "052ac90ff40b31aff72820475594705f78bfc97ad362892bf06c4e6cd95b84c7"
    else
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.0/xmaster-x86_64-darwin"
      sha256 "4491fca65d702e7de506cf6da80423f877f3f66484d2f291b46742353c1a366f"
    end
  end

  on_linux do
    url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.6.0/xmaster-x86_64-linux"
    sha256 "955ec261ae8ab1e2358e9fffc863073a40a0f299a5f6471c6bdb618a761c68bf"
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
