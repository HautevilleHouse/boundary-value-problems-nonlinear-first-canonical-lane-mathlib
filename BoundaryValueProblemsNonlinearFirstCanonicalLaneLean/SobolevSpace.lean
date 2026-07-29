import BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.MathlibObjects

/-!
# Sobolev Space Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  domainTopology : TopologicalSpace domain
  sobolevNorm : Type v
  embeddingTheorem : Prop
  traceTheorem : Prop
  compactEmbedding : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremClosed : S.embeddingTheorem
  traceTheoremClosed : S.traceTheorem
  compactEmbeddingClosed : S.compactEmbedding

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorem ∧ S.traceTheorem ∧ S.compactEmbedding

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage)
    (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.embeddingTheoremClosed
    (And.intro E.traceTheoremClosed E.compactEmbeddingClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse