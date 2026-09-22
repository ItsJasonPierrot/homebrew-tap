class Readeasy < Formula
  desc "Terminal text-to-speech reader that makes reading easier"
  homepage "https://github.com/ItsJasonPierrot/readeasy"
  url "https://github.com/ItsJasonPierrot/readeasy/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "4ba7644fef4e45e606c0e3a5c23478a677ffb81bf796081a2deb40ab2fc0b36e"
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
