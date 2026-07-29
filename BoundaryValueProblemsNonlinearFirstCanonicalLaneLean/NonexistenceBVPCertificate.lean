import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure NonexistenceBVPCertificate where
  bvpSystem : Type
  domainSatisfied : Prop
  noSolutionProof : Prop
  obstructionConstructed : Prop
  domainSatisfiedTerm : domainSatisfied
  noSolutionProofTerm : noSolutionProof
  obstructionConstructedTerm : obstructionConstructed

structure NonexistenceBVPEvidence (C : NonexistenceBVPCertificate) where
  domainSatisfiedClosed : C.domainSatisfied
  noSolutionProofClosed : C.noSolutionProof
  obstructionConstructedClosed : C.obstructionConstructed

def NonexistenceBVPClosed (C : NonexistenceBVPCertificate) : Prop :=
  C.domainSatisfied ∧ C.noSolutionProof ∧ C.obstructionConstructed

theorem nonexistence_bvp_closed_from_evidence (C : NonexistenceBVPCertificate)
    (E : NonexistenceBVPEvidence C) : NonexistenceBVPClosed C := by
  exact And.intro E.domainSatisfiedClosed
    (And.intro E.noSolutionProofClosed E.obstructionConstructedClosed)

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
