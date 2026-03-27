class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend (42 commands, structured JSON, semantic exit codes)"
  homepage "https://github.com/199-biotechnologies/email-cli"
  url "https://github.com/199-biotechnologies/email-cli.git", tag: "v0.1.0"
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
