class HomeLiteLlm < Formula
  desc "Self-hosted LiteLLM gateway CLI for local and cloud AI routing"
  homepage "https://github.com/AtaCanYmc/home-lite-llm"
  url "https://github.com/AtaCanYmc/home-lite-llm/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "fd47104b3318130ffb68d733fd91cfdce5d6b0f5dd9c42f7d362cacedd063d67"
  license "MIT"

  def install
    bin.install "scripts/hlm"
  end

  test do
    assert_match "hlm — Home LiteLLM CLI", shell_output("#{bin}/hlm help")
  end
end
