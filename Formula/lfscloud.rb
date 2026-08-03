class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.0/lfscloud-v0.2.0-macos-arm64.tar.gz"
    sha256 "e790988d6ab72a0430bb3a4f7ac630f09df157cc15fef1d717ce03f355a5447d"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.0/lfscloud-v0.2.0-linux-arm64-musl.tar.gz"
    sha256 "e3500524506328f8dfa3787c201c92108c2ba40dccaa10e7def16e51fda3c3ac"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.0/lfscloud-v0.2.0-linux-x86_64-musl.tar.gz"
    sha256 "238abde62f203c97a27b11900c44978246951607ea50209482ed6d5d0dc60cf6"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
