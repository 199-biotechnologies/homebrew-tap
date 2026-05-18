class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.7/xmaster-aarch64-darwin"
      sha256 "bb1112cc755cefe9c55eeb13c5c1cee78ef7a3de438d0f1cec6b1ae96318479e"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.7/xmaster-x86_64-darwin"
      sha256 "d194a2e7f5f22278e0d4cc685fd87fdf723a276c5617e8e9acd22b967ec01a07"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.7/xmaster-x86_64-linux"
    sha256 "9f9611ecc4cadccc0780e64d91e70bc3c0a2e5d0f433e2cf21939422e0f1c104"
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
