class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://linusakesson.net/dialog/"
  url "https://hd0.linusakesson.net/files/dialog-0k05_0_42.zip"
  version "0k05"
  sha256 "8e0844c47ccf7d768c4d2d15c2f5df1517d3e5c89ab04172ce7af3090087210e"

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
