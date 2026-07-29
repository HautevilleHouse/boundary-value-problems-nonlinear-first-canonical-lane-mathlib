import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsNonlinearFirstCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "boundary-value-problems-nonlinear-first",
    theoremName := "Boundary Value Problems Nonlinear First",
    theoremObject := "Existence and uniqueness of solutions to first-order nonlinear boundary value problems",
    classicalBoundary := "Unrestricted classical closure remains open",
    manifoldConstrainedStatement := "manifold-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
    certificateLane := "manifold_constrained",
    carriedRemainder := "classical source boundary carried by formalization"
  }

end BoundaryValueProblemsNonlinearFirstCanonicalLaneLean
end HautevilleHouse
