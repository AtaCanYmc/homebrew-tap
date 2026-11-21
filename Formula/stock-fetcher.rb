class StockFetcher < Formula
  desc "Unified copyright-free stock image search and download CLI"
  homepage "https://github.com/AtaCanYmc/stock-fetcher"
  url "https://github.com/AtaCanYmc/stock-fetcher/archive/refs/tags/stock-fetcher-v0.4.0.tar.gz" # x-release-please-version
  sha256 "19824972a9a17dc97e5a710040980ff9e6a29cea8c65caf511ccd3b3c6039ab3"
  license "Apache-2.0"
  head "https://github.com/AtaCanYmc/stock-fetcher.git", branch: "main"

  livecheck do
    url :stable
    regex(/^stock-fetcher-v(\d+(?:\.\d+)+)$/i)
  end

  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "-v", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "-v", ".[cli]"
    bin.install_symlink libexec/"bin/stock-fetcher"
  end

  test do
    assert_match "stock-fetcher", shell_output("#{bin}/stock-fetcher version")
  end
end
