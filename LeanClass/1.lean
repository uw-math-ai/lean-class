--Math 480, Spring 2025, Jarod Alper
--Homework 1: Fill in the sorries below
import Mathlib.Tactic
--Helpful tactics: rfl, rintro, use, rw, intro, exact, apply, triv, exfalso, left, right, cases'

-- 1
example : 3 + 2 = 5 :=
  rfl

-- 2
--Useful lemmas
#check mul_comm --a * b = b * a
#check mul_assoc --a * b * c = a * (b * c)
example (a b c : ℝ) : a * b * c = (a * b) * c := by
  rfl

-- 3
example (a b c : ℝ) : a * (b * c) = b * (a * c) := by
  rw [←mul_assoc]
  rw [mul_comm a b]
  rw [mul_assoc]

-- 4
example (a b c d e f : ℝ) (h : b * c = e * f) : a * b * c * d = a * e * f * d := by
  rw [mul_assoc a b c]
  rw [h]
  rw [mul_assoc a e f]

#check add_assoc
-- 5
--Please do this exercise without using the ring tactic.
example (a b : ℝ) : a^3 - b^3 = (a-b)*(a^2+a*b+b^2) := by
  rw [pow_three, pow_three]
  rw [mul_add, mul_add]
  repeat rw [sub_mul]
  rw [← mul_assoc a a b, ← mul_assoc b a b]
  rw [mul_comm b a]
  repeat rw [pow_two]
  repeat rw [mul_comm b (a*a)]
  repeat rw [sub_eq_add_neg (a*a*b) (a*b*b)]
  rw [sub_eq_add_neg (a*(a*a)) (a*a*b)]
  repeat rw [← mul_assoc]
  simp [add_assoc]
  repeat rw [sub_eq_add_neg]
  repeat simp [← add_assoc]

-- 6: Product of two odd numbers is odd.
example : ∀ m n : Nat, Odd m ∧ Odd n → Odd (m * n) := by
  intro m n c
  cases c with
  | intro left right =>
    unfold Odd
    unfold Odd at left
    unfold Odd at right
    obtain ⟨tl, hm⟩ := left
    obtain ⟨kp, hn⟩ := right
    rw [hm, hn]
    -- rw [mul_add, add_mul, right_distrib]
    -- ring_nf
    use tl+tl*kp*2+kp
    ring

-- 7
-- Useful lemma
#check le_trans -- a ≤ b → b ≤ c → a ≤ c
--Please do not use the linarith tactic
example (x y z w: ℝ) (h1 : x ≤ y) (h2 : y ≤ z) (h3: z ≤ w) : x ≤ w := by
  apply le_trans h1 (le_trans h2 h3)

-- 8
variable (P Q R : Prop)
example : (P → Q → R) → (P → Q) → P → R := by
  intro hPQR
  intro hPQ
  intro hP
  exact (hPQR hP) (hPQ hP)

-- 9
example : False → P := by
  intro hp
  exfalso
  exact hp

-- 10
example : P → ¬¬P := by
  intro hP hnP
  exact hnP hP


-- 11
example : P ∧ Q → Q := by
  intro h
  cases' h with hP hQ
  exact hQ

-- 12
example : (P → Q → R) → P ∧ Q → R := by
  intro hPQR hPQ
  cases' hPQ with hP hQ
  exact (hPQR hP hQ)

-- 13
example : ¬(P ∧ Q) ↔ ¬P ∨ ¬Q := by
  -- constructor
  -- intro h
  tauto

-- 14
example : ∀ x : ℝ, ∃ y, x + y = 2 := by
  intro x
  use -x+2
  simp
  -- rw [← add_assoc]
  -- rw [add_comm x]
  -- rw[neg_add_cancel]
  -- rw[zero_add]

-- 15
example : ∃ x : ℝ, 3 * x + 7 ≠ 12 := by
  use 0
  simp
