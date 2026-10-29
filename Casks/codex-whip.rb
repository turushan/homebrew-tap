cask "codex-whip" do
  version "1.12.0"
  sha256 "6291bb3c7350aab48d455b2fcc8ad4a635dfbb9c2dbf0611c5a57077f091e5d2"

  url "https://github.com/turushan/codex-whip/releases/download/v#{version}/Codex-Whip.dmg"
  name "Codex Whip"
  desc "Menu bar app that resumes Codex CLI after capacity errors and quota waits"
  homepage "https://codexwhip.com/"

  livecheck do
    url "https://raw.githubusercontent.com/turushan/codex-whip/main/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Codex Whip.app"

  zap trash: [
    "~/Library/Application Support/Codex Whip",
    "~/Library/Caches/com.turushan.codex-whip",
    "~/Library/HTTPStorages/com.turushan.codex-whip",
    "~/Library/Preferences/com.turushan.codex-whip.plist",
  ]
end
