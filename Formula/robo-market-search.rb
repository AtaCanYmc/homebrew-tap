class RoboMarketSearch < Formula
  include Language::Python::Virtualenv

  desc "Turkiye'nin Elektronik Market Arama Motoru ve Sepet Optimizasyon CLI"
  homepage "https://github.com/AtaCanYmc/robo-market-search"
  url "https://files.pythonhosted.org/packages/06/75/7da20f38bde48435e6df828f3b67a36508fa880e47a2a782fb238bf2e4d2/robo_market_search-1.12.0.tar.gz"
  sha256 "6c7442bae2dfda9f6eb9504f98435cfc6bab605cc60350bae6793413bc6aa5bf"
  license "Apache-2.0"

  depends_on "python@3.12"

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/43/65/318323f98dbee45d42dff61d8f047181bc6f2268a9068cfad035a46be5af/beautifulsoup4-4.15.0.tar.gz"
    sha256 "288e3ca7d54b06f2ac191970bc275c1939cb46d450b255bf6718b04aa37ab4f7"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555/certifi-2026.10.23.tar.gz"
    sha256 "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f/cffi-2.1.1.tar.gz"
    sha256 "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
  end

  resource "curl-cffi" do
    url "https://files.pythonhosted.org/packages/96/4c/69074f9797d83a5401b3c6bc58c5de5aad6d1a085d0497b87a093a152e87/curl_cffi-0.17.0.tar.gz"
    sha256 "31ee8500d06d6502ce1ec0b7ded1c5aa8e8f3401bbe37ccd78d6153d859d8f3c"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/cb/27/eeb9f307bf07060f3d9f9aa0fb8c15b01bdfded0a941e4b2719c7f94cacd/pycparser-3.12.tar.gz"
    sha256 "f03387877eab82ce01bbdfd0ba7252ee55a90b1c708d5129e2ce915475cf1db6"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/17/35/bf779c1cc376bc216a2d94e3b3d9ee48347296af29bedfc6caaf96bc132f/soupsieve-4.1.2.tar.gz"
    sha256 "c6539a2638f26991463527337e39d630e3cbb86d024f52282a510535b8a7e09f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Robo Market Search", shell_output("#{bin}/robo-search --help")
  end
end
