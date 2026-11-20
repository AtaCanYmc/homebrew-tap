class IzmirData < Formula
  desc "Izmir Buyuksehir Belediyesi Acik Veri Portali CLI ve MCP Sunucusu"
  homepage "https://github.com/AtaCanYmc/izmir-open-data-py"
  url "https://github.com/AtaCanYmc/izmir-open-data-py/archive/refs/tags/v0.3.0.tar.gz" # x-release-please-version
  sha256 "c2b98920e36b04f8ea1e29fd0ec7d8d1b08a09256809600c14c501c30aac9ffd"
  license "Apache-2.0"
  head "https://github.com/AtaCanYmc/izmir-open-data-py.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "-v", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "-v", "."
    system libexec/"bin/pip", "uninstall", "-y", "watchfiles"
    bin.install_symlink libexec/"bin/izmir-data"
    bin.install_symlink libexec/"bin/izmir-mcp"
  end

  test do
    assert_match "Izmir Open Data CLI", shell_output("#{bin}/izmir-data --help")
  end
end
