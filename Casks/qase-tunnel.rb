cask "qase-tunnel" do
  version "0.1.0-beta.1"
  arch arm: "arm64", intel: "amd64"

  url "https://github.com/qase-tms/qase-tunnel/releases/download/v#{version}/qase-tunnel_#{version}_darwin_#{arch}.tar.gz",
      verified: "github.com/qase-tms/qase-tunnel/"
  name "qase-tunnel"
  desc "Customer-side CLI for Qase private-host tunnels"
  homepage "https://github.com/qase-tms/qase-tunnel"

  sha256 arm:   "a6994355e50f3ae076323498b769a491dcbb00c4cd7bda1e185a0aa1254b0d58",
         intel: "82d9cece121021aaae352eeaab3f404ed94e09b731001401764f594a875c8085"

  binary "qase-tunnel"

  # Releases are unsigned today. Drop the macOS quarantine xattr so first
  # launch doesn't trip Gatekeeper. Remove this block once codesign +
  # notarytool secrets are configured on the qase-tunnel release workflow.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/qase-tunnel"]
  end

  zap trash: [
    "~/.qase-tunnel",
  ]
end
