class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.1"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.1/lfscloud-v0.2.1-macos-arm64.tar.gz"
    sha256 "436af1e86d5a32f39456ce4b62805da246c8c93835a59663b4f35a4cf5ef75b5"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.1/lfscloud-v0.2.1-linux-arm64-musl.tar.gz"
    sha256 "65e9b93d4a96a23f0294db96707c2e515221fe4e497a69368dfad3ee08f98aa9"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.1/lfscloud-v0.2.1-linux-x86_64-musl.tar.gz"
    sha256 "b2b5ee6dd2ac92e399a37e46d5c05eb8401127562148df9fa866efff95ba62a1"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
