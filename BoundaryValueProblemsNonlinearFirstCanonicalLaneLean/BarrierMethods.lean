import BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

/-!
# Barrier Methods Package for Nonlinear First-Order BVPs
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure BarrierMethodsPackage (A : AdmissibleClass) where
  barrierFunction : Prop
  interiorRegularity : Prop
  boundaryEstimate : Prop
  existenceViaBarrier : Prop

structure BarrierMethodsEvidence (A : AdmissibleClass) (P : BarrierMethodsPackage A) where
  barrierFunctionClosed : P.barrierFunction
  interiorRegularityClosed : P.interiorRegularity
  boundaryEstimateClosed : P.boundaryEstimate
  existenceViaBarrierClosed : P.existenceViaBarrier

def BarrierMethodsClosed (A : AdmissibleClass) (P : BarrierMethodsPackage A) : Prop :=
  P.barrierFunction ∧ P.interiorRegularity ∧ P.boundaryEstimate ∧ P.existenceViaBarrier

theorem barrier_methods_closed_from_evidence
    (A : AdmissibleClass) (P : BarrierMethodsPackage A) (E : BarrierMethodsEvidence A P) :
    BarrierMethodsClosed A P := by
  exact And.intro E.barrierFunctionClosed
    (And.intro E.interiorRegularityClosed
      (And.intro E.boundaryEstimateClosed E.existenceViaBarrierClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse