class Readeasy < Formula
  desc "Terminal text-to-speech reader that makes reading easier"
  homepage "https://github.com/ItsJasonPierrot/readeasy"
  url "https://github.com/ItsJasonPierrot/readeasy/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "8343cf2369ad595d1d288d3b94e2afbef458fd5eb6f96e23a8b025a6964c69bd"
  license "MIT"
  head "https://github.com/ItsJasonPierrot/readeasy.git", branch: "master"

  depends_on "ncurses"

  def install
    system "make", "VERSION=v#{version}"
    bin.install "readeasy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/readeasy --version")
  end
end
