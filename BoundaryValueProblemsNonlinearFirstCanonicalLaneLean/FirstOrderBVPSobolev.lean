import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  sobolevSpace : Type v
  compactEmbedding : Prop
  traceOperator : Prop
  nonlinearOperatorContinuity : Prop
  existenceViaCompactness : Prop

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.compactEmbedding ∧ S.traceOperator ∧ S.nonlinearOperatorContinuity ∧ S.existenceViaCompactness

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  compactEmbeddingClosed : S.compactEmbedding
  traceOperatorClosed : S.traceOperator
  nonlinearOperatorContinuityClosed : S.nonlinearOperatorContinuity
  existenceViaCompactnessClosed : S.existenceViaCompactness

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage) (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.compactEmbeddingClosed (And.intro E.traceOperatorClosed (And.intro E.nonlinearOperatorContinuityClosed E.existenceViaCompactnessClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse