import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure ShootingMethodCertificate where
  ivpSolver : Type
  targetCondition : Prop
  convergenceGuaranteed : Prop
  rootFindingCertified : Prop
  targetConditionTerm : targetCondition
  convergenceGuaranteedTerm : convergenceGuaranteed
  rootFindingCertifiedTerm : rootFindingCertified

structure ShootingMethodEvidence (S : ShootingMethodCertificate) where
  targetConditionClosed : S.targetCondition
  convergenceGuaranteedClosed : S.convergenceGuaranteed
  rootFindingCertifiedClosed : S.rootFindingCertified

def ShootingMethodClosed (S : ShootingMethodCertificate) : Prop :=
  S.targetCondition ∧ S.convergenceGuaranteed ∧ S.rootFindingCertified

theorem shooting_method_closed_from_evidence (S : ShootingMethodCertificate)
    (E : ShootingMethodEvidence S) : ShootingMethodClosed S := by
  exact And.intro E.targetConditionClosed
    (And.intro E.convergenceGuaranteedClosed E.rootFindingCertifiedClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
