import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure UpperLowerSolutionPackage where
  operator : Type u
  lowerSolution : Prop
  upperSolution : Prop
  existenceBetween : Prop
  lowerSolutionProof : lowerSolution
  upperSolutionProof : upperSolution
  existenceBetweenProof : existenceBetween

structure UpperLowerSolutionEvidence (U : UpperLowerSolutionPackage) where
  lowerSolutionClosed : U.lowerSolution
  upperSolutionClosed : U.upperSolution
  existenceBetweenClosed : U.existenceBetween

def UpperLowerSolutionClosed (U : UpperLowerSolutionPackage) : Prop :=
  U.lowerSolution ∧ U.upperSolution ∧ U.existenceBetween

theorem upper_lower_solution_closed_from_evidence (U : UpperLowerSolutionPackage) (E : UpperLowerSolutionEvidence U) :
    UpperLowerSolutionClosed U := by
  exact And.intro E.lowerSolutionClosed (And.intro E.upperSolutionClosed E.existenceBetweenClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse