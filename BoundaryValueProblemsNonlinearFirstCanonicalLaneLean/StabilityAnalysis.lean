import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure StabilityPackage (A : AdmissibleClass) where
  stabilityCondition : Prop
  stabilityEstimate : Prop
  perturbationBound : Prop

structure StabilityEvidence (A : AdmissibleClass) (P : StabilityPackage A) where
  stabilityConditionClosed : P.stabilityCondition
  stabilityEstimateClosed : P.stabilityEstimate
  perturbationBoundClosed : P.perturbationBound

def StabilityClosed (A : AdmissibleClass) (P : StabilityPackage A) : Prop :=
  P.stabilityCondition ∧ P.stabilityEstimate ∧ P.perturbationBound

theorem stability_closed_from_evidence (A : AdmissibleClass) (P : StabilityPackage A)
    (E : StabilityEvidence A P) : StabilityClosed A P := by
  exact And.intro E.stabilityConditionClosed
    (And.intro E.stabilityEstimateClosed E.perturbationBoundClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse