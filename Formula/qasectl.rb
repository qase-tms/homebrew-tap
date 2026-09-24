class Qasectl < Formula
  desc "CLI tool for Qase test management"
  homepage "https://github.com/qase-tms/qasectl"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-arm64"
      sha256 "3d024e0ec097e5801a12c1a39304db7d2ebf50bae5799c280a6fa60fa2c5e14d"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-darwin-amd64"
      sha256 "4335fa04cb70d0a2080cd466f47e6b2afb21a18ab57fa365af25200c5653e355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-arm64"
      sha256 "792852a95bcbf96ead959ed4063427650c155a88e10c355164b72602474a8849"
    end
    on_intel do
      url "https://github.com/qase-tms/qasectl/releases/download/v#{version}/qasectl-linux-amd64"
      sha256 "92d8542e301f35803f4fa1fd9f04fbc7ea3851808320aee8c36b45dedc34a968"
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
