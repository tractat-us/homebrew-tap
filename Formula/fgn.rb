class Fgn < Formula
  desc "Fireworks Game Notation CLI — validate, format, and convert Hanabi game records"
  homepage "https://tractat.us/fgn/"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.5/fgn-darwin-arm64"
      sha256 "c97ce032ccf9ae0cb8ee15591692577ea2c1c254aca34f6806d7cbb438a35b0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.5/fgn-linux-x64"
      sha256 "9b4b70340cba4e7a92d20bdb4e2eb0739288e8da005395b39340528b2fa46cad"
    end
  end

  def install
    bin.install Dir["fgn-*"].first => "fgn"
  end

  test do
    assert_match "v0.1.5", shell_output("#{bin}/fgn version")
  end
end
