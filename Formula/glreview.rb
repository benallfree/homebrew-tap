class Glreview < Formula
  desc "Open a git worktree in VS Code with GitLens comparing it against its merge base"
  homepage "https://github.com/benallfree/glreview"
  url "https://github.com/benallfree/glreview/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "deb113c2e718074771ba10e76865ad1bca93168cd160aa91f8e962a0f21d3205"
  license "MIT"
  head "https://github.com/benallfree/glreview.git", branch: "main"

  def install
    bin.install "glreview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glreview --version")
    system "git", "init", "-q", "-b", "main", testpath/"repo"
    system "git", "-C", testpath/"repo", "-c", "user.name=t", "-c", "user.email=t@example.com",
           "commit", "-q", "--allow-empty", "-m", "init"
    assert_match "eamodio.gitlens/link/r/-/compare/", shell_output("#{bin}/glreview --dry-run #{testpath}/repo")
  end
end
