class ReelsWiki < Formula
  include Language::Python::Virtualenv

  desc "Turn saved Instagram Reels into atomic Obsidian LLM Wiki notes"
  homepage "https://github.com/AtaCanYmc/reels-wiki"
  url "https://github.com/AtaCanYmc/reels-wiki/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "ec32236a2394b5816f44a6ba037f0b7ff114e988fea902adbaecbe644fb25b94"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage: reels-sync", shell_output("#{bin}/reels-sync --help")
  end
end
