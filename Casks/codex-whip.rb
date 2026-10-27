cask "codex-whip" do
  arch arm: "arm64", intel: "x86_64"

  version "1.10.3"
  sha256 arm:   "0d09f6290100b7e65f9eb5b78ebf62bbba61168d9055b0902664475278f65937",
         intel: "865d3472a16bcfc1f6c183f06420c577d5262411373ded39cd774fddd8c1a516"

  url "https://github.com/turushan/codex-whip/releases/download/v#{version}/Codex-Whip-#{arch}.dmg"
  name "Codex Whip"
  desc "Menu bar app that gets Codex CLI working again after capacity errors and quota waits"
  homepage "https://codexwhip.com/"

  livecheck do
    url "https://raw.githubusercontent.com/turushan/codex-whip/main/updates/appcast-#{arch}.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Codex Whip.app"

  zap trash: [
    "~/Library/Application Support/Codex Whip",
    "~/Library/Caches/com.turushan.codex-whip",
    "~/Library/HTTPStorages/com.turushan.codex-whip",
    "~/Library/Preferences/com.turushan.codex-whip.plist",
  ]
end
