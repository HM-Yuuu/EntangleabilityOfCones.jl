using EntangleabilityOfCones
using Test
using Symbolics

@testset "EntangleabilityOfCones.jl" begin
    # @variables α₁ α₂ α₃ α₄ β₁ β₂ β₃ β₄ 
    # α = [α₁, α₂, α₃, α₄]
    # β = [β₁, β₂, β₃, β₄]
    @variables α[1:4] β[1:4]

    @test (linear_form(α, β)-rhs(α,β))|>expand|>simplify  ≈ 0

end
