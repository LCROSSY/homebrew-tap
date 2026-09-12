cask "keepclam" do
  version "0.1.0"
  sha256 "dce672f097bcd13b6b0f97fdc0d9df8b706fe28855a9c9153e21dc573aa12f13"

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
