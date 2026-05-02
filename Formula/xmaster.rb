class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.6/xmaster-aarch64-darwin"
      sha256 "4c3eaad6ef772e85b5db6f216d493a4f3436eeab7c38559132541ff4f740631b"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.6/xmaster-x86_64-darwin"
      sha256 "ad451dbb9ef475a0b3450746035830b457878c6daedbf1e6898bc3364e24fc87"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.6/xmaster-x86_64-linux"
    sha256 "2bff3a63cb034f9a7ce3f68f3a0a962ddfb5fda964d1079b9f1ffdefbce9d30f"
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
