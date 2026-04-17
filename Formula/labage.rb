class Labage < Formula
  desc "Biological aging clocks — multi-modal age estimation"
  homepage "https://github.com/199-biotechnologies/labage-cli"
  url "https://github.com/199-biotechnologies/labage-cli.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labage-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labage", shell_output("#{bin}/labage --version")
  end
end
