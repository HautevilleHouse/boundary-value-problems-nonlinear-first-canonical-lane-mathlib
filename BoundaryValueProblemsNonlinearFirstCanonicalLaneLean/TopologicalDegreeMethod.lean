import HautevilleHouse.BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.ExistenceNonlinearFirstBVP

/-!
# Topological Degree Package for Nonlinear First-Order BVPs
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure TopologicalDegreePackage (A : AdmissibleClass) (E : ExistencePackage A) where
  degreeDefined : Prop
  compactnessProperty : Prop
  boundaryValueProperty : Prop
  homotopyInvariance : Prop
  solutionCount : Prop

structure TopologicalDegreeEvidence (A : AdmissibleClass) (E : ExistencePackage A)
    (D : TopologicalDegreePackage A E) where
  degreeDefinedClosed : D.degreeDefined
  compactnessPropertyClosed : D.compactnessProperty
  boundaryValuePropertyClosed : D.boundaryValueProperty
  homotopyInvarianceClosed : D.homotopyInvariance
  solutionCountClosed : D.solutionCount

def TopologicalDegreeClosed (A : AdmissibleClass) (E : ExistencePackage A)
    (D : TopologicalDegreePackage A E) : Prop :=
  D.degreeDefined ∧ D.compactnessProperty ∧ D.boundaryValueProperty ∧
  D.homotopyInvariance ∧ D.solutionCount

theorem topological_degree_closed_from_evidence (A : AdmissibleClass) (E : ExistencePackage A)
    (D : TopologicalDegreePackage A E) (Ev : TopologicalDegreeEvidence A E D) :
    TopologicalDegreeClosed A E D := by
  exact And.intro Ev.degreeDefinedClosed
    (And.intro Ev.compactnessPropertyClosed
      (And.intro Ev.boundaryValuePropertyClosed
        (And.intro Ev.homotopyInvarianceClosed Ev.solutionCountClosed)))

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse