class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/paperfoot/mailing-list-cli"
  url "https://github.com/paperfoot/mailing-list-cli/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "006f374d6497eec2a17e22234c5d61d02a8a2d396f414b4d274eb7a85fdadb9a"
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
