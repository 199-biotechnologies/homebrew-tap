class Labscript < Formula
  desc "Prescription PDF generator with e-signature and QR verification"
  homepage "https://github.com/199-biotechnologies/labscript-cli"
  url "https://github.com/199-biotechnologies/labscript-cli.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labscript-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labscript", shell_output("#{bin}/labscript --version")
  end
end
