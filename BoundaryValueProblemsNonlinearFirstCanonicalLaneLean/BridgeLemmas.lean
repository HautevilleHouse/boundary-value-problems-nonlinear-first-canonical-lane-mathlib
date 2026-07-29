import BoundaryValueProblemsNonlinearFirstCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BVPWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse