class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/paperfoot/xmaster-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.0/xmaster-aarch64-darwin"
      sha256 "7887a78f2421333e8a4227316c1250496708ec579e578e1a67ed41d2727107bc"
    else
      url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.0/xmaster-x86_64-darwin"
      sha256 "8ae029a4bd43ba454b404a86e778ffafc66e5496196db9674994d2a7d9ea2259"
    end
  elsif OS.linux?
    url "https://github.com/paperfoot/xmaster-cli/releases/download/v1.7.0/xmaster-x86_64-linux"
    sha256 "5314338c6da67dcda5cf769359f1abca6db44787a435d2b7729fc30559ba4ad8"
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
