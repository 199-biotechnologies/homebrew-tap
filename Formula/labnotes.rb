class Labnotes < Formula
  desc "Clinical notes and unified patient timeline"
  homepage "https://github.com/199-biotechnologies/labnotes-cli"
  url "https://github.com/199-biotechnologies/labnotes-cli.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labnotes-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labnotes", shell_output("#{bin}/labnotes --version")
  end
end
