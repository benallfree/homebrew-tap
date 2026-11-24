class Surprisal < Formula
  desc "Lossless compressor that codes with a language model, bit-identical on any hardware"
  homepage "https://github.com/benallfree/surprisal"
  version "0.0.1-alpha.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.1/surprisal_0.0.1-alpha.1_darwin_arm64.tar.gz"
      sha256 "58434f2d94d47e348071ba453000f59f546c4f14a7056ba855a24c53fd8b2e01"
    end
    on_intel do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.1/surprisal_0.0.1-alpha.1_darwin_amd64.tar.gz"
      sha256 "7e6326af9a78fdbfdc6f3d762818013b1e31ca74ac68944fcd70be6914b76908"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.1/surprisal_0.0.1-alpha.1_linux_arm64.tar.gz"
      sha256 "f71dac9fea90241f0abf088a4a96923ed198f722a37e37cbede7af4fb5d0d02e"
    end
    on_intel do
      url "https://github.com/benallfree/surprisal/releases/download/v0.0.1-alpha.1/surprisal_0.0.1-alpha.1_linux_amd64.tar.gz"
      sha256 "02045fe3de6548d87059018340d7d697023387a873c1d3c420103d2c0e0940de"
    end
  end

  def install
    bin.install "surprisal"
  end

  def caveats
    <<~EOS
      Install a model before the first use (downloads the official weights and converts them):
        surprisal --setup good     # Qwen2.5-Coder-0.5B, 0.5 GB
        surprisal --setup best     # Qwen2.5-Coder-7B, 7.3 GB, the default profile
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/surprisal --version")
  end
end
