class Invoice < Formula
  desc "Beautiful invoices from the CLI — international, stateful, agent-friendly"
  homepage "https://github.com/paperfoot/invoice-cli"
  version "0.5.8"
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
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.8/invoice-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "b7f1f139b86e2e9c57cc364ed37f8c8d7fdc296dcf60b93aa0a2cd42f42929ee"
    end
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.8/invoice-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "f9fd01e755132675948dc567ba90c9b27643660bf3558e74870de399091ee465"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.8/invoice-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89698b382de5311373b9ebe9e95b04d5d3c7f58fceee0216bd8cdcdf6f5e97d9"
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
