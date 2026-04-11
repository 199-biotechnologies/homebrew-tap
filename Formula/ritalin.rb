class Ritalin < Formula
  desc "Proof-carrying completion for AI coding agents"
  homepage "https://github.com/199-biotechnologies/ritalin"
  url "https://github.com/199-biotechnologies/ritalin/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e74752fc52bb1f7b29112c457ddfe4eb2d6a2e46ca84d42ffdb560ca6e27de08"
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
