class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.3"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.3/lfscloud-v0.2.3-macos-arm64.tar.gz"
    sha256 "1b709e224bc7923c00bb6cee1153d3573a31772dc0bb80498405ff36cd7c4115"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.3/lfscloud-v0.2.3-linux-arm64-musl.tar.gz"
    sha256 "7e34923d64741421bc7adb97b98cf3d1ea9f14e2eda4f468900dbd66161ab0bf"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.3/lfscloud-v0.2.3-linux-x86_64-musl.tar.gz"
    sha256 "d1a7c4251c8f96aedec4598eff89135cf4fda1300eaeb91010936d9402426771"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
