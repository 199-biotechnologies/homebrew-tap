require "language/node"

class Nanaban < Formula
  desc "Image generation from the terminal — Nano Banana (Gemini) and GPT Image via one CLI"
  homepage "https://github.com/199-biotechnologies/nanaban"
  url "https://github.com/199-biotechnologies/nanaban/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "f0ea411e25c02899d0a1716338ced81c419b2e6d688596e7dbc4209724437ae4"
  license "MIT"
  head "https://github.com/199-biotechnologies/nanaban.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match(/^\d+\.\d+\.\d+$/, shell_output("#{bin}/nanaban --version").strip)
    assert_match "nanaban", shell_output("#{bin}/nanaban --help")
    assert_match "models", shell_output("#{bin}/nanaban agent-info")
  end
end
