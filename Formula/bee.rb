class Bee < Formula
  desc "Shared, agent-drawn board for people and their Claude sessions"
  homepage "https://tractat-us.github.io/bee/"
  # Bumped by tractat-us/bee's brew-release workflow on each v<x.y.z> tag. bee is public, so the
  # tarball comes from bee's own release, not a mirror here (fgn mirrors because it is internal).
  url "https://github.com/tractat-us/bee/releases/download/v0.1.0/bee-0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "AGPL-3.0-only"

  # One tarball for every platform: the host and the bridge are plain JVM jars.
  depends_on "openjdk@25"

  def install
    libexec.install Dir["*"]
    # Through opt_libexec, not libexec: bee-up writes the bridge's path into ~/.bee/mcp.json, and
    # the versioned Cellar path would break that file on the next brew upgrade.
    %w[bee-up bee-join bee-session-start-hook].each do |cmd|
      (bin/cmd).write_env_script opt_libexec/cmd, Language::Java.java_home_env("25")
    end
  end

  def caveats
    <<~EOS
      Start a board, open it in your browser, and print the link a coworker joins with:
        bee-up --name <you>
      Join someone else's board:
        bee-join '<their link>' --name <you>
      The board, its keys and the logs live in ~/.bee (or $BEE_HOME), not in the Homebrew prefix.
    EOS
  end

  test do
    port = free_port
    ENV["BEE_HOME"] = (testpath/"home").to_s
    ENV["BEE_NO_OPEN"] = "1"
    begin
      system bin/"bee-up", "--name", "brewtest", "--port", port.to_s, "--local",
             "--data-dir", testpath/"data"
      assert_match "<html", shell_output("curl -fsS http://127.0.0.1:#{port}/")
      assert_match "#{opt_libexec}/bee-mcp/bin/bee-mcp", (testpath/"home/mcp.json").read
    ensure
      system bin/"bee-up", "--stop"
    end
  end
end
