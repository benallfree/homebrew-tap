class Surprisal < Formula
  desc "Lossless compressor that codes with a language model, bit-identical on any hardware"
  homepage "https://github.com/benallfree/surprisal"
  version "0.0.1-alpha.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.2/surprisal_0.0.1-alpha.2_darwin_arm64.tar.gz"
      sha256 "53d241eff95e7b49a8f1aebe8fc08fe8024cb9d0e0ca8ce6fa7df41c48589fa4"
    end
    on_intel do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.2/surprisal_0.0.1-alpha.2_darwin_amd64.tar.gz"
      sha256 "8ef43c73221781b72ecae0ad6341b3addd6c99ea5d61094e74b0dd9e83540805"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.2/surprisal_0.0.1-alpha.2_linux_arm64.tar.gz"
      sha256 "a2fb325096deae1971452ebc3b3b5a5713ff81fb76a794cdbd2e2833cd8eabb6"
    end
    on_intel do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.2/surprisal_0.0.1-alpha.2_linux_amd64.tar.gz"
      sha256 "69d006c0c8d90d83faa1b541314b513bcad768f94bf36cb62cebaf35161aca18"
    end
  end

  def install
    bin.install "surprisal"
  end

  def caveats
    <<~EOS
      The first use of a level downloads its model into ~/.surprisal (once):
        surprisal -1 ...     # levels 1-3 (-1 is the default): 0.5 GB
        surprisal -9 ...     # levels 7-9: 7.9 GB
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/surprisal --version")
  end
end
