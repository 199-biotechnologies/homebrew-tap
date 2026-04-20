class Elevenlabs < Formula
  desc "Agent-friendly CLI for the ElevenLabs AI audio platform (TTS, STT, voices, agents, music)"
  homepage "https://github.com/paperfoot/elevenlabs-cli"
  version "0.2.0"
  license "MIT"

  # The canonical tap is now paperfoot/tap. This formula stays here so users
  # who tapped `199-biotechnologies/tap` continue to receive updates, but
  # future users should migrate:
  #
  #   brew untap 199-biotechnologies/tap
  #   brew tap paperfoot/tap
  #
  # The binary and URL point at the new upstream regardless.
  deprecate! date: "2026-04-20", because: "moved to paperfoot/tap; run `brew untap 199-biotechnologies/tap && brew tap paperfoot/tap`"

  on_macos do
    on_arm do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.0/elevenlabs-aarch64-apple-darwin.tar.gz"
      sha256 "319fb514bff41653a65d53f9988852a1db9eb90abfd0b00f11e96e03df8fde8b"
    end
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.0/elevenlabs-x86_64-apple-darwin.tar.gz"
      sha256 "fb89c8e33187e3324cd69b74e89e0bc6d707457f8adbeb74124ca023247d3dba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/elevenlabs-cli/releases/download/v0.2.0/elevenlabs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b88c16f5e389a8efeacd18dd1d7443ebeee9d54773eae36b86a0785b2c843493"
    end
  end

  def install
    bin.install "elevenlabs"
  end

  test do
    assert_match "elevenlabs", shell_output("#{bin}/elevenlabs --version")
    assert_match "agent-info", shell_output("#{bin}/elevenlabs --help")
  end
end
