cask "anvil" do
  arch arm: "arm64", intel: "x64"

  version "1.2.8"
  sha256 arm:   "1e53f2137a07b28b08ce3733e34e45e2868b921e8d708446bfd7d7104a9bf821",
         intel: "7eb9345e8c6a5306fd65e8a16c216c4d0a59949bac927fd844fdd3f8159bf4fd"

  url "https://github.com/lucaspiritogit/anvil/releases/download/v#{version}/Anvil-#{version}-#{arch}.dmg"
  name "Anvil"
  desc "Desktop control plane for coding agents"
  homepage "https://github.com/lucaspiritogit/anvil"

  depends_on :macos

  app "Anvil.app"

  caveats <<~EOS
    Anvil is ad-hoc signed but is not notarized by Apple.
    If macOS blocks its first launch, open System Settings >
    Privacy & Security and choose Open Anyway for Anvil.
  EOS
end