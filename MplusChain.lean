/-!
Lucas, v1. Pure computation linking the stored `M_plus` and `A` (data/kz_along_A.json,
omega-ed6-h1plus-measure @ b7c4a7a) to the stored 2:1 ratio. Numbers a + b√3 are integer pairs (a, b).
Proves: M_plus block P = [[-15,-2],[8,1]] (basis c0,c2) has eigenvalue -(2+√3)^2,
block Q = [[1,-3],[2,-5]] (basis c1,c3) has eigenvalue -(2+√3), and A has eigenvalue (2+√3)^3.
So the log-rates are 2, 1 and 3 times log(2+√3): ratio exactly 2:1, and 2/3, 1/3 of log ρ(A).
Does NOT prove: that these are the only eigenvalues, that M_plus is the real H1+ action of the
affine map with derivative A, or anything about the global Masur–Veech exponents.
-/
namespace LucasMplus

abbrev Z3 := Int × Int
def mul (p q : Z3) : Z3 := (p.1 * q.1 + 3 * p.2 * q.2, p.1 * q.2 + p.2 * q.1)
def add (p q : Z3) : Z3 := (p.1 + q.1, p.2 + q.2)
def sc (k : Int) (p : Z3) : Z3 := (k * p.1, k * p.2)
def mv (m : Int × Int × Int × Int) (v : Z3 × Z3) : Z3 × Z3 :=
  (add (sc m.1 v.1) (sc m.2.1 v.2), add (sc m.2.2.1 v.1) (sc m.2.2.2 v.2))
def smul (l : Z3) (v : Z3 × Z3) : Z3 × Z3 := (mul l v.1, mul l v.2)

def u : Z3 := (2, 1)                      -- 2 + √3
def u2 : Z3 := mul u u                    -- (2+√3)^2
def u3 : Z3 := mul u u2                   -- (2+√3)^3

theorem u2_val : u2 = (7, 4) := by decide
theorem u3_val : u3 = (26, 15) := by decide

def P := ((-15 : Int), (-2 : Int), (8 : Int), (1 : Int))
def Q := ((1 : Int), (-3 : Int), (2 : Int), (-5 : Int))
def A := ((31 : Int), (10 : Int), (65 : Int), (21 : Int))

theorem P_eig : mv P ((1, 0), (-4, 2)) = smul (sc (-1) u2) ((1, 0), (-4, 2)) := by decide
theorem Q_eig : mv Q ((3, 0), (3, 1)) = smul (sc (-1) u) ((3, 0), (3, 1)) := by decide
theorem A_eig : mv A ((10, 0), (-5, 15)) = smul u3 ((10, 0), (-5, 15)) := by decide

end LucasMplus
