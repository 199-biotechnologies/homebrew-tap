class AgentSupplementsRec < Formula
  desc "Curated supplement recommendations from scored biomarker data"
  homepage "https://github.com/199-biotechnologies/agent-supplements-rec"
  url "https://github.com/199-biotechnologies/agent-supplements-rec.git", tag: "v0.1.0"
  license "Proprietary"
  head "https://github.com/199-biotechnologies/agent-supplements-rec.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "agent-supplements-rec", shell_output("#{bin}/agent-supplements-rec --version")
  end
end
