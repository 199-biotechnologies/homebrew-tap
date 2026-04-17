class Labhistory < Formula
  desc "Medical history records — allergies, conditions, family, surgical"
  homepage "https://github.com/199-biotechnologies/labhistory-cli"
  url "https://static.crates.io/crates/labhistory/labhistory-0.1.0.crate"
  sha256 "c9a7bb4e27715d89b64e562d2f55664f6a706780e615f390a079644af18633dc"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labhistory", shell_output("#{bin}/labhistory --version")
  end
end
