class Lumina < Formula
  include Language::Python::Virtualenv

  desc "Lithophane and Spiral Betty 3D Art Generator CLI"
  homepage "https://github.com/AtaCanYmc/lumina"
  url "https://files.pythonhosted.org/packages/c1/61/354f3b9a1efd72e23777e776eebef7cc2f8f14eb1885b0905a5ea91690fb/lumina_tools-1.3.0.tar.gz"
  sha256 "0cbd8df8cf019964aa515ca11609f5bfeb988e716b1409e161eb42794715544c"
  license "MIT"

  depends_on "numpy"
  depends_on "opencv"
  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38/click-8.5.1.tar.gz"
    sha256 "9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/4e/3a/8770c288c47f0b5c2a786d3c20e79f66fd245f2d42cd232d7cd5e00e83e5/numpy-2.5.5.tar.gz"
    sha256 "5cddc243c75114ba845f01b1f87aca1572dbf7b6c2d88636ed3e1d2bccd7f1bf"
  end

  resource "numpy-stl" do
    url "https://files.pythonhosted.org/packages/56/61/14bd181fec28d1bc268de2a3ce179bb7bdd1ef4152637b1c4a74d048c69c/numpy_stl-4.1.4.tar.gz"
    sha256 "d3985564c49a40e1ab7f07f8f85ee8ef8bef906f762f20cef377f1cdf6895d36"
  end

  resource "opencv-python" do
    url "https://files.pythonhosted.org/packages/24/a2/97d6867da049747d3cd39ddddbe31d421eec42a2f4edadd2e20d5a84b1da/opencv_python-5.1.0.95.tar.gz"
    sha256 "3d4a901a458e9503c92610f237850cfc970c66b3f1cc94f45f2942715280ebab"
  end

  resource "python-utils" do
    url "https://files.pythonhosted.org/packages/f6/bf/e4cc07248ca65fe5065a9712efeace1eba6b0c77c72fc24cbfc8a79ddd80/python_utils-4.2.2.tar.gz"
    sha256 "6c51c46e600c67ad5f16c4205ba875ced4372e560561c5aa3cf52ff1d4657471"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  def install
    venv = virtualenv_create(libexec, "python@3.12", system_site_packages: true)
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Lumina", shell_output("#{bin}/lumina --help")
  end
end
