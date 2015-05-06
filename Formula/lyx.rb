class Lyx < Formula
  homepage "http://www.lyx.org/"
  url "ftp://ftp.lyx.org/pub/lyx/stable/2.1.x/lyx-2.1.3.tar.xz"
  version "2.1.3"
  sha256 "2fd52e7e5ee372983eb6b0a7f04765cb0df6f8c1f3420081d9f7761acfc75682"

  depends_on "boost"
  depends_on "libmagic"
  depends_on "qt"

  def install
    ENV["QT4DIR"] = Formula["qt"].prefix
    ENV.append "CPPFLAGS", "-I" + Formula["boost"].include + "/boost/tr1"
    interactive_shell

    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--without-included-boost"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "false"
  end
end
