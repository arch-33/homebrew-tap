cask "inkognito" do
  version "0.0.2"

  on_arm do
    url "https://github.com/arch-33/inkognito/releases/download/v#{version}/Inkognito_#{version}_aarch64.dmg"
    sha256 "41798de19a91e9349ea908726702bdb87acf11254cc44bbfb35e2b78f76e0176"
  end

  on_intel do
    url "https://github.com/arch-33/inkognito/releases/download/v#{version}/Inkognito_#{version}_x64.dmg"
    sha256 "2685e111289fed0cad3a01218aaa7095ead77c259b8cca7c9182bc34cdc8b523"
  end

  name "Inkognito"
  desc "Privacy-focused markdown notepad with screen capture protection"
  homepage "https://arch-33.github.io/inkognito/"

  livecheck do
    url "https://github.com/arch-33/inkognito/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "Inkognito.app"

  postflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/Inkognito.app"
  end

  zap trash: [
    "~/Library/Application Support/dev.arch-33.inkognito",
    "~/Library/Caches/dev.arch-33.inkognito",
    "~/Library/Preferences/dev.arch-33.inkognito.plist",
  ]
end
