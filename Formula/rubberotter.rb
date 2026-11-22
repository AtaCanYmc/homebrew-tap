class Rubberotter < Formula
  include Language::Python::Virtualenv

  desc "ATmega32U4 USB HID CLI, Python SDK, and MCP server over BLE and USB Serial"
  homepage "https://github.com/AtaCanYmc/RubberOtter"
  url "https://github.com/AtaCanYmc/RubberOtter/archive/refs/tags/rubber-otter-v1.4.0.tar.gz"
  sha256 "b7f52142c80a84e7b8de2a36aaf40bb1df4b67736ae023b2fe0dbd52c1e7c5dc"
  license "Apache-2.0"
  head "https://github.com/AtaCanYmc/RubberOtter.git", branch: "main"

  depends_on "python@3.12"

  on_macos do
    resource "pyobjc-core" do
      url "https://files.pythonhosted.org/packages/83/58/7bab095330b8893e1ac58f3cf9710462c3242b600f8fa5db0d5dda795775/pyobjc_core-13.0.tar.gz"
      sha256 "ffe154462d14aa4852f424e9116f17b5f8d44f78fc0f6c4727e721a5fa7177da"
    end

    resource "pyobjc-framework-Cocoa" do
      url "https://files.pythonhosted.org/packages/30/50/55a8779d35f1f86d795264cbd6fe62e35b2cf4fb8343fc888e99268c988a/pyobjc_framework_cocoa-13.0.tar.gz"
      sha256 "bb7a23941fc8d7866578dbc84e56140efd343a1d28510f530dd1dbf80807daf4"
    end

    resource "pyobjc-framework-CoreBluetooth" do
      url "https://files.pythonhosted.org/packages/dc/5b/9fd06be0f5815eba5fe8708f6a3f0e37c3e6c6e8aaf2a480c3e5b99cdab6/pyobjc_framework_corebluetooth-13.0.tar.gz"
      sha256 "06c11f81d25286665460facd0b53562faff30d92d3c4a15517042b878c295443"
    end

    resource "pyobjc-framework-libdispatch" do
      url "https://files.pythonhosted.org/packages/ca/67/ec3a8e6dce218dc78968d2a5580d7140b6d93541b76e6ab89147663e7d49/pyobjc_framework_libdispatch-13.0.tar.gz"
      sha256 "840f8f719984b1128ce69e3a586cd10f89a394795885a54be8c1769158cf8555"
    end
  end

  resource "bleak" do
    url "https://files.pythonhosted.org/packages/20/88/b06eabb07b6fea66af0adf3000e1e1edf48e0fd39b731b8de27a093f4f04/bleak-3.1.0.tar.gz"
    sha256 "e37fd30c4691c908d31c8b92ca55b92a22ab924a77c35579822c859042992145"
  end

  resource "blinker" do
    url "https://files.pythonhosted.org/packages/21/28/9b3f50ce0e048515135495f198351908d99540d69bfdc8c1d15b73dc55ce/blinker-1.9.0.tar.gz"
    sha256 "b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38/click-8.5.1.tar.gz"
    sha256 "9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4"
  end

  resource "dbus-fast" do
    on_linux do
      url "https://files.pythonhosted.org/packages/4c/5b/ce64b8788c10a8bd313c8638b28be5dccdd5c2daf14839f23aff37e0b39d/dbus_fast-5.2.0.tar.gz"
      sha256 "a4a5dddc04b1ade5eb7650d791e2f6fb7c1334595593473914e78a2526ecddda"
    end
  end

  resource "flask" do
    url "https://files.pythonhosted.org/packages/26/00/35d85dcce6c57fdc871f3867d465d780f302a175ea360f62533f12b27e2b/flask-3.1.3.tar.gz"
    sha256 "0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb"
  end

  resource "itsdangerous" do
    url "https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d/itsdangerous-2.2.0.tar.gz"
    sha256 "e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/38/9b/e422a865e1d5d57d0e509b4e0bf1c1a70a7f6382c29a5aa428df994c8bc8/markupsafe-3.0.4.tar.gz"
    sha256 "2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3ee119022518edd6"
  end

  resource "pyserial" do
    url "https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz"
    sha256 "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
  end

  resource "werkzeug" do
    url "https://files.pythonhosted.org/packages/a4/34/4dd12fc8bb7d61c91467ec3efe415ffa7d5456f799954b40c5bbaeae470e/werkzeug-3.1.9.tar.gz"
    sha256 "55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources
    venv.pip_install_and_link buildpath/"python"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/rubberotter --help")
    assert_match "usage:", shell_output("#{bin}/otter-cli --help")
  end
end
