class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/199-biotechnologies/mailing-list-cli"
  url "https://github.com/199-biotechnologies/mailing-list-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "4631ac5e108d8bba0d2e9a49a9c7fb60f3675b60a2d0b46cdc4dc77321c9a444"
  license "MIT"
  head "https://github.com/199-biotechnologies/mailing-list-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "mailing-list-cli", shell_output("#{bin}/mailing-list-cli --version")
    assert_match "agent-info", shell_output("#{bin}/mailing-list-cli --help")
  end
end
