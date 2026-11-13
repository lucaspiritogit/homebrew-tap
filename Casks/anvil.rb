cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.7.0"
  sha256 arm:   "cfac060bec79765cc9be5c7e884dd22663ed79b804a08a09f2fc02ad9d1f72fb",
         intel: "b7db84f1bb38f5752c14ac8f84efa2a48b3f63b0b76394b6728e5271b396454b"

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