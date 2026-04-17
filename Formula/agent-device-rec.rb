class AgentDeviceRec < Formula
  desc "Health device recommendations from scored biomarker data"
  homepage "https://github.com/199-biotechnologies/agent-device-rec"
  url "https://github.com/199-biotechnologies/agent-device-rec.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/agent-device-rec.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "agent-device-rec", shell_output("#{bin}/agent-device-rec --version")
  end
end
