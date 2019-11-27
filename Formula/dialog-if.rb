class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://linusakesson.net/dialog/"
  url "https://hd0.linusakesson.net/files/dialog-0h04_0_31.zip"
  version "0h04"
  sha256 "3d80dab1019dc316512c5f0cefca2293ddfbf1d92488e042e47f0e884f2b40f7"

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
