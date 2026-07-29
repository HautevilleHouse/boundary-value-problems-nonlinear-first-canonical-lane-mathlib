import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure NonlinearFirstOrderBVPPackage where
  domain : Type u
  codomain : Type v
  boundaryCondition : Type w
  nonlinearOperator : domain → codomain
  firstOrderPDE : Prop
  boundaryConditionWellDefined : Prop
  existenceResult : Prop
  uniquenessResult : Prop

def BoundaryOperatorAdmissible (P : NonlinearFirstOrderBVPPackage) : Prop :=
  P.firstOrderPDE ∧ P.boundaryConditionWellDefined

def SolutionExistenceUnique (P : NonlinearFirstOrderBVPPackage) : Prop :=
  P.existenceResult ∧ P.uniquenessResult

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse