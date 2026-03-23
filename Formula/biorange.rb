class Biorange < Formula
  desc "Biomarker range checker — score against longevity-optimal ranges"
  homepage "https://github.com/199-biotechnologies/biorange"
  url "https://github.com/199-biotechnologies/biorange.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/biorange.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "biorange", shell_output("#{bin}/biorange --version")
    output = shell_output("#{bin}/biorange --biomarker HbA1c --value 5.8 --unit '%' --json")
    assert_match "hba1c", output
  end
end
