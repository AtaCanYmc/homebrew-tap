class Rtfs < Formula
  desc "Multi-Source Movie & TV Script CLI, Python SDK, and FastMCP Server"
  homepage "https://github.com/AtaCanYmc/rtfs"
  url "https://github.com/AtaCanYmc/rtfs/archive/refs/tags/v0.1.2.tar.gz" # x-release-please-version
  sha256 "6758bfa9c68c11c4c47c6fb2a57f12b2a32b93573013456cceb8917721391c0e"
  license "AGPL-3.0-or-later"
  head "https://github.com/AtaCanYmc/rtfs.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "-v", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "-v", ".[all]"
    bin.install_symlink libexec/"bin/rtfs"
  end

  test do
    assert_match "Multi-Source Movie & TV Script CLI", shell_output("#{bin}/rtfs --help")
    assert_match "Start the FastMCP server", shell_output("#{bin}/rtfs mcp --help")
  end
end
