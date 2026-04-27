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
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.9/invoice-v0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "0d2133fb4336d3dcabd1ee91e689eb5eac965ea06e9708f9a7e3253e6c39e71a"
    end
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.9/invoice-v0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "5b2b5075e3f1ec3912b5d0bac79b84955be33b39c72c0a2441b59c984c680872"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paperfoot/invoice-cli/releases/download/v0.5.9/invoice-v0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "649ccdf3fcb760c28168781a3914ff936ba2ecd5743a161bcafbcf53abe8a1fa"
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
