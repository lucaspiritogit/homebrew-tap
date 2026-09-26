cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "1.2.14"
  sha256 arm:   "7e44b2ee874852334c501b244b9e8b2993e302cf82ff37e09afe85c6e334aa51",
         intel: "901469b34564a260fb9504b5da52efc0d46a5984265af98b68ec8e194a1dbafa"

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