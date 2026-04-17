class Invoice < Formula
  desc "Beautiful invoices from the CLI — international, stateful, agent-friendly"
  homepage "https://github.com/199-biotechnologies/invoice-cli"
  url "https://github.com/199-biotechnologies/invoice-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ab20f418601a2e451e9c7c225c8e3904d145f4aa3b9fdda7899110d1380caddc"
  license "MIT"
  head "https://github.com/199-biotechnologies/invoice-cli.git", branch: "main"

  depends_on "rust" => :build
  depends_on "typst"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "invoice", shell_output("#{bin}/invoice --version")
    assert_match "agent-info", shell_output("#{bin}/invoice --help")
  end
end
