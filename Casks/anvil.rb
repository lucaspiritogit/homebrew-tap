cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "1.2.12"
  sha256 arm:   "166770a41e0939541cd5ad9342fb98acc5f6354b25430f6c7135464bf927e885",
         intel: "8b54149405a5cc93b372a9d1da81011ef5497f44bebd55c1ac61b5c455fbdac4"

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