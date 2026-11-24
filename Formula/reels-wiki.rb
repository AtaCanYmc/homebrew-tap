class ReelsWiki < Formula
  include Language::Python::Virtualenv

  desc "Turn saved Instagram Reels into atomic Obsidian LLM Wiki notes"
  homepage "https://github.com/AtaCanYmc/reels-wiki"
  url "https://github.com/AtaCanYmc/reels-wiki/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a8acf39b8d0991412a231e35d203abe93677c814d6fe39386030b5975e879144"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage: reels-sync", shell_output("#{bin}/reels-sync --help")
  end
end
