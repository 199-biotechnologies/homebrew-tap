class Genai < Formula
  desc "AI image and video generation CLI — fal.ai + OpenAI"
  homepage "https://github.com/199-biotechnologies/genai"
  url "https://github.com/199-biotechnologies/genai.git", tag: "v0.1.0"
  license "MIT"
  head "https://github.com/199-biotechnologies/genai.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "genai", shell_output("#{bin}/genai --version")
    assert_match "agent-info", shell_output("#{bin}/genai --help")
  end
end
