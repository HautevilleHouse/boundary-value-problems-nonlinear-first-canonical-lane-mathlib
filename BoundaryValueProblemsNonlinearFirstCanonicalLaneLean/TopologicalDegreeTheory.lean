import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure TopologicalDegreePackage where
  normedSpace : Type u
  compactVectorField : Type v
  degreeDefinition : Prop
  additivityProperty : Prop
  homotopyInvariant : Prop
  existenceOfSolution : Prop

def TopologicalDegreeClosed (T : TopologicalDegreePackage) : Prop :=
  T.degreeDefinition ∧ T.additivityProperty ∧ T.homotopyInvariant ∧ T.existenceOfSolution

structure TopologicalDegreeEvidence (T : TopologicalDegreePackage) where
  degreeDefinitionClosed : T.degreeDefinition
  additivityPropertyClosed : T.additivityProperty
  homotopyInvariantClosed : T.homotopyInvariant
  existenceOfSolutionClosed : T.existenceOfSolution

theorem topological_degree_closed_from_evidence (T : TopologicalDegreePackage) (E : TopologicalDegreeEvidence T) : TopologicalDegreeClosed T := by
  exact And.intro E.degreeDefinitionClosed (And.intro E.additivityPropertyClosed (And.intro E.homotopyInvariantClosed E.existenceOfSolutionClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse