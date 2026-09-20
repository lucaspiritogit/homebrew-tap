cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "1.2.13"
  sha256 arm:   "4dc82578b63422eefde84a21aad93d696022026b812ac3ff8c3bc24dc4fd220f",
         intel: "5198f04e2d14c657fe1fc4c266d43bc6cb81398b25004fa58fc8b3738a698a76"

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