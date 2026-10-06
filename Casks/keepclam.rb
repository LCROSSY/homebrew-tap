cask "keepclam" do
  version "0.2.2"
  sha256 "95f8e72171e873e1b15396d4b352a00ccd206982931e6a0583eb6bd36e2aa4f5"

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
