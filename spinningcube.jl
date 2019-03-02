using Makie
using GeometryTypes
using StaticArrays
include("util.jl")

s = init()
triad!(s, 1)
s2 = Scene(s)
translate!(s2, (2, 0, 0))
triad!(s2, 1)
cube = mesh!(s2, HyperRectangle(Vec3f0(0), Vec3f0(2)), color=:blue, show_axis=false)[end]
redisplay(s)

theta = 0
dtheta = 0.01
while true
	rotate!(cube, qrotation(SVector(1,1,1), theta))
	global theta += dtheta
	sleep(0.01)
end