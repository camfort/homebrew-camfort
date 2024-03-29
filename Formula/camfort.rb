class Camfort < Formula
  VERSION = "1.2.0".freeze

  desc "Refactoring and verification tool for Fortran"
  homepage "https://camfort.github.io"
  url "https://hackage.haskell.org/package/camfort-#{VERSION}/camfort-#{VERSION}.tar.gz"
  sha256 "c8d61182cd02b9d4601f40408f7d8f4eb0895e16a37ee85e624075fa89d25ac4"
  license "Apache-2.0"
  head "https://github.com/camfort/camfort.git", branch: "master"

  bottle do
    root_url "https://github.com/camfort/homebrew-camfort/releases/download/camfort-1.2.0"
    sha256 cellar: :any, big_sur: "eed552a91f9429531a2a3b59ba3c81755f85b989fd8963863c7e4748f66b9737"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  depends_on "flint" => :linked
  depends_on "lapack" => :linked
  depends_on "openblas" => :linked
  depends_on "z3" => :linked

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end

  test do
    # Test to see if units-suggest runs without errors
    crit_units_test = testpath / "crit_units_test.f90"
    crit_units_test.write <<-EOF
      program crit_units_test
        integer x, y, z
        x = y * z
      end program crit_units_test
    EOF

    system bin / "camfort", "units-suggest", crit_units_test
  end
end
