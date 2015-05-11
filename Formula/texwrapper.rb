class Texwrapper < Formula
  homepage "http://obrecht.fr/texwrapper/"
  url "http://obrecht.fr/texwrapper/texwrapper.0.2.2.tar.gz"
  sha256 "408cf3678db657b0c0edf276d768dad562302451639f0ad6e705133db60dcb64"

  def install
    system "make"
    bin.install "texwrapper"
    man1.install "texwrapper.1"
  end

  test do
    (testpath/"test.tex").write <<-EOTEX.undent
      \\documentstyle[11pt]{article}
      \\begin{document}
      \\title{Test of TeXwrapper}
      \\maketitle
      This is just a test.
      \\end{document}
    EOTEX
    refute File.exist?(testpath/"test.ps")
    system bin/"texwrapper", "-lcp", testpath/"test.tex"
    assert File.exist?(testpath/"test.ps")
  end
end
