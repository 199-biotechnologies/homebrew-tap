class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend (42 commands, structured JSON, semantic exit codes)"
  homepage "https://github.com/199-biotechnologies/email-cli"
  url "https://github.com/199-biotechnologies/email-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dd4bb03fe6cade0906c7cf3ca5753b151af67dcf73fa1baefe80399741cdb09e"
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
