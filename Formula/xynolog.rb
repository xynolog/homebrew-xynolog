class Xynolog < Formula
  desc "Command-line tool for running and managing local Xynolog stacks"
  homepage "https://github.com/xynolog/cli"
  url "https://github.com/xynolog/cli/archive/754abcc645b18ee745cf553b76e055c26e28f129.tar.gz"
  version "0.7.3"
  sha256 "03fb4f9e1f50e90909062cbefaa082d638d1ef03290bef24399e2ab745a7d4d6"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "git"

  def install
    commit = stable.url[%r{/archive/(\h{40})\.tar\.gz\z}, 1] || odie("the url names no full commit")
    ldflags = "-s -w " \
              "-X github.com/xynolog/cli/internal/launcher.BuildVersion=#{version} " \
              "-X github.com/xynolog/cli/internal/launcher.BuildCommit=#{commit} " \
              "-X github.com/xynolog/cli/internal/launcher.BuildDate=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/xynolog"
  end

  test do
    assert_match "xynolog 0.7.3", shell_output("#{bin}/xynolog --version")
  end
end
