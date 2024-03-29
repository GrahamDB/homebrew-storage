class S3fsRgw < Formula
  desc "FUSE-based file system backed by Amazon S3, modified for "
  homepage "https://github.com/s3fs-fuse/s3fs-fuse/wiki"
  url url "https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.85.tar.gz"
  sha256 "c4b48c0aba6565b9531c251d42a6a475a7e845909a3017b61d9c945b15cc008f"
  head "https://github.com/GrahamDB/s3fs-fuse.git", :branch => "osx_iosize" 

  bottle do
    cellar :any
    sha256 "d1f6ed9a6ba336c7d7650a27df5aedc8307596bfa909f764f44ee2a57c56aa97" => :catalina
    sha256 "08a49f1747589a73c47e1d33009ab1ec9f915e8198bfce4471e9deb3ab22b3ec" => :mojave
    sha256 "c9f8045bd8cf246306103400cfe191e92a41d52baccd7ab9596dd80cdaa30237" => :high_sierra
    sha256 "37952aa8b45492b8fcd4b3c468b5c72ceec9407b1126a79c1cbf4f0a9f0e878b" => :sierra
  end
  conflicts_with "s3fs", :because => "because both install 's3fs' binaries"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "gnutls"
  depends_on "libgcrypt"
  depends_on "nettle"

  depends_on :osxfuse

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--with-gnutls", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/s3fs", "--version"
  end
end

