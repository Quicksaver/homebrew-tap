class Lfscloud < Formula
  desc "Git LFS-compatible server and CLI for user-controlled storage"
  homepage "https://github.com/Quicksaver/lfs-cloud"
  version "0.2.4"
  license "MIT"

  if OS.mac?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.4/lfscloud-v0.2.4-macos-arm64.tar.gz"
    sha256 "391ef2ddf09002c0f0ad48e8bc03beec8cfd9ce62b9f85a646a1c54c4b105410"
    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.4/lfscloud-v0.2.4-linux-arm64-musl.tar.gz"
    sha256 "96c50e2b16437000bb17c08957079bf205d4190ebf68e4c2223f75b7e44bd72c"
  else
    url "https://github.com/Quicksaver/lfs-cloud/releases/download/v0.2.4/lfscloud-v0.2.4-linux-x86_64-musl.tar.gz"
    sha256 "52aede09dcc38a1f60c73d1c07c5f679cb6feba602324ade17d9adf67898b0bc"
  end

  def install
    bin.install "lfscloud"
  end

  test do
    assert_equal "lfscloud #{version}", shell_output("#{bin}/lfscloud --version").strip
  end
end
