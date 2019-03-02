using Makie
using GeometryTypes
using StaticArrays
using AbstractPlotting: textslider

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

slider1, val1 = textslider(0f0:0.1f0:10f0, "Speed", start=1.0)
slider2, val2 = textslider(0.1f0:0.1f0:10f0, "Scale", start=1.0)

scene = vbox(hbox(slider1, slider2), s)
redisplay(scene)

while true
	rotate!(cube, qrotation(SVector(1,1,1), theta))
	scale!(cube, (val2[], val2[], val2[]))
	global theta += dtheta * val1[]
	sleep(0.01)
end