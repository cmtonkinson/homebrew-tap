class Governator < Formula
  desc "Governator CLI"
  homepage "https://github.com/${REPO_OWNER}/${PROJECT_REPO}"
  license "MIT"

  version "${VERSION}"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/${REPO_OWNER}/${PROJECT_REPO}/releases/download/v#{version}/governator_#{version}_darwin_arm64.tar.gz"
      sha256 "${SHA_DARWIN_ARM64}"
    else
      url "https://github.com/${REPO_OWNER}/${PROJECT_REPO}/releases/download/v#{version}/governator_#{version}_darwin_amd64.tar.gz"
      sha256 "${SHA_DARWIN_AMD64}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/${REPO_OWNER}/${PROJECT_REPO}/releases/download/v#{version}/governator_#{version}_linux_arm64.tar.gz"
      sha256 "${SHA_LINUX_ARM64}"
    else
      url "https://github.com/${REPO_OWNER}/${PROJECT_REPO}/releases/download/v#{version}/governator_#{version}_linux_amd64.tar.gz"
      sha256 "${SHA_LINUX_AMD64}"
    end
  end

  def install
    bin.install "governator"
  end

  test do
    system "#{bin}/governator", "--version"
  end
end
