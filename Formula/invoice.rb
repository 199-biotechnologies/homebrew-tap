class Invoice < Formula
  desc "Beautiful invoices from the CLI — international, stateful, agent-friendly"
  homepage "https://github.com/paperfoot/invoice-cli"
  license "MIT"

  # HEAD builds from source (compile fallback)
  head "https://github.com/paperfoot/invoice-cli.git", branch: "main" do
    depends_on "rust" => :build
  end

  # Typst is required at runtime for PDF rendering
  depends_on "typst"

  # Prebuilt binaries from GitHub Releases — `brew install` is download-only,
  # no Rust toolchain required.
  on_macos do
    on_arm do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.12/invoice-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "c046e4144982188d5f9a0347dd7328d8e74183dec228dffe1a904a8f1bbb5445"
    end
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.12/invoice-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "8fa7e34c58d2f254a35ae02c6a6b4715aac0c46560eb31ac60c2e5a043055b11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.12/invoice-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e882f4a2e2ba953684cbc98662835ed7870dc557ef0abfab6155be8a0faf7090"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "invoice"
      doc.install "README.md", "LICENSE"
    end
  end

  test do
    assert_match "invoice", shell_output("#{bin}/invoice --version")
    assert_match "agent-info", shell_output("#{bin}/invoice --help")
  end
end
