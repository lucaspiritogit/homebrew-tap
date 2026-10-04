cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "feec50e8e0cbd9f50f0ca4bcc1dd2370cd610daf9e27e6582a9a408ef2660861",
         intel: "03b3881fabffd5d8795efd2ee894fb16c337f7abf49e53ca266f6911ee8ed05f"

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