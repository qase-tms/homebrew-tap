class Qasectl < Formula
  desc "CLI tool for Qase test management"
  homepage "https://github.com/qase-tms/qasectl"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-arm64"
      sha256 "79215ed5e9e7b63a03c93e69b0ceb13b1832e9ffcf7f31d7c35e2546deda6c58"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-amd64"
      sha256 "f5a455233ed6f6be70caf861b94022c5d8d91917a0cf8c7aae64d384f3e8e6cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-arm64"
      sha256 "4bef7ae1fbccabff551fc8913ed5abe908055c16e64e49d698bd6f5f00a2e6aa"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-amd64"
      sha256 "20760c82843ff2273653056c81ec54bd7943b4b3fefa6a78d268c9693fe94ccb"
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
