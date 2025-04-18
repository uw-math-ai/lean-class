import Canonical

-- prove properties by induction
def add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) :=
  by canonical

-- enumerate over elements of a type
example : List Nat := by canonical (count := 10)

-- supply premises
def Set (X : Type) := X → Prop
axiom P_ne_not_P : P ≠ ¬ P
theorem Cantor (f : X → Set X) : ¬ ∀ y, ∃ x, f x = y :=
  by canonical [P_ne_not_P, congrFun]
