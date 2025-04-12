--Math 480, Spring 2025, Vasily Ilin
import Mathlib.Tactic

-- 1
example : 3 + 2 = 5 := by
  rfl

example : 3 + 2 = 5 := by
  norm_num

-- 2
example (a b c : ℝ) : a * b * c = (a * b) * c := by
  rfl

-- 3
example (a b c : ℝ) : a * (b * c) = b * (a * c) := by
  rw [←mul_assoc, mul_comm a b, mul_assoc]

-- 4
example (a b c d e f : ℝ) (h : b * c = e * f) : a * b * c * d = a * e * f * d := by
  nth_rewrite 2 [mul_assoc] -- NOTE: think about why this is the second and not the first occurence
  rw [h, ← mul_assoc]

-- 5
example (a b : ℝ) : a^3 - b^3 = (a-b)*(a^2+a*b+b^2) := by
  nlinarith -- NOTE: elegant but kinda cheating!

-- NOTE: all the gory details!
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
  repeat unfold Odd
  rintro m n ⟨h1, h2⟩ -- NOTE: rintro is recursive intro, allowing to pattern-match on _? ∧ _?
  obtain ⟨k1, hk1⟩ := h1
  obtain ⟨k2, hk2⟩ := h2
  -- NOTE: instead of figuring out what k is, let's have Lean tell us what it must be!
  rw [hk1, hk2]
  ring -- NOTE: now it's clear
  use k1 + k1 * k2 * 2 + k2
  ring

-- 7
example (x y z w: ℝ) (h1 : x ≤ y) (h2 : y ≤ z) (h3: z ≤ w) : x ≤ w := by
  calc -- NOTE: calc block is perfectly suited for this kind of chain of inequalities
  x ≤ y := h1
  _ ≤ z := h2
  _ ≤ w := h3

-- 8
variable (P Q R : Prop)
example : (P → Q → R) → (P → Q) → P → R := by
  intros f g p
  apply f
  exact p
  apply g
  exact p

-- NOTE: let's practice term mode
example : (P → Q → R) → (P → Q) → P → R := fun f g p => f p (g p)

-- 9
example : False → P := by
  intro false
  exfalso -- NOTE: anything follows from False!
  exact false

-- 10
example : P → ¬¬P := fun p np => np p -- NOTE: term mode proofs really test your understanding of the definitions and types involved!


-- 11
example : P ∧ Q → Q := fun ⟨_, q⟩ => q -- NOTE: _ allows you to skip something you don't need

example : P ∧ Q → Q := by
  rintro ⟨p, q⟩
  exact q

-- 12
example : (P → Q → R) → P ∧ Q → R := fun pqr ⟨p, q⟩ => pqr p q

example : (P → Q → R) → P ∧ Q → R := by
  rintro pqr ⟨p, q⟩
  exact pqr p q

-- 13
example : ¬(P ∧ Q) ↔ ¬P ∨ ¬Q := by
  tauto -- NOTE: new cool tactic just dropped!

-- NOTE: try to do this in term mode for a challenge!
example : ¬(P ∧ Q) ↔ ¬P ∨ ¬Q := by
  constructor
  · intro h
    by_cases p : P
    · right
      intro q
      apply h
      exact ⟨p, q⟩
    · left
      exact p
  · intro h
    obtain h|h := h
    · intro h'
      apply h
      exact h'.left
    · intro h'
      apply h
      exact h'.right

-- 14
example : ∀ x : ℝ, ∃ y, x + y = 2 := by
  intro x
  use -x+2
  ring

-- 15
example : ∃ x : ℝ, 3 * x + 7 ≠ 12 := by
  use 0
  norm_num
