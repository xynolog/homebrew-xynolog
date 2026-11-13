class Xynaut < Formula
  desc "Xynoplex CLI for running and managing local Semiont stacks"
  homepage "https://github.com/Xynoplex/xynaut"
  url "https://github.com/Xynoplex/xynaut/archive/3812f5c.tar.gz"
  version "0.9.0"
  sha256 "68800b9c73725bc66dda089a27bd1afd2a1ac37225e83e894e3c68d96ae98a7b"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "git"

  def install
    ldflags = "-s -w " \
              "-X github.com/Xynoplex/xynaut/internal/launcher.BuildVersion=#{version} " \
              "-X github.com/Xynoplex/xynaut/internal/launcher.BuildCommit=" \
              "3812f5c8e302d2ad45144bf5858573eaa5ac342f " \
              "-X github.com/Xynoplex/xynaut/internal/launcher.BuildDate=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/xynaut"
  end

  test do
    assert_match "xynaut 0.9.0", shell_output("#{bin}/xynaut --version")
  end
end
