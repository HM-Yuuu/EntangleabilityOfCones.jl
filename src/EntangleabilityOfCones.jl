module EntangleabilityOfCones

using Symbolics

function ω(α::C, β::C) where {C<:AbstractVector, S<:AbstractVector}
    
    Q = x -> [[1,x[1],1], [x[2],1,1], [-1,x[3],1], [x[4],-1,1]]
    t, u = Q.([α, β])
    c1 = x -> 2 + x[2] + x[4] + x[3]*(x[2] - x[4])
    c2 = x -> 2 + x[1] + x[3] + x[4]*(x[1] - x[3])
    c3 = x -> 2 - x[4] - x[2] + x[1]*(x[4] - x[2])
    c4 = x -> 2 - x[3] - x[1] + x[2]*(x[3] - x[1])
    T = ([c1,c2,c3,c4].|>c->c(α)) .* t
    U = ([c1,c2,c3,c4].|>c->c(β)) .* u
    
    T[1]*U[2]' - T[2]*U[2]' + T[2]*U[1]' + T[3]*U[3]'
end

linear_form(m) = m[1,1] + m[1,2] + m[2,1] - m[2,2] - 2m[3,3]
linear_form(α, β) = linear_form(ω(α, β))

R = x -> (x[1]x[2] - 1)*(x[3] - x[4]) - (x[3]x[4] - 1)*(x[1] - x[2])
rhs(α, β) = -R(α)*R(β)

export linear_form, rhs

end
