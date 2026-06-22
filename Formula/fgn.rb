class Fgn < Formula
  desc "Fireworks Game Notation CLI — validate, format, and convert Hanabi game records"
  homepage "https://tractat.us/fgn/"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.13/fgn-darwin-arm64"
      sha256 "deb3d16d33a9d0fb7aeb927c44c83898a6a15b74013cbc3a1a81db3c4c20c884"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.13/fgn-linux-x64"
      sha256 "dddf51fcbf44aa6cd2606dae05e3a0e6ffcaa08ec41c19135086a576d255fb9c"
    end
  end

  def install
    bin.install Dir["fgn-*"].first => "fgn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fgn version")
  end
end
