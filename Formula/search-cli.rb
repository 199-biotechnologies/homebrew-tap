class SearchCli < Formula
  desc "Agent-friendly multi-provider search CLI with email verification (12 providers, 14 modes)"
  homepage "https://github.com/199-biotechnologies/search-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/199-biotechnologies/search-cli/releases/download/v0.5.1/search-aarch64-apple-darwin.tar.gz"
      sha256 "9a6f746fa5acaca9ecbf2ca93a8db2be45467b8fcb29cbc48efa8765cddbca8b"
    else
      url "https://github.com/199-biotechnologies/search-cli/releases/download/v0.5.1/search-x86_64-apple-darwin.tar.gz"
      sha256 "dbecfe8d82b9ea72e18c19aaa8a04868cf3166fb765200160bfc5c9bb13fec60"
    end
  end

  def install
    bin.install "search"
  end

  test do
    assert_match "search 0.5.1", shell_output("#{bin}/search --version")
    assert_match "verify", shell_output("#{bin}/search --help")
  end
end
