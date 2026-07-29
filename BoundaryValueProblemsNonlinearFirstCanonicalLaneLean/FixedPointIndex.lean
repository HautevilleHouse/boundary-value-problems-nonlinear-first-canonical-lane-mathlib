import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure FixedPointIndexPackage where
  topologicalSpace : Type u
  compactMap : Type v
  indexDefined : Prop
  additivity : Prop
  excision : Prop
  solutionCount : Prop

structure FixedPointIndexEvidence (F : FixedPointIndexPackage) where
  indexDefinedClosed : F.indexDefined
  additivityClosed : F.additivity
  excisionClosed : F.excision
  solutionCountClosed : F.solutionCount

def FixedPointIndexClosed (F : FixedPointIndexPackage) : Prop :=
  F.indexDefined ∧ F.additivity ∧ F.excision ∧ F.solutionCount

theorem fixed_point_index_closed_from_evidence (F : FixedPointIndexPackage) (E : FixedPointIndexEvidence F) :
    FixedPointIndexClosed F := by
  exact And.intro E.indexDefinedClosed (And.intro E.additivityClosed (And.intro E.excisionClosed E.solutionCountClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse