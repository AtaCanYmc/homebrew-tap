class StockFetcher < Formula
  include Language::Python::Virtualenv

  desc "Unified copyright-free stock image search and download CLI"
  homepage "https://github.com/AtaCanYmc/stock-fetcher"
  url "https://github.com/AtaCanYmc/stock-fetcher/archive/refs/tags/stock-fetcher-v0.3.0.tar.gz" # x-release-please-version
  sha256 "9d4d12ce1390527143370afcaea09366652d2fbfcba6a49200961506fbe3c6c2"
  license "Apache-2.0"
  head "https://github.com/AtaCanYmc/stock-fetcher.git", branch: "main"

  livecheck do
    url :stable
    regex(/^stock-fetcher-v(\d+(?:\.\d+)+)$/i)
  end

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "-v", ".[cli]"
    bin.install_symlink libexec/"bin/stock-fetcher"
  end

  test do
    assert_match "stock-fetcher", shell_output("#{bin}/stock-fetcher version")
  end
end
