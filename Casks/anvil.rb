cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.2.0"
  sha256 arm:   "6b5bc2b5eee6afd8542f34837c015f2a455e744f52666be9ddf30bf0fb5da47d",
         intel: "1b38d62b8b258bfc9e58805a40b4493f800cae0e67f32f77d5ab62e0edcf717c"

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