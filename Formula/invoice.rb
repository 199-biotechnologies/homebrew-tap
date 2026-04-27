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
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.11/invoice-v0.5.11-aarch64-apple-darwin.tar.gz"
      sha256 "2a98c08e2a46e7c094762522a296a685d015255f8d5b83eb3ac02407353b06e0"
    end
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.11/invoice-v0.5.11-x86_64-apple-darwin.tar.gz"
      sha256 "df7628860b9188829ebefa8ae6ed39c4a41977074d76a210bc07d45c3d4a8e71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.11/invoice-v0.5.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "142b0393b117f33b45b0c57888692a198f19382b69a1f8039534d8c2dc10a8ed"
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
