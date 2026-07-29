import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure PositivityPreservationPackage where
  solutionSpace : Type
  positiveInitialData : Prop
  positivityMaintained : Prop
  comparisonPrinciple : Prop
  positiveInitialDataTerm : positiveInitialData
  positivityMaintainedTerm : positivityMaintained
  comparisonPrincipleTerm : comparisonPrinciple

structure PositivityPreservationEvidence (P : PositivityPreservationPackage) where
  positiveInitialDataClosed : P.positiveInitialData
  positivityMaintainedClosed : P.positivityMaintained
  comparisonPrincipleClosed : P.comparisonPrinciple

def PositivityPreservationClosed (P : PositivityPreservationPackage) : Prop :=
  P.positiveInitialData ∧ P.positivityMaintained ∧ P.comparisonPrinciple

theorem positivity_preservation_closed_from_evidence (P : PositivityPreservationPackage)
    (E : PositivityPreservationEvidence P) : PositivityPreservationClosed P := by
  exact And.intro E.positiveInitialDataClosed
    (And.intro E.positivityMaintainedClosed E.comparisonPrincipleClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
