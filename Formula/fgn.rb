class Fgn < Formula
  desc "Fireworks Game Notation CLI — validate, format, and convert Hanabi game records"
  homepage "https://tractat.us/fgn/"
  version "0.1.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.14/fgn-darwin-arm64"
      sha256 "5552bef61399b8b8296f05c81b0cf9151075bf20ab3e536422ae9d18713896b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tractat-us/homebrew-tap/releases/download/v0.1.14/fgn-linux-x64"
      sha256 "c72e4bb5feecc87ad445a6f91f9dcf18f9afa658caeb3fb7e17de759e9675a70"
    end
  end

  def install
    bin.install Dir["fgn-*"].first => "fgn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fgn version")
  end
end
