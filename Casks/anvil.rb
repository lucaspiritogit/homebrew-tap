cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.1.0"
  sha256 arm:   "490c1b5682046e52969eacc333f1951e80dc0856e8d90de562891c38bdf6b61b",
         intel: "bd679106e5d6d8a5b4337d433708b57dde06fd384c06f8c08187e6af5823c50c"

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