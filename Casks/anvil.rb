cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.0.2"
  sha256 arm:   "925a5459411fb490aeff83c7ef0727fbc637ccfa9ac8dce96e34089a3eb15fd3",
         intel: "b7d9d580fd3a002942d5af47197e6c5b37baf2e672057131da3cd51693d9e02f"

  url "https://github.com/lucaspiritogit/anvil/releases/download/v#{version}/Anvil-#{version}-#{arch}.dmg"
  name "Anvil"
  desc "Desktop control plane for coding agents"
  homepage "https://github.com/lucaspiritogit/anvil"

  depends_on :macos

  app "Anvil.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Anvil.app"]
  end

  caveats <<~EOS
    Anvil is ad-hoc signed but is not notarized by Apple.
    If macOS blocks its first launch, open System Settings >
    Privacy & Security and choose Open Anyway for Anvil.
  EOS
end