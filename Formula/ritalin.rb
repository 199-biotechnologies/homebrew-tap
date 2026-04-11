class Ritalin < Formula
  desc "Proof-carrying completion for AI coding agents"
  homepage "https://github.com/199-biotechnologies/ritalin"
  url "https://github.com/199-biotechnologies/ritalin/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6d3b63569ea347cc1f4c20617c5e347cfd4e91b4f7923ef754f10f1b619b917f"
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
