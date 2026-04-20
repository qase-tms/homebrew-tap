class Qasectl < Formula
  desc "CLI tool for Qase test management"
  homepage "https://github.com/qase-tms/qasectl"
  version "0.3.23"

  on_macos do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-arm64"
      sha256 "76d4608f1b261572ae98f21290f0fe2ff0ffb5e0baddc9a4296da7c2227a24c2"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-amd64"
      sha256 "0d52c70b10e771402031ccf0e3e8a4e25129488c61c12f203458d9d133685c49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-arm64"
      sha256 "8ec6f999fe1890f2b1172a2ab7945fe367db31c38f60844f8f28d84bc1ba3d74"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-amd64"
      sha256 "43f82d033c7e4f699d2913b4e8f3c7914b2e73bbc50877569c744c20624f6f86"
    end
  end

  def install
    binary = Dir["qasectl-*"].first
    mv binary, "qasectl"
    bin.install "qasectl"
  end

  test do
    assert_match "Qase CLI", shell_output("#{bin}/qasectl version")
  end
end
