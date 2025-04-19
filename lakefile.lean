import Lake
open Lake DSL

package «lean-class» where
  -- Settings applied to both builds and interactive editing
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩ -- pretty-prints `fun a ↦ b`
  ]
  -- add any additional package configuration options here
  moreLinkArgs := #[
    "-L./.lake/packages/LeanCopilot/.lake/build/lib",
    "-lctranslate2"
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.18.0"

@[default_target]
lean_lib «LeanClass» where
  -- add any library configuration options here

require Canonical from git
  "https://github.com/chasenorman/CanonicalLean.git"

require LeanCopilot from git "https://github.com/lean-dojo/LeanCopilot.git" @ "v4.18.0"
