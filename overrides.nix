{}:
let 
  pkgs = import <nixpkgs> {};
  try-reflex = import deps/try-reflex {};
in try-reflex.ghcjs.override {
  overrides = self: super: {
    self.lens = pkgs.haskell.lib.dontCheck (self.lens);
    reflex-dom-contrib = pkgs.haskell.lib.dontCheck (self.callPackage deps/reflex-dom-contrib {});
    servant = self.callPackage (try-reflex.cabal2nixResult deps/servant/servant) {};
  };
}