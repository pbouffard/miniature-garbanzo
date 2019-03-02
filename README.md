This is miniature-garbanzo, which is a good repository name according to GitHub.

# Building Makie into system image

From https://nextjournal.com/sdanisch/static-glmakie:

```
using Pkg
pkg"up; add PackageCompiler StatsMakie GLMakie AbstractPlotting Makie MakieGallery"

using PackageCompiler
PackageCompiler.compile_incremental(:Makie, :StatsMakie, :AbstractPlotting)
```

At the end it will report that a system image was generated in e.g. `/Users/patrick/.julia/packages/PackageCompiler/oT98U/sysimg/sys.dylib`. Then in `~/.bash_profile` add:

```
alias juliam="julia -i --sysimage /Users/patrick/.julia/packages/PackageCompiler/oT98U/sysimg/sys.dylib"
```
