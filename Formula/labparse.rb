class Labparse < Formula
  desc "Parse lab results into structured biomarker JSON"
  homepage "https://github.com/199-biotechnologies/labparse-cli"
  url "https://static.crates.io/crates/labparse/labparse-0.1.0.crate"
  sha256 "48a5c0b37ff696b0015ef704996e643ff76c131c283f262a7acedaa4a08798f4"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labparse", shell_output("#{bin}/labparse --version")
    output = shell_output("#{bin}/labparse --text 'HbA1c 5.8%' --json")
    assert_match "hba1c", output
  end
end
