class Labassess < Formula
  desc "Biomarker range checker — score against longevity-optimal ranges"
  homepage "https://github.com/199-biotechnologies/labassess-cli"
  url "https://github.com/199-biotechnologies/labassess.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labassess.git", branch: "main"

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
