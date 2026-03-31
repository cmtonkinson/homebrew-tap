# typed: false
# frozen_string_literal: true

class Factestio < Formula
  desc "Hierarchical scenario-based test framework for Factorio mods"
  homepage "https://github.com/cmtonkinson/factestio"
  license "MIT"
  url "https://github.com/cmtonkinson/factestio/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "b254b041f6bc129a19c1f5b7a029fd4dbdfed362904fc366f6f556e0025689d9"
  version "0.0.8"

  # Lua 5.2 and luarocks are required (not available in Homebrew core).
  # Install via luaver: https://github.com/DhavalKapil/luaver
  #   luaver install 5.2.4 && luaver use 5.2.4
  #   luarocks install --deps-only factestio-0.1-0.rockspec
  depends_on "git"

  def install
    libexec.install Dir["*"]

    # Write a wrapper that hardcodes FACTESTIO_ROOT to libexec.
    # Assumes lua (5.2.x via luaver) and required rocks are on PATH.
    (bin/"factestio").write <<~SH
      #!/usr/bin/env zsh
      export FACTESTIO_ROOT="#{libexec}"
      export LUA_PATH="#{libexec}/?.lua;#{libexec}/?/init.lua;./?.lua;./?/init.lua;$LUA_PATH"
      exec lua "#{libexec}/run.lua" "$@"
    SH
    (bin/"factestio").chmod 0755
  end

  test do
    system "#{bin}/factestio", "--help"
  end

  def caveats
    <<~EOS
      factestio requires Lua 5.2 and LuaRocks dependencies.
      If you haven't already, install them:

        luaver install 5.2.4 && luaver use 5.2.4
        luarocks install --deps-only #{opt_libexec}/factestio-0.1-0.rockspec

      See https://github.com/DhavalKapil/luaver for luaver installation.
    EOS
  end
end
