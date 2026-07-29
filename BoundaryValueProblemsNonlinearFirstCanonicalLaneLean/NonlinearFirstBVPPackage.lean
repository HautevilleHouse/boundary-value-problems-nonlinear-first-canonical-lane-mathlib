import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure NonlinearFirstBVPPackage where
  domain : Type u
  boundary : Type v
  nonlinearOperator : Type w
  boundaryCondition : Prop
  solutionSpace : Type x
  existenceResult : Prop
  uniquenessResult : Prop

structure NonlinearFirstBVPEvidence (P : NonlinearFirstBVPPackage) where
  boundaryConditionClosed : P.boundaryCondition
  existenceResultClosed : P.existenceResult
  uniquenessResultClosed : P.uniquenessResult

def NonlinearFirstBVPClosed (P : NonlinearFirstBVPPackage) : Prop :=
  P.boundaryCondition ∧ P.existenceResult ∧ P.uniquenessResult

theorem nonlinear_first_bvp_closed_from_evidence (P : NonlinearFirstBVPPackage) (E : NonlinearFirstBVPEvidence P) :
    NonlinearFirstBVPClosed P := by
  exact And.intro E.boundaryConditionClosed (And.intro E.existenceResultClosed E.uniquenessResultClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse