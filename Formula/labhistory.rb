class Labhistory < Formula
  desc "Medical history records — allergies, conditions, family, surgical"
  homepage "https://github.com/199-biotechnologies/labhistory-cli"
  url "https://github.com/199-biotechnologies/labhistory-cli.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/labhistory-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labhistory", shell_output("#{bin}/labhistory --version")
  end
end
