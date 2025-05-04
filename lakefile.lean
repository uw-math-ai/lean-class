import Lake
open Lake DSL

package «lean-class» where
  -- Settings applied to both builds and interactive editing
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩ -- pretty-prints `fun a ↦ b`
  ]
  -- add any additional package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.19.0"

@[default_target]
lean_lib «LeanClass» where
  -- add any library configuration options here

require Canonical from git
  "https://github.com/chasenorman/CanonicalLean.git"
