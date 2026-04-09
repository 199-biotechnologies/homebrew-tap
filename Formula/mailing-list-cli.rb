class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/199-biotechnologies/mailing-list-cli"
  url "https://github.com/199-biotechnologies/mailing-list-cli/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "db26e77a23c0102cdcd75825018a3bda7080c4d220f3357e24fdfc020f8bd106"
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
