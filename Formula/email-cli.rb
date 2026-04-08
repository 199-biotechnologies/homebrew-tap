class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend (70+ commands, structured JSON, semantic exit codes)"
  homepage "https://github.com/199-biotechnologies/email-cli"
  url "https://github.com/199-biotechnologies/email-cli/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "776102d4c8e8821745612dff1ce404b7b9dc839366a823a00482d284001b6c7b"
  license "MIT"
  head "https://github.com/199-biotechnologies/email-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "email-cli", shell_output("#{bin}/email-cli --version")
    assert_match "agent-info", shell_output("#{bin}/email-cli --help")
  end
end
