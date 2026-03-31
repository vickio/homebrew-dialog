class DialogIf < Formula
  desc "Domain-specific language for creating works of interactive fiction"
  homepage "https://linusakesson.net/dialog/"

  disable! date: "2025-03-31", because: "a community-maintained fork is now available at dialog-if/brew"

  def install
    odie <<~EOS
      This tap is deprecated. Please migrate to the community-maintained tap:
        brew untap vickio/dialog
        brew tap dialog-if/brew
        brew install dialog-if/brew/dialog-if
    EOS
  end
end
