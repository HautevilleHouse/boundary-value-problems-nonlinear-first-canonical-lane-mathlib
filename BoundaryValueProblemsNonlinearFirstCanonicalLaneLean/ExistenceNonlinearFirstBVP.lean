import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

/-!
# Existence Package for Nonlinear First-Order BVPs
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ExistencePackage (A : AdmissibleClass) where
  operatorContinuity : A.object.operatorContinuous
  boundaryConditionSatisfied : Prop
  existenceResult : Prop
  uniquenessResult : Prop
  stabilityUnderPerturbation : Prop

structure ExistenceEvidence (A : AdmissibleClass) (E : ExistencePackage A) where
  operatorContinuityClosed : E.operatorContinuity
  boundaryConditionSatisfiedClosed : E.boundaryConditionSatisfied
  existenceResultClosed : E.existenceResult
  uniquenessResultClosed : E.uniquenessResult
  stabilityUnderPerturbationClosed : E.stabilityUnderPerturbation

def ExistenceClosed (A : AdmissibleClass) (E : ExistencePackage A) : Prop :=
  E.operatorContinuity ∧ E.boundaryConditionSatisfied ∧ E.existenceResult ∧
  E.uniquenessResult ∧ E.stabilityUnderPerturbation

theorem existence_closed_from_evidence (A : AdmissibleClass) (E : ExistencePackage A)
    (Ev : ExistenceEvidence A E) : ExistenceClosed A E := by
  exact And.intro Ev.operatorContinuityClosed
    (And.intro Ev.boundaryConditionSatisfiedClosed
      (And.intro Ev.existenceResultClosed
        (And.intro Ev.uniquenessResultClosed Ev.stabilityUnderPerturbationClosed)))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse