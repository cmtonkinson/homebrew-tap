# typed: false
# frozen_string_literal: true

class Factestio < Formula
  desc "Hierarchical scenario-based test framework for Factorio mods"
  homepage "https://github.com/cmtonkinson/factestio"
  license "MIT"
  url "https://github.com/cmtonkinson/factestio/archive/refs/tags/v0.0.18.tar.gz"
  sha256 "6437a5ea9b15f6101e2d7360362f7b5cf88a36db28b0ed2a2e906a3fdcf06046"
  version "0.0.18"

  # Lua 5.2 and luarocks are required (not available in Homebrew core).
  # Install via luaver: https://github.com/DhavalKapil/luaver
  #   luaver install 5.2.4 && luaver use 5.2.4
  #   luarocks install --deps-only factestio-*.rockspec
  depends_on "git"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/factestio"
  end

  test do
    system "#{bin}/factestio", "--help"
  end

  def caveats
    <<~EOS
      factestio requires Lua 5.2 and LuaRocks dependencies.
      If you haven't already, install them:

        luaver install 5.2.4 && luaver use 5.2.4
        luarocks install --deps-only #{opt_libexec}/factestio-*.rockspec

      See https://github.com/DhavalKapil/luaver for luaver installation.
    EOS
  end
end
