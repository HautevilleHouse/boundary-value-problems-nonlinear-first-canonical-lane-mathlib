import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure LeraySchauderFixedPoint where
  banachSpace : Type u
  normedSpace : NormedAddCommGroup banachSpace
  compactOperator : banachSpace → banachSpace
  aPrioriBound : Prop
  degreeCondition : Prop
  fixedPointExists : Prop

structure LeraySchauderEvidence (L : LeraySchauderFixedPoint) where
  aPrioriBoundClosed : L.aPrioriBound
  degreeConditionClosed : L.degreeCondition
  fixedPointExistsClosed : L.fixedPointExists

def LeraySchauderClosed (L : LeraySchauderFixedPoint) : Prop :=
  L.aPrioriBound ∧ L.degreeCondition ∧ L.fixedPointExists

theorem leray_schauder_closed_from_evidence (L : LeraySchauderFixedPoint) (E : LeraySchauderEvidence L) : LeraySchauderClosed L := by
  exact And.intro E.aPrioriBoundClosed (And.intro E.degreeConditionClosed E.fixedPointExistsClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse