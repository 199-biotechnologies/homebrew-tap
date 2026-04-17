class Labstore < Formula
  desc "Patient biomarker database CLI — longitudinal tracking, trends, and export"
  homepage "https://github.com/199-biotechnologies/labstore-cli"
  url "https://static.crates.io/crates/labstore/labstore-0.1.0.crate"
  sha256 "024c840626a38b36e3d68b179dc7c581727bd39ce519892cd30f26f44218a748"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labstore", shell_output("#{bin}/labstore --version")
    output = shell_output("#{bin}/labstore agent-info")
    assert_match "patient_management", output
  end
end
