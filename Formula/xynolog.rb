class Xynolog < Formula
  desc "Xynoplex CLI for running and managing local Semiont stacks"
  homepage "https://github.com/xynolog/cli"
  url "https://github.com/xynolog/cli/archive/5d0f02a.tar.gz"
  version "0.7.3"
  sha256 "0c095686bed966ad0b0f383bd9a94afc1a2a7ebf1ba3e32170c4b96c37e48180"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "git"

  def install
    ldflags = "-s -w " \
              "-X github.com/Xynoplex/cli/internal/launcher.BuildVersion=#{version} " \
              "-X github.com/Xynoplex/cli/internal/launcher.BuildCommit=" \
              "5d0f02a226b6ab2d8b7e658b494adfb5d660389b " \
              "-X github.com/Xynoplex/cli/internal/launcher.BuildDate=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/xynolog"
  end

  test do
    assert_match "xynolog 0.7.3", shell_output("#{bin}/xynolog --version")
  end
end
