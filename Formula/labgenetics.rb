class Labgenetics < Formula
  desc "Genetic variant analysis — pathogenicity, pharmacogenomics, risk"
  homepage "https://github.com/199-biotechnologies/labgenetics-cli"
  url "https://github.com/199-biotechnologies/labgenetics-cli.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labgenetics-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labgenetics", shell_output("#{bin}/labgenetics --version")
  end
end
