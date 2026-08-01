class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.1.4"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.1.4/lfscloud-v0.1.4-macos-arm64.tar.gz"
    sha256 "f27eaa4c0877a9b988ef98884591275cfd5afa151a5be4e6b9d95b5c5c24af4e"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.1.4/lfscloud-v0.1.4-linux-arm64-musl.tar.gz"
    sha256 "d856f6bbd02a7547450ab97b198d65d6faf8803f2aebedc491beacdd06c6f0eb"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.1.4/lfscloud-v0.1.4-linux-x86_64-musl.tar.gz"
    sha256 "f1d4e4fe284ecf9f029308116a1b7217ec089ae4a9f06fd6001c0466086ff6a5"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
