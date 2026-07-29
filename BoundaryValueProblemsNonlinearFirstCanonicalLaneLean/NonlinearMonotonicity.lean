import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure MonotonicityPackage where
  operator : Type u
  order : Type v
  monotonicityProperty : Prop
  comparisonProperty : Prop
  monotonicityProof : monotonicityProperty
  comparisonProof : comparisonProperty

structure MonotonicityEvidence (M : MonotonicityPackage) where
  monotonicityClosed : M.monotonicityProperty
  comparisonClosed : M.comparisonProperty

def MonotonicityClosed (M : MonotonicityPackage) : Prop :=
  M.monotonicityProperty ∧ M.comparisonProperty

theorem monotonicity_closed_from_evidence (M : MonotonicityPackage) (E : MonotonicityEvidence M) :
    MonotonicityClosed M := by
  exact And.intro E.monotonicityClosed E.comparisonClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse