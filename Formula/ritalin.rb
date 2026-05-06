class Ritalin < Formula
  desc "Executive function for AI coding agents"
  homepage "https://github.com/paperfoot/ritalin-cli"
  url "https://github.com/paperfoot/ritalin-cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "18d269177db4e7329152b003d262872ad31117157c04ec80f5a813dfc1eae8a8"
  license "MIT"
  head "https://github.com/paperfoot/ritalin-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "ritalin", shell_output("#{bin}/ritalin --version")
    assert_match "success", shell_output("#{bin}/ritalin agent-info")
  end
end
