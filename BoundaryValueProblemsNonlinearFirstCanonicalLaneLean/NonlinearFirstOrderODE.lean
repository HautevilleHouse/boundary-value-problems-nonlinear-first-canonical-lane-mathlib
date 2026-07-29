import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure NonlinearFirstOrderODE where
  timeInterval : Set ℝ
  stateSpace : Type u
  vectorField : stateSpace → ℝ → stateSpace
  lipschitzInState : Prop
  caratheodoryCondition : Prop

structure NonlinearFirstOrderODEEvidence (O : NonlinearFirstOrderODE) where
  timeIntervalClosed : O.timeInterval = Set.Icc 0 1
  lipschitzInStateClosed : O.lipschitzInState
  caratheodoryConditionClosed : O.caratheodoryCondition

def NonlinearFirstOrderODEClosed (O : NonlinearFirstOrderODE) : Prop :=
  O.lipschitzInState ∧ O.caratheodoryCondition

theorem nonlinear_first_order_ode_closed_from_evidence (O : NonlinearFirstOrderODE) (E : NonlinearFirstOrderODEEvidence O) : NonlinearFirstOrderODEClosed O := by
  exact And.intro E.lipschitzInStateClosed E.caratheodoryConditionClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse