import BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

/-!
# Comparison Principles Package for Nonlinear First-Order BVPs
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ComparisonPrinciplesPackage (A : AdmissibleClass) where
  monotoneOperator : Prop
  upperLowerSolutions : Prop
  comparisonInequality : Prop
  extremalSolutions : Prop

structure ComparisonPrinciplesEvidence (A : AdmissibleClass) (P : ComparisonPrinciplesPackage A) where
  monotoneOperatorClosed : P.monotoneOperator
  upperLowerSolutionsClosed : P.upperLowerSolutions
  comparisonInequalityClosed : P.comparisonInequality
  extremalSolutionsClosed : P.extremalSolutions

def ComparisonPrinciplesClosed (A : AdmissibleClass) (P : ComparisonPrinciplesPackage A) : Prop :=
  P.monotoneOperator ∧ P.upperLowerSolutions ∧ P.comparisonInequality ∧ P.extremalSolutions

theorem comparison_principles_closed_from_evidence
    (A : AdmissibleClass) (P : ComparisonPrinciplesPackage A) (E : ComparisonPrinciplesEvidence A P) :
    ComparisonPrinciplesClosed A P := by
  exact And.intro E.monotoneOperatorClosed
    (And.intro E.upperLowerSolutionsClosed
      (And.intro E.comparisonInequalityClosed E.extremalSolutionsClosed))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse