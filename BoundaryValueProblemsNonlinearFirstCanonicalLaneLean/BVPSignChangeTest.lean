import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure SignChangeTestPackage where
  intervalEndpoints : ℝ × ℝ
  testFunction : ℝ → ℝ
  signChangeDetected : Prop
  rootExistence : Prop
  signChangeDetectedTerm : signChangeDetected
  rootExistenceTerm : rootExistence

structure SignChangeTestEvidence (S : SignChangeTestPackage) where
  signChangeDetectedClosed : S.signChangeDetected
  rootExistenceClosed : S.rootExistence

def SignChangeTestClosed (S : SignChangeTestPackage) : Prop :=
  S.signChangeDetected ∧ S.rootExistence

theorem sign_change_test_closed_from_evidence (S : SignChangeTestPackage)
    (E : SignChangeTestEvidence S) : SignChangeTestClosed S := by
  exact And.intro E.signChangeDetectedClosed E.rootExistenceClosed

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
