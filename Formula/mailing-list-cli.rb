class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/199-biotechnologies/mailing-list-cli"
  url "https://github.com/199-biotechnologies/mailing-list-cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "36f4bd2f77f93f17e3986df52fe0a567982588c080cb916c3d991027ac18facf"
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
