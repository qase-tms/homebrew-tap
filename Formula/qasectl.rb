class Qasectl < Formula
  desc "CLI tool for Qase test management"
  homepage "https://github.com/qase-tms/qasectl"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-arm64"
      sha256 "74aaf7be9fe703a1842a702abceaefcf04819a6a339b339954ae5a145d0a895f"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-amd64"
      sha256 "abf6422cbf8d3b45300314cf5710f3fef0632107ee35e376f7c4df613d24b5c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-arm64"
      sha256 "29627126280025bab6f7dbe996e64da090b2fa15335d9a0450741220a8110bb4"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-amd64"
      sha256 "4aef241209b2d218a8ff828a650e880874e74d66ac2b327cc496f536fd5c1557"
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
