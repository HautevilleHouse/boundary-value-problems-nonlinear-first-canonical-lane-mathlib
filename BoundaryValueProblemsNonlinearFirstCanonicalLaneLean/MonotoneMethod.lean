import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.NonlinearBVPSetup

/-!
# Monotone Method Package for Nonlinear BVPs
This package encodes the monotone iterative method (upper and lower solutions) for first-order nonlinear BVPs.
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure MonotoneMethodPackage {P : NonlinearBVPPackage} where
  hasUpperSolution : Prop
  hasLowerSolution : Prop
  orderingCondition : Prop
  monotoneIterationConverges : Prop
  existenceViaMonotonicity : Prop

structure MonotoneMethodEvidence {P : NonlinearBVPPackage} (M : MonotoneMethodPackage P) where
  hasUpperSolutionClosed : M.hasUpperSolution
  hasLowerSolutionClosed : M.hasLowerSolution
  orderingConditionClosed : M.orderingCondition
  monotoneIterationConvergesClosed : M.monotoneIterationConverges
  existenceViaMonotonicityClosed : M.existenceViaMonotonicity

def MonotoneMethodClosed {P : NonlinearBVPPackage} (M : MonotoneMethodPackage P) : Prop :=
  M.hasUpperSolution ∧ M.hasLowerSolution ∧ M.orderingCondition ∧
  M.monotoneIterationConverges ∧ M.existenceViaMonotonicity

theorem monotone_method_closed_from_evidence {P : NonlinearBVPPackage} (M : MonotoneMethodPackage P)
    (E : MonotoneMethodEvidence M) : MonotoneMethodClosed M := by
  exact And.intro E.hasUpperSolutionClosed
    (And.intro E.hasLowerSolutionClosed
      (And.intro E.orderingConditionClosed
        (And.intro E.monotoneIterationConvergesClosed E.existenceViaMonotonicityClosed)))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse