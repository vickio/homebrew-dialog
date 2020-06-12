class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://linusakesson.net/dialog/"
  url "https://hd0.linusakesson.net/files/dialog-0k04_0_41.zip"
  version "0k04"
  sha256 "48eb067c835a2a734ba8aa18a58941c001910ba7b0d8a8cdbf031bfff4fe622e"

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
