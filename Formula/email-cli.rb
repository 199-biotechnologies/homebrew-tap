class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend (42 commands, structured JSON, semantic exit codes)"
  homepage "https://github.com/199-biotechnologies/email-cli"
  url "https://github.com/199-biotechnologies/email-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "19cd8f1e9c9177a1e28636fd39dd05b8f07a39f75dc7f35c4e04e2305617ddf2"
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
