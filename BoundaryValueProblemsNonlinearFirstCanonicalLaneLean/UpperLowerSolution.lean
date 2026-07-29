import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure UpperLowerSolution where
  upperSolution : ℝ → ℝ
  lowerSolution : ℝ → ℝ
  ordered : upperSolution x ≥ lowerSolution x ∀ x
  differentialInequalities : Prop
  existenceGuaranteed : Prop

structure UpperLowerSolutionEvidence (U : UpperLowerSolution) where
  orderedClosed : ∀ x, U.upperSolution x ≥ U.lowerSolution x
  differentialInequalitiesClosed : U.differentialInequalities
  existenceGuaranteedClosed : U.existenceGuaranteed

def UpperLowerSolutionClosed (U : UpperLowerSolution) : Prop :=
  (∀ x, U.upperSolution x ≥ U.lowerSolution x) ∧ U.differentialInequalities ∧ U.existenceGuaranteed

theorem upper_lower_solution_closed_from_evidence (U : UpperLowerSolution) (E : UpperLowerSolutionEvidence U) : UpperLowerSolutionClosed U := by
  exact And.intro E.orderedClosed (And.intro E.differentialInequalitiesClosed E.existenceGuaranteedClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse