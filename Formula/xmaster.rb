class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/199-biotechnologies/xmaster"
  version "1.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.5.3/xmaster-aarch64-darwin"
      sha256 "18e5e297c6820fe307a4874b700bbb125cc60675423466de9dba2097ea815e41"
    else
      url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.5.3/xmaster-x86_64-darwin"
      sha256 "afb9f61df2d2e3ea2fad2c56d924bca6112bfa4252aab938cba1988e4ba64b88"
    end
  end

  on_linux do
    url "https://github.com/199-biotechnologies/xmaster/releases/download/v1.5.3/xmaster-x86_64-linux"
    sha256 "760b9c8bd715d2556ced0a9b2c91422828cf19c2a2492baa5b1c58e6091372bb"
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
