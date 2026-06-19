class Fgn < Formula
  desc "Fireworks Game Notation CLI — validate, format, and convert Hanabi game records"
  homepage "https://tractat.us/fgn/"
  version "0.1.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.12/fgn-darwin-arm64"
      sha256 "f3db1df5a1698d466b11c32f3cd0ad0cd0edf47964256a588216c35692293e19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.12/fgn-linux-x64"
      sha256 "9fd32251cc4602ccdadd64db32b1135f8f7fa448b548be51911cd498858b6800"
    end
  end

  def install
    bin.install Dir["fgn-*"].first => "fgn"
  end

  test do
    assert_match "v0.1.5", shell_output("#{bin}/fgn version")
  end
end
