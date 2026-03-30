# typed: false
# frozen_string_literal: true

class Factestio < Formula
  desc "Hierarchical scenario-based test framework for Factorio mods"
  homepage "https://github.com/cmtonkinson/factestio"
  license "MIT"
  head "https://github.com/cmtonkinson/factestio.git", branch: "main"

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
end
