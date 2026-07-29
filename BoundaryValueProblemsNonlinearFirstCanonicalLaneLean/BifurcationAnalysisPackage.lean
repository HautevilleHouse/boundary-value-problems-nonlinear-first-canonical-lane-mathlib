import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure BifurcationAnalysisPackage where
  parameterDomain : Type
  solutionBranch : Type
  bifurcationPointDetected : Prop
  branchSwitching : Prop
  stabilityAnalysis : Prop
  bifurcationPointDetectedTerm : bifurcationPointDetected
  branchSwitchingTerm : branchSwitching
  stabilityAnalysisTerm : stabilityAnalysis

structure BifurcationAnalysisEvidence (B : BifurcationAnalysisPackage) where
  bifurcationPointDetectedClosed : B.bifurcationPointDetected
  branchSwitchingClosed : B.branchSwitching
  stabilityAnalysisClosed : B.stabilityAnalysis

def BifurcationAnalysisClosed (B : BifurcationAnalysisPackage) : Prop :=
  B.bifurcationPointDetected ∧ B.branchSwitching ∧ B.stabilityAnalysis

theorem bifurcation_analysis_closed_from_evidence (B : BifurcationAnalysisPackage)
    (E : BifurcationAnalysisEvidence B) : BifurcationAnalysisClosed B := by
  exact And.intro E.bifurcationPointDetectedClosed
    (And.intro E.branchSwitchingClosed E.stabilityAnalysisClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
