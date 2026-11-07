cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "3eea2dae21c0dcbc1898fa0520e3d2f1e258586d064e7d0ba0411ee5a6d6ed6b",
         intel: "58c54d944d065a2ec9c2901abea5b78aebf958912445d25c37f6afadf576aef0"

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