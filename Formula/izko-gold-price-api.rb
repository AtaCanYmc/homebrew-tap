class IzkoGoldPriceApi < Formula
  desc "Izmir Jewelers Chamber gold and currency rates CLI, REST API, and MCP server"
  homepage "https://github.com/AtaCanYmc/izko-gold-price-api"
  url "https://github.com/AtaCanYmc/izko-gold-price-api/archive/refs/tags/v0.2.0.tar.gz" # x-release-please-version
  sha256 "f495a452580659aff913e7c3636930831cd501f33dffa2c06b84758800785493"
  license "MIT"
  head "https://github.com/AtaCanYmc/izko-gold-price-api.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "-v", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "-v", "."
    bin.install_symlink libexec/"bin/izko-gold-price-api"
    bin.install_symlink libexec/"bin/izko-gold-price-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/izko-gold-price-api --version")
    assert_match "izko.org.tr", shell_output("#{bin}/izko-gold-price-api config")
  end
end
