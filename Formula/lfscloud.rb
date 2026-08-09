class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.7"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.7/lfscloud-v0.2.7-macos-arm64.tar.gz"
    sha256 "45c809871e2b2c03bc58407a5a49293039dc7dc06f06319b5009c30c64e1d131"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.7/lfscloud-v0.2.7-linux-arm64-musl.tar.gz"
    sha256 "c9147ba85044692548adf44b513eb2dd2b8f06a7665959a5b97e862b87887293"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.7/lfscloud-v0.2.7-linux-x86_64-musl.tar.gz"
    sha256 "6ef8db292b8a84fd7ca6ff100da2aca42ee0ea63675f5d975ebf5ebb5040a528"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
