using Plots,LaTeXStrings
using LinearAlgebra,FundamentalsNumericalComputation

gr()
default(legend=nothing,linewidth=2)
plt = plot(showaxis=false,grid=false,xaxis=:none,yaxis=false,aspect_ratio=0.4)

f = x->1+exp(sin(2.6x))
y = f.(t)
plot!(f,0,2)

t = collect(0:1/3:2)
plot!(t,y,l=:black,m=(5,:black,:black))
plot!([t';t'],[y';0.9.+ 0*t'],l=(1,:dash,:black))

plot!(t[[3,4,4,3]],[0.9,0.9,y[4],y[3]],l=nothing,seriestype=:shape,color=RGBA(0,0,0,0.2))

annotate!(t[1],.75,text(L"t_0",:center))
annotate!(t[2],.75,text(L"t_1",:center))
annotate!(t[end],.75,text(L"t_n",:center))
annotate!(.43,3.6,text(L"f(\!x)",:right))

savefig("trapezoid.svg")