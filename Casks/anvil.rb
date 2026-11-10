cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.4.0"
  sha256 arm:   "907440ee972252549285a49d9f2c44fc5d64c5f28735814c39ee59726e3f5f1b",
         intel: "7ece5ef4fdeec8038d1a807eb0c958aab943264b6ffd4d97c2cca3f07b1da970"

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