class Qasectl < Formula
  desc "CLI tool for Qase test management"
  homepage "https://github.com/qase-tms/qasectl"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-arm64"
      sha256 "617d07d0a8dbf6914438c6a35be8912a6e241731aad75c187c77f6801e54fa54"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-amd64"
      sha256 "4758dd543fb17ddfd289e1de77426a8072fbad76c8053b84e994d44bd33611f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-arm64"
      sha256 "2e65a1fe3993c7a62100469ba23766e03b2ad4b740bce406ae3100d86b3b1e5b"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-amd64"
      sha256 "cdb7aa40dd92beca444a37305af4f8b225816f6d563bb36a23b585658b23a0ba"
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
