class Readeasy < Formula
  desc "Terminal text-to-speech reader that makes reading easier"
  homepage "https://github.com/ItsJasonPierrot/readeasy"
  url "https://github.com/ItsJasonPierrot/readeasy/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ad3cc67892926d351fa7bf820765e19322f1c4ecc74fb49884a2faa521fc9fc1"
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
