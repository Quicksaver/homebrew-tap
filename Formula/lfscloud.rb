class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.2"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.2/lfscloud-v0.2.2-macos-arm64.tar.gz"
    sha256 "065b35caa9e7fccf1cce1316faa1642f83c276b0a36a408077dc5478a9e4d495"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.2/lfscloud-v0.2.2-linux-arm64-musl.tar.gz"
    sha256 "6d2b18ba2ea9e2cfe05b67827682b09ea716eb077005092bb50cc900051cac24"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.2/lfscloud-v0.2.2-linux-x86_64-musl.tar.gz"
    sha256 "49249ad8069ef07b77db8ab343b1d20395d80d709ac4a2a20c5c1725df060e49"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
