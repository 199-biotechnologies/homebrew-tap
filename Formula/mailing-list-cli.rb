class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/paperfoot/mailing-list-cli"
  url "https://github.com/paperfoot/mailing-list-cli/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "f006f63bcb329bffcb99a862badb86f29f82c7de6ef2b62471df8a2d399253fc"
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
