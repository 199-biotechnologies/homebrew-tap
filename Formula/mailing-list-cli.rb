class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/paperfoot/mailing-list-cli"
  url "https://github.com/paperfoot/mailing-list-cli/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "b6947e1dd3218b66fa2c31554ca9e65f240bc0b579ef33204a7a71a2d2d50efa"
  license "MIT"
  head "https://github.com/paperfoot/mailing-list-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "mailing-list-cli", shell_output("#{bin}/mailing-list-cli --version")
    assert_match "agent-info", shell_output("#{bin}/mailing-list-cli --help")
  end
end
