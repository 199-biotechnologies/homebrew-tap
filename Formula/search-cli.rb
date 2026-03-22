class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI (11 providers, 14 modes)"
  homepage "https://github.com/199-biotechnologies/search-cli"
  url "https://github.com/199-biotechnologies/search-cli.git", tag: "v0.3.1"
  license "MIT"
  head "https://github.com/199-biotechnologies/search-cli.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "search", shell_output("#{bin}/search --version")
    assert_match "agent-info", shell_output("#{bin}/search --help")
  end
end
