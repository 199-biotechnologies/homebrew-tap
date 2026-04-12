class Ritalin < Formula
  desc "Executive function for AI coding agents"
  homepage "https://github.com/199-biotechnologies/ritalin"
  url "https://github.com/199-biotechnologies/ritalin/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5ece907533936f83d18f66737f9f5a0867b0088f0bcf66c557ebf919b0cba4a6"
  license "MIT"
  head "https://github.com/199-biotechnologies/ritalin.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "ritalin", shell_output("#{bin}/ritalin --version")
    assert_match "success", shell_output("#{bin}/ritalin agent-info")
  end
end
