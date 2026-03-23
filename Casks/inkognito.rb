cask "inkognito" do
  version "0.0.1"

  on_arm do
    url "https://github.com/arch-33/inkognito/releases/download/v#{version}/Inkognito_#{version}_aarch64.dmg"
    sha256 "0d86fc2168d6f2257dab6d1cd23d518021a8853f30fa06afd096438b3d6743ec"
  end

  on_intel do
    url "https://github.com/arch-33/inkognito/releases/download/v#{version}/Inkognito_#{version}_x64.dmg"
    sha256 "1a37ad87b08bfeca053e654359edc528e67328b6c0754503751699dee47f5432"
  end

  name "Inkognito"
  desc "Privacy-focused markdown notepad with screen capture protection"
  homepage "https://inkognito.dev"

  livecheck do
    url "https://github.com/arch-33/inkognito/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Inkognito.app"

  zap trash: [
    "~/Library/Application Support/dev.arch-33.inkognito",
    "~/Library/Caches/dev.arch-33.inkognito",
    "~/Library/Preferences/dev.arch-33.inkognito.plist",
  ]
end
