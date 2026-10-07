cask "keepclam" do
  version "0.2.4"
  sha256 "ce6a0a3554e9d023da378f78798483f916bc8515f3ca66763d9ca21020962b63"

  url "https://github.com/LCROSSY/KeepClam/releases/download/v#{version}/KeepClam-#{version}.zip"
  name "KeepClam"
  desc "Keep your MacBook running with its lid closed"
  homepage "https://github.com/LCROSSY/KeepClam"

  depends_on macos: :ventura

  app "KeepClam.app"

  # 与一行命令安装（install.sh --trust）一致：只移除 KeepClam 自身的下载隔离标记，
  # 否则未公证的应用首次打开会被 Gatekeeper 拦截。
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/KeepClam.app"]
  end

  caveats <<~EOS
    This is a preview release, ad-hoc signed and not notarized by Apple.
    The cask removes the quarantine attribute from KeepClam.app only,
    the same as the one-line installer, so it opens without Gatekeeper prompts.
    Before unattended use, configure passwordless authorization in the app.
    Disable Launch at Login, stop the active session and quit before uninstalling.
    Uninstalling does not remove the optional sudoers authorization;
    see the project README for removal instructions.
  EOS
end
