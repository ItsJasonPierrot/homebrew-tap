class Readeasy < Formula
  desc "Terminal text-to-speech reader that makes reading easier"
  homepage "https://github.com/ItsJasonPierrot/readeasy"
  url "https://github.com/ItsJasonPierrot/readeasy/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "2d3368384c82180e111e3317f84f981aa4558e0d57d265b353052999e97ea6a4"
  license "MIT"
  head "https://github.com/ItsJasonPierrot/readeasy.git", branch: "master"

  depends_on "ncurses"

  def install
    system "make", "VERSION=v#{version}"
    bin.install "readeasy"
  end

  def caveats
    <<~EOS
      Reading PDFs (readeasy file.pdf) needs poppler's pdftotext:
        brew install poppler
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/readeasy --version")
  end
end
