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
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.10/invoice-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "47aa4c134066475598b4f964cb00b538fae9461c558db4eb5ab6c86e6acc9fad"
    end
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.10/invoice-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "337f902dc23e7613ea7159bd65d107f3a4e7078254f77db8d0f48c7c4acd3aa5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.10/invoice-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5514deb33515065288e1255bdb51077b90a31641830a5b7f2434be3a8df4b01"
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
