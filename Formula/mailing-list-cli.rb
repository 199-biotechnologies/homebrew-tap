class MailingListCli < Formula
  desc "Newsletter and mailing list management from the terminal. Built for AI agents on top of email-cli"
  homepage "https://github.com/paperfoot/mailing-list-cli"
  url "https://github.com/paperfoot/mailing-list-cli/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "c9db0c12d1c0964090f40eeaf09ec3c63c3f18d34ad79e8b1f126e75c4bcb1ed"
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
