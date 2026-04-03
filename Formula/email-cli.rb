class EmailCli < Formula
  desc "Agent-friendly email CLI for Resend (50+ commands, structured JSON, semantic exit codes)"
  homepage "https://github.com/199-biotechnologies/email-cli"
  url "https://github.com/199-biotechnologies/email-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "acaf95fc4608a195ea0521c7bd7ba6d48c9a1d146d5589af310e6089117ae112"
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
