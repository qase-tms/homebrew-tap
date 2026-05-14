cask "qase-tunnel" do
  version "0.1.0"
  arch arm: "arm64", intel: "amd64"

  url "https://github.com/qase-tms/qase-tunnel/releases/download/v#{version}/qase-tunnel-darwin-#{arch}",
      verified: "github.com/qase-tms/qase-tunnel/"
  name "qase-tunnel"
  desc "Customer-side CLI for Qase private-host tunnels"
  homepage "https://github.com/qase-tms/qase-tunnel"

  sha256 arm:   "793d96cdd19e932deec8004bef9eca2d857dc34ee9e85196b9449de39d088b98",
         intel: "6e3989d213131db8e9bfcc4d115416313628e92402e4c1009f9b60e7055be19f"

  # Rename the platform-suffixed binary to plain `qase-tunnel` on install.
  binary "qase-tunnel-darwin-#{arch}", target: "qase-tunnel"

  # Releases are unsigned today. Drop the macOS quarantine xattr so first
  # launch doesn't trip Gatekeeper. Remove this block once codesign +
  # notarytool secrets are configured on the qase-tunnel release workflow.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/qase-tunnel-darwin-#{arch}"]
  end

  zap trash: [
    "~/.qase-tunnel",
  ]
end
