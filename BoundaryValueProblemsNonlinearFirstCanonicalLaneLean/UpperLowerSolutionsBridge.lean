import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure UpperLowerSolutionsPackage where
  lowerSolution : ℝ → ℝ
  upperSolution : ℝ → ℝ
  orderingCondition : Prop
  existenceEnsured : Prop
  orderingConditionTerm : orderingCondition
  existenceEnsuredTerm : existenceEnsured

structure UpperLowerSolutionsEvidence (U : UpperLowerSolutionsPackage) where
  orderingConditionClosed : U.orderingCondition
  existenceEnsuredClosed : U.existenceEnsured

def UpperLowerSolutionsClosed (U : UpperLowerSolutionsPackage) : Prop :=
  U.orderingCondition ∧ U.existenceEnsured

theorem upper_lower_solutions_closed_from_evidence (U : UpperLowerSolutionsPackage)
    (E : UpperLowerSolutionsEvidence U) : UpperLowerSolutionsClosed U := by
  exact And.intro E.orderingConditionClosed E.existenceEnsuredClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
