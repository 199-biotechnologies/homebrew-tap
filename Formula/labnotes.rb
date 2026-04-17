class Labnotes < Formula
  desc "Clinical notes and unified patient timeline"
  homepage "https://github.com/199-biotechnologies/labnotes-cli"
  url "https://static.crates.io/crates/labnotes/labnotes-0.1.0.crate"
  sha256 "331cb1ae3a2cefcc38a43166f5b556f915ecd03ba92949d56870275e39244d73"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "labnotes", shell_output("#{bin}/labnotes --version")
  end
end
