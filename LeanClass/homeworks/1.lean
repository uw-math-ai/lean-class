--Math 480, Spring 2025, Jarod Alper
--Homework 1: Fill in the sorries below
import Mathlib.Tactic
--Helpful tactics: rfl, rintro, use, rw, intro, exact, apply, triv, exfalso, left, right, cases'

-- 1
example : 3 + 2 = 5 :=
  sorry

-- 2
--Useful lemmas
#check mul_comm --a * b = b * a
#check mul_assoc --a * b * c = a * (b * c)
example (a b c : ℝ) : a * b * c = (a * b) * c := by
  sorry

-- 3
example (a b c : ℝ) : a * (b * c) = b * (a * c) := by
  sorry

-- 4
example (a b c d e f : ℝ) (h : b * c = e * f) : a * b * c * d = a * e * f * d := by
  sorry

#check add_assoc
-- 5
--Please do this exercise without using the ring tactic.
example (a b : ℝ) : a^3 - b^3 = (a-b)*(a^2+a*b+b^2) := by
  sorry

-- 6: Product of two odd numbers is odd.
example : ∀ m n : Nat, Odd m ∧ Odd n → Odd (m * n) := by
  sorry

-- 7
-- Useful lemma
#check le_trans -- a ≤ b → b ≤ c → a ≤ c
--Please do not use the linarith tactic
example (x y z w: ℝ) (h1 : x ≤ y) (h2 : y ≤ z) (h3: z ≤ w) : x ≤ w := by
  sorry

-- 8
variable (P Q R : Prop)
example : (P → Q → R) → (P → Q) → P → R := by
  sorry

-- 9
example : False → P := by
  sorry

-- 10
example : P → ¬¬P := by
  sorry


-- 11
example : P ∧ Q → Q := by
  sorry

-- 12
example : (P → Q → R) → P ∧ Q → R := by
  sorry

-- 13
example : ¬(P ∧ Q) ↔ ¬P ∨ ¬Q := by
  sorry

-- 14
example : ∀ x : ℝ, ∃ y, x + y = 2 := by
  sorry

-- 15
example : ∃ x : ℝ, 3 * x + 7 ≠ 12 := by
  sorry
