import Mathlib.Tactic
import LeanCopilot
open Real

variable (a b c : ℕ)
variable (P Q R : Prop)

--Problem 1
example (a b : ℝ) (h : a ≤ b) : log (1 + exp a) ≤ log (1 + exp b) := by
  suggest_tactics

--Problem 2:
/-This following definition is "min" in mathlib, but we will
give our own definition-/
def my_min (a b : ℕ) : ℕ :=
  if a < b then a else b
example : my_min a b = my_min b a := by
  sorry


--Problem 3: this is min_assoc in mathlib
example : my_min (my_min a b) c = my_min a (my_min b c) := by
  sorry

--Problem 4: this is min_add_add_right in mathlib
example : my_min a b + c = my_min (a + c) (b + c) := by
  sorry

#check min_le_left
#check min_le_right

--Bonus problem: Show that our definition agree's with mathlib's.
example : my_min a b = min a b := by
  sorry

--Problem 5: do not use abs_neg
example (x : ℝ) : |-x| = |x| := by
  search_proof

--Problem 6: do not use abs_sub_abs_le_abs_sub
#check (abs_add : ∀ a b : ℝ, |a + b| ≤ |a| + |b|)
variable (a b : ℝ)
example : |a| - |b| ≤ |a - b| := by
  sorry


--Problem 7:
example : P ∨ Q → (P → R) → (Q → R) → R := by
  search_proof


--Problem 8: the limit of the 0 sequence is 0

--first we need to define the limit of a sequence a : ℕ → ℝ
def TendsTo (a : ℕ → ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n, n ≥ N → |a n - L| < ε
example : TendsTo (fun n ↦ 0) 0 := by
  sorry

--Problem 9: the limit of 1/n is 0
 example : TendsTo (fun n ↦ 1/n) 0 := by
  sorry

--Problem 10: limit of a sum is the sum of the limits
theorem tendsTo_add {a₁ a₂ : ℕ → ℝ} {L₁ L₂ : ℝ} (h₁ : TendsTo a₁ L₁) (h₂ : TendsTo a₂ L₂) :
    TendsTo (fun n ↦ a₁ n + a₂ n) (L₁ + L₂) := by
  sorry
