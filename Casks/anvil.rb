cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.6.0"
  sha256 arm:   "9d69ee7bd75bcf7f8a03e84290d79c72cd68790b184c33abaf1ed808c4e4dc2b",
         intel: "abd850f2653dc47558f63ae679f08366bb6a4f337b5781a3254cd36a8beecec4"

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