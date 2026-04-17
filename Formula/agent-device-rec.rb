class AgentDeviceRec < Formula
  desc "Health device recommendations from scored biomarker data"
  homepage "https://github.com/199-biotechnologies/agent-device-rec"
  url "https://static.crates.io/crates/agent-device-rec/agent-device-rec-0.1.0.crate"
  sha256 "cea75d548de687580b4ef7e2a257f9a5ebe076676b43ffb9a53f346aa13292a7"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "agent-device-rec", shell_output("#{bin}/agent-device-rec --version")
  end
end
