class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://linusakesson.net/dialog/"
  url "https://hd0.linusakesson.net/files/dialog-0h05_0_32.zip"
  version "0h05"
  sha256 "467885b1d93e9d780de9af07cb4645a6591330f5e86222b2b370913d37ed97e7"

  def install
    chdir "src" do
      system "make"
      bin.install "dgdebug", "dialogc"
    end
    doc.install Dir["docs/*"]
    prefix.install "readme.txt", "license.txt"
    pkgshare.install "stdlib.dg", "stddebug.dg"
  end

  test do
    (testpath/"test.dg").write("(program entry point) hello world")
    system bin/"dialogc", "-tz8", "test.dg"
    assert_predicate testpath/"test.z8", :exist?
  end
end
