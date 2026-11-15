class Xynaut < Formula
  desc "Xynoplex CLI for running and managing local Semiont stacks"
  homepage "https://github.com/Xynoplex/cli"
  url "https://github.com/Xynoplex/cli/archive/ce059ff.tar.gz"
  version "0.7.3"
  sha256 "2b2838b77f5d4183fa17c7ebe7d8bcd76116edb431cc3d60b1398918c21cff19"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "git"

  def install
    ldflags = "-s -w " \
              "-X github.com/Xynoplex/cli/internal/launcher.BuildVersion=#{version} " \
              "-X github.com/Xynoplex/cli/internal/launcher.BuildCommit=" \
              "ce059ffb0927f989f2b1aa38b19b3dc56d3a10d4 " \
              "-X github.com/Xynoplex/cli/internal/launcher.BuildDate=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/xynaut"
  end

  test do
    assert_match "xynaut 0.7.3", shell_output("#{bin}/xynaut --version")
  end
end
