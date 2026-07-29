import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.NonlinearFirstOrderODE

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ShootingMethod (O : NonlinearFirstOrderODE) where
  initialGuess : ℝ → ℝ
  initialGuessSmooth : Prop
  parameterContinuation : Prop
  convergesToSolution : Prop
  boundaryConditionMatched : Prop

structure ShootingMethodEvidence (O : NonlinearFirstOrderODE) (S : ShootingMethod O) where
  initialGuessSmoothClosed : S.initialGuessSmooth
  parameterContinuationClosed : S.parameterContinuation
  convergesToSolutionClosed : S.convergesToSolution
  boundaryConditionMatchedClosed : S.boundaryConditionMatched

def ShootingMethodClosed (O : NonlinearFirstOrderODE) (S : ShootingMethod O) : Prop :=
  S.initialGuessSmooth ∧ S.parameterContinuation ∧ S.convergesToSolution ∧ S.boundaryConditionMatched

theorem shooting_method_closed_from_evidence (O : NonlinearFirstOrderODE) (S : ShootingMethod O) (E : ShootingMethodEvidence O S) : ShootingMethodClosed O S := by
  exact And.intro E.initialGuessSmoothClosed (And.intro E.parameterContinuationClosed (And.intro E.convergesToSolutionClosed E.boundaryConditionMatchedClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse