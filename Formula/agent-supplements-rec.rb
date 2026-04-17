class AgentSupplementsRec < Formula
  desc "Curated supplement recommendations from scored biomarker data"
  homepage "https://github.com/199-biotechnologies/agent-supplements-rec"
  url "https://static.crates.io/crates/agent-supplements-rec/agent-supplements-rec-0.1.0.crate"
  sha256 "9ad7c04573c50d73c3292c3a320acec140f9487618cd376bf1162e868efaf991"
  license "Proprietary"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "agent-supplements-rec", shell_output("#{bin}/agent-supplements-rec --version")
  end
end
