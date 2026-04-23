class Ritalin < Formula
  desc "Executive function for AI coding agents"
  homepage "https://github.com/paperfoot/ritalin-cli"
  url "https://github.com/paperfoot/ritalin-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "6c8ceb107e23103e6e76e94c6ff054215d025c080f2cfc7beec3ee0a08b0f7b8"
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
