class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 14 modes)"
  homepage "https://github.com/199-biotechnologies/search-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/search-cli/releases/download/v0.5.0/search-aarch64-apple-darwin.tar.gz"
      sha256 "aa1354d7a1c166d5a7b5b4fc94c3de8cb865d9762deae5fcb37f53dcc2321ac6"
    else
      url "https://github.com/199-biotechnologies/search-cli/releases/download/v0.5.0/search-x86_64-apple-darwin.tar.gz"
      sha256 "6d5187f616a49328a970d254ecd05ec49b0a8a8bb74ec1c23d6a4ae768e87726"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.5.0", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end

