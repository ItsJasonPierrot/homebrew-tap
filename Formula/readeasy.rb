class Readeasy < Formula
  desc "Terminal text-to-speech reader that makes reading easier"
  homepage "https://github.com/ItsJasonPierrot/readeasy"
  url "https://github.com/ItsJasonPierrot/readeasy/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "662aed14936027bac7f4abfbef45c7f6fdba7aaa075d20953ad15434d18a1133"
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
