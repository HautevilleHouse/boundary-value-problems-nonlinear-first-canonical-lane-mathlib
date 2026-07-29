import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ExistenceCriteriaPackage where
  lipschitzCondition : Prop
  boundednessCondition : Prop
  existenceTheoremApplied : Prop

structure ExistenceCriteriaEvidence (E : ExistenceCriteriaPackage) where
  lipschitzConditionClosed : E.lipschitzCondition
  boundednessConditionClosed : E.boundednessCondition
  existenceTheoremAppliedClosed : E.existenceTheoremApplied

def ExistenceCriteriaClosed (E : ExistenceCriteriaPackage) : Prop :=
  E.lipschitzCondition ∧ E.boundednessCondition ∧ E.existenceTheoremApplied

theorem existence_criteria_closed_from_evidence
    (E : ExistenceCriteriaPackage) (ev : ExistenceCriteriaEvidence E) :
    ExistenceCriteriaClosed E := by
  exact And.intro ev.lipschitzConditionClosed
    (And.intro ev.boundednessConditionClosed ev.existenceTheoremAppliedClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse