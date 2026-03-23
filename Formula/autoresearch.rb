class Autoresearch < Formula
  desc "Universal autoresearch CLI — install skills, track experiments, any AI agent"
  homepage "https://github.com/199-biotechnologies/autoresearch-cli"
  url "https://github.com/199-biotechnologies/autoresearch-cli.git", tag: "v0.1.2"
  license "MIT"
  head "https://github.com/199-biotechnologies/autoresearch-cli.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "autoresearch", shell_output("#{bin}/autoresearch --version")
    assert_match "agent-info", shell_output("#{bin}/autoresearch --help")
  end
end
