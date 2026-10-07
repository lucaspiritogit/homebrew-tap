cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.1.3"
  sha256 arm:   "39f3bfba0645b7487cd27081696565ca2d8769c83a7e1c1e16247dd1f11cde3f",
         intel: "af9872dff23e708dd72c4be575957c63c81e662921d027a851e566c33fea07b3"

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