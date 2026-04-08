class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend (70+ commands, structured JSON, semantic exit codes)"
  homepage "https://github.com/199-biotechnologies/email-cli"
  url "https://github.com/199-biotechnologies/email-cli/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "e8ab891d2b3e0947f5655f6a2a57c9aa441045072db568f155cc56a360bf091c"
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
