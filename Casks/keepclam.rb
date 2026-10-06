cask "keepclam" do
  version "0.2.3"
  sha256 "7862d5bdd8204e3fa75b909de099f59bb67f13968034f6d929eef57d67b60c8e"

  url "https://github.com/LCROSSY/KeepClam/releases/download/v#{version}/KeepClam-#{version}.zip"
  name "KeepClam"
  desc "Keep your MacBook running with its lid closed"
  homepage "https://github.com/LCROSSY/KeepClam"

  depends_on macos: :ventura

  app "KeepClam.app"

  caveats <<~EOS
    This is a preview release, ad-hoc signed and not notarized by Apple.
    If macOS blocks the app, review Privacy & Security in System Settings.
    Before unattended use, configure passwordless authorization in the app.
    Disable Launch at Login, stop the active session and quit before uninstalling.
    Uninstalling does not remove the optional sudoers authorization;
    see the project README for removal instructions.
  EOS
end
