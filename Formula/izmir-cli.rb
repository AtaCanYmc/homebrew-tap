class IzmirCli < Formula
  desc "Izmir Buyuksehir Belediyesi Acik Veri Portali CLI Araci"
  homepage "https://github.com/AtaCanYmc/izmir-open-data-js"
  url "https://registry.npmjs.org/izmir-open-data-js/-/izmir-open-data-js-2.2.0.tgz"
  sha256 "f93ac85b1238d0a54deb1ebcaef6e6e2fadb0a2049d212088ee1aa976e23c8d2"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    bin.install_symlink "#{libexec}/bin/izmir-cli" => "izmir"
  end

  test do
    assert_match "Izmir Open Data CLI", shell_output("#{bin}/izmir-cli --help")
    assert_match "Izmir Open Data CLI", shell_output("#{bin}/izmir --help")
  end
end
