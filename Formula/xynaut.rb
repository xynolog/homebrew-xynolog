class Xynaut < Formula
  desc "Xynoplex CLI for running and managing local Semiont stacks"
  homepage "https://github.com/Xynoplex/xynaut"
  url "https://github.com/Xynoplex/xynaut/archive/caab8da9da2f15fb4032c37a0c109a457db8e7dc.tar.gz"
  version "0.9.0"
  sha256 "154b3ee65e967c35b7208e7b7ce942fda06a10201d8a725ecc1a65927a61e10f"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "git"

  def install
    ldflags = "-s -w " \
              "-X github.com/Xynoplex/xynaut/internal/launcher.BuildVersion=#{version} " \
              "-X github.com/Xynoplex/xynaut/internal/launcher.BuildCommit=" \
              "caab8da9da2f15fb4032c37a0c109a457db8e7dc " \
              "-X github.com/Xynoplex/xynaut/internal/launcher.BuildDate=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/xynaut"
  end

  test do
    assert_match "xynaut 0.9.0", shell_output("#{bin}/xynaut --version")
  end
end
