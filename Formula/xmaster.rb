class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.1/xmaster-aarch64-darwin"
      sha256 "1f8c412b76df33601dded5f6b65974b7cb0bfa53285b3b8cbe48548bb0c2fc79"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.1/xmaster-x86_64-darwin"
      sha256 "3afe1dc4be3d29a76d366b7ebbf0d133d9e21a063ba540be6a325318800f0ec3"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.1/xmaster-x86_64-linux"
    sha256 "330c9d7e7787f12f0a27fb2ded7e6a4fa8d2a1f6413780582970df1d56a74396"
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
