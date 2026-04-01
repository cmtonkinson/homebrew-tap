# typed: false
# frozen_string_literal: true

class Factestio < Formula
  desc 'Hierarchical scenario-based test framework for Factorio mods'
  homepage 'https://github.com/cmtonkinson/factestio'
  license 'MIT'
  url 'https://github.com/cmtonkinson/factestio/archive/refs/tags/v0.3.0.tar.gz'
  sha256 'e0400e44896c22d39f27e1205404bb2d4c080ae24491f9e9bdc7f8b66b1b02d2'
  version '0.3.0'

  # Lua 5.2 and luarocks are required (not available in Homebrew core).
  # Install via luaver: https://github.com/DhavalKapil/luaver
  #   luaver install 5.2.4 && luaver use 5.2.4
  #   luarocks install --deps-only factestio-*.rockspec
  depends_on 'git'

  def install
    libexec.install Dir['*']
    bin.install_symlink libexec / 'bin/factestio'
  end

  test do
    system "#{bin}/factestio", '--help'
  end

  def caveats
    <<~CAVEATS
      factestio requires Lua 5.2 and LuaRocks dependencies.
      If you haven't already, install them:

        luaver install 5.2.4 && luaver use 5.2.4
        luarocks install --deps-only #{opt_libexec}/factestio-*.rockspec

      See https://github.com/DhavalKapil/luaver for luaver installation.
    CAVEATS
  end
end
