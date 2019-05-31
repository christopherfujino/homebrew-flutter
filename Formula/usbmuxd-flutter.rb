class UsbmuxdFlutter < Formula
  desc "USB multiplexor daemon for iPhone and iPod Touch devices"
  homepage "https://www.libimobiledevice.org/"
  revision 1

  head do
    url "https://github.com/christopherfujino/libusbmuxd.git"
    #url "https://git.sukimashita.com/libusbmuxd.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "libplist-flutter"
  depends_on "libusb-flutter"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"iproxy"
  end
end
