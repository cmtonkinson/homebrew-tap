class Tsman < Formula
  desc "A feature-rich session manager for tmux"
  homepage "https://github.com/GabrielTecuceanu/tsman"
  url "https://github.com/GabrielTecuceanu/tsman/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "1ba9c86256b73c1dcca793a3241f740cac9f42f90db18525ebb6f2c817651cef"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tsman --version")
  end
end
