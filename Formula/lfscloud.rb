class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.6"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.6/lfscloud-v0.2.6-macos-arm64.tar.gz"
    sha256 "e9f16f63d0eee2a930ec3c9328eb125c8d8c1ff1b9100732d5671d72228918d5"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.6/lfscloud-v0.2.6-linux-arm64-musl.tar.gz"
    sha256 "bfe2e7bfad253bb83b5f325cb5872e67e1b0a40402c73d2aebc4cb2a9236bab7"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.6/lfscloud-v0.2.6-linux-x86_64-musl.tar.gz"
    sha256 "155499688683af8efddad0b8b6c2140e87dcefcc009a643f182bb7b2d9eddeed"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
