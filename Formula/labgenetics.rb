class Labgenetics < Formula
  desc "Genetic variant analysis — pathogenicity, pharmacogenomics, risk"
  homepage "https://github.com/199-biotechnologies/labgenetics-cli"
  url "https://static.crates.io/crates/labgenetics/labgenetics-0.1.0.crate"
  sha256 "9b30b5bb745e9eb3fa2e5fcb9c1998e8fa2c37f7f0d77a208e1ce4a6017a1f72"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labgenetics", shell_output("#{bin}/labgenetics --version")
  end
end
