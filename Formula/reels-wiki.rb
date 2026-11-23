class ReelsWiki < Formula
  include Language::Python::Virtualenv

  desc "Turn saved Instagram Reels into atomic Obsidian LLM Wiki notes"
  homepage "https://github.com/AtaCanYmc/reels-wiki"
  url "https://github.com/AtaCanYmc/reels-wiki/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1bb0241ce5b9c82ae56b85b09fc27cfc92f2b55268a790be0d9136146858e6d6"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage: reels-sync", shell_output("#{bin}/reels-sync --help")
  end
end
