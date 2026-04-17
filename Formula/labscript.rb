class Labscript < Formula
  desc "Prescription PDF generator with e-signature and QR verification"
  homepage "https://github.com/199-biotechnologies/labscript-cli"
  url "https://static.crates.io/crates/labscript/labscript-0.1.0.crate"
  sha256 "933fb8d34ecff70f4f546258d97ec43cbf6f98b53250841450b0ed4075e79915"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labscript", shell_output("#{bin}/labscript --version")
  end
end
