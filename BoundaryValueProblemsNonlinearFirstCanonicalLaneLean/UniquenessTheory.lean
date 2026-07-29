import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure UniquenessPackage (A : AdmissibleClass) where
  uniquenessCondition : Prop
  uniquenessProof : ∀ (u v : A.object.functionSpace),
    (A.object.equation u ∧ A.object.boundaryCondition u) →
    (A.object.equation v ∧ A.object.boundaryCondition v) → u = v

structure UniquenessEvidence (A : AdmissibleClass) (P : UniquenessPackage A) where
  uniquenessConditionClosed : P.uniquenessCondition
  uniquenessProofClosed : ∀ (u v : A.object.functionSpace),
    (A.object.equation u ∧ A.object.boundaryCondition u) →
    (A.object.equation v ∧ A.object.boundaryCondition v) → u = v

def UniquenessClosed (A : AdmissibleClass) (P : UniquenessPackage A) : Prop :=
  P.uniquenessCondition ∧
  ∀ (u v : A.object.functionSpace),
    (A.object.equation u ∧ A.object.boundaryCondition u) →
    (A.object.equation v ∧ A.object.boundaryCondition v) → u = v

theorem uniqueness_closed_from_evidence (A : AdmissibleClass) (P : UniquenessPackage A)
    (E : UniquenessEvidence A P) : UniquenessClosed A P := by
  exact And.intro E.uniquenessConditionClosed E.uniquenessProofClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse