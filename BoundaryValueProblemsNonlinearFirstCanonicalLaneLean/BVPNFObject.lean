import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure BVPNFBVP where
  domainStart : ℝ
  domainEnd : ℝ
  rightHandSide : ℝ → ℝ → ℝ  -- f(t, y)
  boundaryCondition : ℝ → Prop

default

structure BVPNFSolution (bvp : BVPNFBVP) where
  y : ℝ → ℝ
  differentiable : Prop
  odesatisfied : ∀ t ∈ Set.Ioo bvp.domainStart bvp.domainEnd, deriv (y) t = bvp.rightHandSide t (y t)
  boundarySatisfied : bvp.boundaryCondition (y bvp.domainStart)

default

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse