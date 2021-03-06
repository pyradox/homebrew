require 'formula'

class Libming < Formula
  url 'https://sourceforge.net/projects/ming/files/Releases/Ming%200.4.3/ming-0.4.3.tar.bz2'
  sha1 'e51a1c9de7efcd6b20f727a824cfbf323b6f5e6f'
  homepage 'http://www.libming.org'

  depends_on :libpng

  def install
    # TODO: Libming also includes scripting front-ends for Perl, Python, TCL
    # and PHP.  These are disabled by default.  Figure out what it would take to
    # enable them.
    system "./configure", "--prefix=#{prefix}", "--disable-debug",
           "--disable-dependency-tracking"
    system "make"

    # Won't install in parallel for some reason.
    ENV.deparallelize
    system "make install"
  end
end
