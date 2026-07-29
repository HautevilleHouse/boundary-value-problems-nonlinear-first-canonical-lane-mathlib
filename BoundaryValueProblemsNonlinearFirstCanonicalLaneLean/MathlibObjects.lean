import BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BVPSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BVPAdmittedObject where
  space : BVPSpace
  boundaryCondition : Prop
  nonlinearOperator : Prop
  solutionExists : Prop
  conclusion : solutionExists

structure BVPEndgameState where
  object : BVPAdmittedObject

def BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.solutionExists

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse