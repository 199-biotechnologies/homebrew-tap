class Elevenlabs < Formula
  desc "Agent-friendly Rust CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/199-biotechnologies/elevenlabs-cli"
  url "https://github.com/199-biotechnologies/elevenlabs-cli.git", tag: "v0.1.6"
  license "MIT"
  head "https://github.com/199-biotechnologies/elevenlabs-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "elevenlabs", shell_output("#{bin}/elevenlabs --version")
    assert_match "agent-info", shell_output("#{bin}/elevenlabs --help")
  end
end
