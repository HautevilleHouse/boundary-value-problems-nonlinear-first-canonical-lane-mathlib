import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure MonotoneOperatorPackage where
  banachSpace : Type u
  operatorDefinition : Type v
  monotonicityCondition : Prop
  coercivityCondition : Prop
  existenceResult : Prop
  uniquenessResult : Prop

def MonotoneOperatorClosed (M : MonotoneOperatorPackage) : Prop :=
  M.monotonicityCondition ∧ M.coercivityCondition ∧ M.existenceResult ∧ M.uniquenessResult

structure MonotoneOperatorEvidence (M : MonotoneOperatorPackage) where
  monotonicityConditionClosed : M.monotonicityCondition
  coercivityConditionClosed : M.coercivityCondition
  existenceResultClosed : M.existenceResult
  uniquenessResultClosed : M.uniquenessResult

theorem monotone_operator_closed_from_evidence (M : MonotoneOperatorPackage) (E : MonotoneOperatorEvidence M) : MonotoneOperatorClosed M := by
  exact And.intro E.monotonicityConditionClosed (And.intro E.coercivityConditionClosed (And.intro E.existenceResultClosed E.uniquenessResultClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse