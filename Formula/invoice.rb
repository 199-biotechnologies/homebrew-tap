class Invoice < Formula
  desc "Beautiful invoices from the CLI — international, stateful, agent-friendly"
  homepage "https://github.com/paperfoot/invoice-cli"
  version "0.2.2"
  license "MIT"

  # Prebuilt binaries from GitHub Releases — `brew install` is download-only,
  # no Rust toolchain required.
  on_macos do
    on_arm do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.2.2/invoice-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "5fd72a78c487786db600bcfc7f69c4d603121463a6cceeccb7d2e5212302ab78"
    end
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.2.2/invoice-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "8eb8f92db20c034b38703fc0332d6bad0691944295bd3bd732308fc8af9f46b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.2.2/invoice-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f0f138e645066ed3b4fad630bd2e8dcf6755c1c36afbfee676a9d7ea5651be1"
    end
  end

  # HEAD builds from source (compile fallback)
  head "https://github.com/paperfoot/invoice-cli.git", branch: "main" do
    depends_on "rust" => :build
  end

  # Typst is required at runtime for PDF rendering
  depends_on "typst"

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
