import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure FixedPointPackage where
  space : Type u
  mapping : Type v
  contractionProperty : Prop
  schauderProperty : Prop
  contractionProof : contractionProperty
  schauderProof : schauderProperty

structure FixedPointEvidence (F : FixedPointPackage) where
  contractionClosed : F.contractionProperty
  schauderClosed : F.schauderProperty

def FixedPointClosed (F : FixedPointPackage) : Prop :=
  F.contractionProperty ∧ F.schauderProperty

theorem fixed_point_closed_from_evidence (F : FixedPointPackage) (E : FixedPointEvidence F) :
    FixedPointClosed F := by
  exact And.intro E.contractionClosed E.schauderClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse