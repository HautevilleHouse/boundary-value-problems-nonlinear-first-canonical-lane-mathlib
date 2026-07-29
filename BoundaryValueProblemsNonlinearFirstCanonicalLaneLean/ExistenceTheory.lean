import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ExistencePackage (A : AdmissibleClass) where
  existenceCondition : Prop
  solutionConstructed : A.object.functionSpace
  solutionIsSolution : A.object.equation solutionConstructed
  solutionSatisfiesBC : A.object.boundaryCondition solutionConstructed

structure ExistenceEvidence (A : AdmissibleClass) (P : ExistencePackage A) where
  existenceConditionClosed : P.existenceCondition
  solutionConstructedClosed : P.solutionConstructed = A.object.solution
  solutionIsSolutionClosed : P.solutionIsSolution
  solutionSatisfiesBCClosed : P.solutionSatisfiesBC

def ExistenceClosed (A : AdmissibleClass) (P : ExistencePackage A) : Prop :=
  P.existenceCondition ∧ (P.solutionConstructed = A.object.solution) ∧
  P.solutionIsSolution ∧ P.solutionSatisfiesBC

theorem existence_closed_from_evidence (A : AdmissibleClass) (P : ExistencePackage A)
    (E : ExistenceEvidence A P) : ExistenceClosed A P := by
  exact And.intro E.existenceConditionClosed
    (And.intro E.solutionConstructedClosed
      (And.intro E.solutionIsSolutionClosed E.solutionSatisfiesBCClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse