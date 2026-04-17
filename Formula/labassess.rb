class Labassess < Formula
  desc "Score biomarkers against longevity-optimal ranges"
  homepage "https://github.com/199-biotechnologies/labassess-cli"
  url "https://static.crates.io/crates/labassess/labassess-0.1.0.crate"
  sha256 "a03f8a6652402340ef7f60ab6da260a518c6c7e3fe1f969ea8d01198af0edb2f"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labassess", shell_output("#{bin}/labassess --version")
    output = shell_output("#{bin}/labassess --biomarker HbA1c --value 5.8 --unit '%' --json")
    assert_match "hba1c", output
  end
end
