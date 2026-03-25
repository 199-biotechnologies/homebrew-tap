class Labstore < Formula
  desc "Patient biomarker database — longitudinal tracking for longevity assessment"
  homepage "https://github.com/199-biotechnologies/labstore"
  url "https://github.com/199-biotechnologies/labstore.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labstore.git", branch: "main"

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
