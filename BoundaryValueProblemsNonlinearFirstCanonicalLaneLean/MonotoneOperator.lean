import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure MonotoneOperator where
  domain : Set (ℝ → ℝ)
  operator : (ℝ → ℝ) → (ℝ → ℝ)
  monotoneProperty : Prop → Prop
  coercivity : Prop
  hemicontinuity : Prop

structure MonotoneOperatorEvidence (M : MonotoneOperator) where
  monotonePropertyClosed : M.monotoneProperty True
  coercivityClosed : M.coercivity
  hemicontinuityClosed : M.hemicontinuity

def MonotoneOperatorClosed (M : MonotoneOperator) : Prop :=
  M.monotoneProperty True ∧ M.coercivity ∧ M.hemicontinuity

theorem monotone_operator_closed_from_evidence (M : MonotoneOperator) (E : MonotoneOperatorEvidence M) : MonotoneOperatorClosed M := by
  exact And.intro E.monotonePropertyClosed (And.intro E.coercivityClosed E.hemicontinuityClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse