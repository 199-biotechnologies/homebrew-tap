class Longevx < Formula
  desc "Patient biomarker database — longitudinal tracking for longevity assessment"
  homepage "https://github.com/199-biotechnologies/longevx"
  url "https://github.com/199-biotechnologies/longevx.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/longevx.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "longevx", shell_output("#{bin}/longevx --version")
    output = shell_output("#{bin}/longevx agent-info")
    assert_match "patient_management", output
  end
end
