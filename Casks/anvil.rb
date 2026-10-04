cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.0.1"
  sha256 arm:   "7f11e4cad9a4aab5990f5e7ee2cdc2e53c7fce4af9121dac418683fded3fa628",
         intel: "f69172a010a7fcbcf8c768ea57db45984244096b11382650ef11920cac3b66fe"

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