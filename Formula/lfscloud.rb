class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.5"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.5/lfscloud-v0.2.5-macos-arm64.tar.gz"
    sha256 "169ae7dadf371f80c989f0f91b4f1454a90bff5159d159309954525027f55599"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.5/lfscloud-v0.2.5-linux-arm64-musl.tar.gz"
    sha256 "0a091631f3b68941b1c66ec33d1f819f37a4bfeddfd12146dd30395f72cb325f"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.5/lfscloud-v0.2.5-linux-x86_64-musl.tar.gz"
    sha256 "85d43fd330f8274e0662b6d903b260fb0d2e38ac40ba75866ff66d94e78e90a2"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
