import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure TopologicalDegreePackage where
  mapping : Type u
  domain : Type v
  degreeDefined : Prop
  homotopyInvariance : Prop
  existenceFromDegree : Prop
  degreeDefinedProof : degreeDefined
  homotopyInvarianceProof : homotopyInvariance
  existenceFromDegreeProof : existenceFromDegree

structure TopologicalDegreeEvidence (T : TopologicalDegreePackage) where
  degreeDefinedClosed : T.degreeDefined
  homotopyInvarianceClosed : T.homotopyInvariance
  existenceFromDegreeClosed : T.existenceFromDegree

def TopologicalDegreeClosed (T : TopologicalDegreePackage) : Prop :=
  T.degreeDefined ∧ T.homotopyInvariance ∧ T.existenceFromDegree

theorem topological_degree_closed_from_evidence (T : TopologicalDegreePackage) (E : TopologicalDegreeEvidence T) :
    TopologicalDegreeClosed T := by
  exact And.intro E.degreeDefinedClosed (And.intro E.homotopyInvarianceClosed E.existenceFromDegreeClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse