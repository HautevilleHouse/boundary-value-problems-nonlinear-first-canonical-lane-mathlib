import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

inductive BoundaryConditionType where
  | dirichlet
  | neumann
  | robin
  | cauchy
  | periodic

def boundaryConditionTypeToString (t : BoundaryConditionType) : String :=
  match t with
  | BoundaryConditionType.dirichlet => "Dirichlet"
  | BoundaryConditionType.neumann => "Neumann"
  | BoundaryConditionType.robin => "Robin"
  | BoundaryConditionType.cauchy => "Cauchy"
  | BoundaryConditionType.periodic => "Periodic"

structure BoundaryConditionSpecification (A : AdmissibleClass) where
  conditionType : BoundaryConditionType
  wellPosed : Prop
  wellPosedProof : wellPosed

structure BoundaryConditionEvidence (A : AdmissibleClass) (S : BoundaryConditionSpecification A) where
  conditionTypeClosed : S.conditionType = S.conditionType
  wellPosedClosed : S.wellPosed

def BoundaryConditionClosed (A : AdmissibleClass) (S : BoundaryConditionSpecification A) : Prop :=
  S.wellPosed

theorem boundary_condition_closed_from_evidence (A : AdmissibleClass)
    (S : BoundaryConditionSpecification A) (E : BoundaryConditionEvidence A S) :
    BoundaryConditionClosed A S := by
  exact E.wellPosedClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse