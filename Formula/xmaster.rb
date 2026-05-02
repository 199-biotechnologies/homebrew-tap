class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.5/xmaster-aarch64-darwin"
      sha256 "d997d8c3853ce4430c064863cefb0558f29cf01d3c551fb63801e11e0d142c5a"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.5/xmaster-x86_64-darwin"
      sha256 "d76e8ba109c23d0a0de5ce2cdcbcc4b096e1fd70fc6a6b9301e1a04f077d5823"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.6.5/xmaster-x86_64-linux"
    sha256 "21c4e4d7149969086006deb125309cdf1680cc4c41ca87f0d09c9d0e1523c611"
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
