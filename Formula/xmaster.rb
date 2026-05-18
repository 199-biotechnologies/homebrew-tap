class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.8/xmaster-aarch64-darwin"
      sha256 "4ac295ad1b1fe6e1a9fd543b158cb6f6eebeaad1e76f5f9097f03a2a6ff49363"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.8/xmaster-x86_64-darwin"
      sha256 "7639a48878eeafd4df8c7f2e4b5c953b3c8e2fdd54dd7e5c7399ec5adc618551"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.8/xmaster-x86_64-linux"
    sha256 "46f77a3d12bf8e296eafe4d6eb0ff4241a8cf0124283f5e44d295809755afaa8"
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
