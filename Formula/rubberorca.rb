class Rubberorca < Formula
  include Language::Python::Virtualenv

  desc "ESP32-S3 USB-OTG HID CLI, Python SDK, and stdio MCP server over BLE 5.0"
  homepage "https://github.com/AtaCanYmc/RubberOrca"
  url "https://github.com/AtaCanYmc/RubberOrca/archive/refs/tags/rubber-orca-v0.1.4.tar.gz"
  sha256 "1ff9f6ddd41fd6f2a7cd12b57e87d508432f118f9c9dc686c996eefe6058206f"
  license "Apache-2.0"
  head "https://github.com/AtaCanYmc/RubberOrca.git", branch: "main"

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

  resource "pyserial" do
    url "https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz"
    sha256 "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
  end

  resource "dbus-fast" do
    on_linux do
      url "https://files.pythonhosted.org/packages/4c/5b/ce64b8788c10a8bd313c8638b28be5dccdd5c2daf14839f23aff37e0b39d/dbus_fast-5.2.0.tar.gz"
      sha256 "a4a5dddc04b1ade5eb7650d791e2f6fb7c1334595593473914e78a2526ecddda"
    end
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources
    venv.pip_install_and_link buildpath/"python"
  end

  test do
    assert_match "rubberorca", shell_output("#{bin}/rubberorca --help")
    assert_match "rubberorca-mcp", shell_output("#{bin}/rubberorca-mcp --help")
  end
end
