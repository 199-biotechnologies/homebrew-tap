class Labparse < Formula
  desc "Lab result parser — PDF/CSV/text to structured biomarker JSON"
  homepage "https://github.com/199-biotechnologies/labparse"
  url "https://github.com/199-biotechnologies/labparse.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labparse.git", branch: "main"

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
