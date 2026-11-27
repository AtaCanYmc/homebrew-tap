class HomeLiteLlm < Formula
  desc "Self-hosted LiteLLM gateway CLI for local and cloud AI routing"
  homepage "https://github.com/AtaCanYmc/home-lite-llm"
  url "https://github.com/AtaCanYmc/home-lite-llm/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "97ef8b96765fbdc0e5eb876c47ac5c9eaebfa6c0e74250935e0f7dbb3b97a637"
  license "MIT"

  def install
    pkgshare.install "docs/homelitellm.patch.yml"
    inreplace "scripts/hlm", "docs/homelitellm.patch.yml", "#{pkgshare}/homelitellm.patch.yml"
    bin.install "scripts/hlm"
    zsh_completion.install "completions/hlm.zsh" => "_hlm"
    bash_completion.install "completions/hlm.bash" => "hlm"
  end

  test do
    assert_match "hlm — Home LiteLLM CLI", shell_output("#{bin}/hlm help")
  end
end
