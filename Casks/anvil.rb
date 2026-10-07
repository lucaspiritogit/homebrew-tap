cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.1.2"
  sha256 arm:   "25e7d4800043ce29b2934b4f20727d8f777b38eda83ead1e2e9fa4a893a5fe2a",
         intel: "fd88fd0160a67f33122db195d1415ac71e4ffd2421ad5507b7c090fc23be6996"

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