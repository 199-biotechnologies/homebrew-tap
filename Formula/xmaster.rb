class Xmaster < Formula
  desc "Enterprise-grade X CLI — post, reply, like, retweet, DM, search, and more"
  homepage "https://github.com/199-biotechnologies/xmaster"
  url "https://github.com/199-biotechnologies/xmaster.git", tag: "v1.2.2"
  license "MIT"
  head "https://github.com/199-biotechnologies/xmaster.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (prefix/"scripts").install "scripts/gen_transaction_id.py"
  end

  test do
    assert_match "xmaster", shell_output("#{bin}/xmaster --version")
    assert_match "success", shell_output("#{bin}/xmaster agent-info")
  end
end
