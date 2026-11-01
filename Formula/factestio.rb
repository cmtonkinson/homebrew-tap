# typed: false
# frozen_string_literal: true

class Factestio < Formula
  desc 'Hierarchical scenario-based test framework for Factorio mods'
  homepage 'https://github.com/cmtonkinson/factestio'
  license 'MIT'
  url 'https://github.com/cmtonkinson/factestio/archive/refs/tags/v0.7.2.tar.gz'
  sha256 'dd98a736abdae27614c510e8c9c17dc0ac24a7f26c954dad4abb7a0a50f6a659'
  version '0.7.2'

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
