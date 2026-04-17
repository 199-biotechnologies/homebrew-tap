class Labage < Formula
  desc "Biological aging clocks — multi-modal age estimation"
  homepage "https://github.com/199-biotechnologies/labage-cli"
  url "https://static.crates.io/crates/labage/labage-0.1.0.crate"
  sha256 "89c1abe3acaac625766959185b09d8aa34c2e92983a853eaa451d26f083633d9"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labage", shell_output("#{bin}/labage --version")
  end
end
