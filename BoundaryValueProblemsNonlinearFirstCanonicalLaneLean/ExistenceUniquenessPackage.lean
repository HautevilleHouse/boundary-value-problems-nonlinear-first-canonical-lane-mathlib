import BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

/-!
# Existence and Uniqueness Package for Nonlinear First-Order BVPs
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ExistenceUniquenessPackage (A : AdmissibleClass) where
  classicalSolution : Prop
  lipschitzCondition : Prop
  contractionMapping : Prop
  solutionUnique : Prop

structure ExistenceUniquenessEvidence (A : AdmissibleClass) (P : ExistenceUniquenessPackage A) where
  classicalSolutionClosed : P.classicalSolution
  lipschitzConditionClosed : P.lipschitzCondition
  contractionMappingClosed : P.contractionMapping
  solutionUniqueClosed : P.solutionUnique

def ExistenceUniquenessClosed (A : AdmissibleClass) (P : ExistenceUniquenessPackage A) : Prop :=
  P.classicalSolution ∧ P.lipschitzCondition ∧ P.contractionMapping ∧ P.solutionUnique

theorem existence_uniqueness_closed_from_evidence
    (A : AdmissibleClass) (P : ExistenceUniquenessPackage A) (E : ExistenceUniquenessEvidence A P) :
    ExistenceUniquenessClosed A P := by
  exact And.intro E.classicalSolutionClosed
    (And.intro E.lipschitzConditionClosed
      (And.intro E.contractionMappingClosed E.solutionUniqueClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse