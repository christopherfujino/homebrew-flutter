class LibimobiledeviceFlutter < Formula
  desc "Library to communicate with iOS devices natively"
  homepage "https://www.libimobiledevice.org/"
  revision 3

  head do
    url 'https://github.com/christopherfujino/libimobiledevice.git'
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    #depends_on "libxml2"
  end

  depends_on "pkg-config" => :build
  depends_on "libplist-flutter"
  depends_on "libtasn1"
  depends_on "usbmuxd-flutter"
  depends_on "openssl-flutter"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          # As long as libplist builds without Cython
                          # bindings, libimobiledevice must as well.
                          "--without-cython",
                          "--enable-debug-code"
    system "make", "install"
  end

  test do
    system "#{bin}/idevicedate", "--help"
  end
end
