class Lyx < Formula
  homepage "http://www.lyx.org/"
  url "ftp://ftp.lyx.org/pub/lyx/stable/2.1.x/lyx-2.1.3.tar.xz"
  version "2.1.3"
  sha256 "2fd52e7e5ee372983eb6b0a7f04765cb0df6f8c1f3420081d9f7761acfc75682"

  depends_on :x11
  depends_on "boost"
  depends_on "libmagic"
  depends_on "qt"

  def install
    ENV["QT4DIR"] = Formula["qt"].prefix
    ENV.append "CPPFLAGS", "-I" + Formula["boost"].include + "/boost/tr1"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--without-included-boost"
    system "make", "install"
  end

  test do
    system "false"
  end
end
