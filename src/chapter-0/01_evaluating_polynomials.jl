"
    Polynomial{T<:Number} <: Function

A Polynomial struct implements the mathematical object P(x) = ∑ cᵢ xⁱ by
storing the coefficients cᵢ (i ∈ {0,..., deg(P)}) into a 1-dimensional array of
numbers. The **degree** of a polynomial is the highest power of the xᵢ terms.
"
struct Polynomial{T<:Number} <: Function
    coeffs::Array{T,1}
    degree::Int

    function Polynomial{T}(c::Array{T,1}) where {T<:Number}
        n = length(c) - 1
        new(c, n)
    end

end

Polynomial(c::Array{T,1}) where {T<:Number} = Polynomial{T}(c)

deg(poly::Polynomial{T}) where {T<:Number} = poly.degree

function (poly::Polynomial{T})(x::Number, bases=zeros(T, deg(poly), 1)) where {T<:Number}
    #= Method 1: The first and most straightforward approach:
    result = 0
    for (power, c) in enumerate(poly.coeffs)
        result += c * x^(power - 1)
    end
    =#

    #= Method 2: Find the powers and store them for future uses:
    result = 0
    power = 1
    for c in poly.coeffs
        result += c * power
        power *= x
    end
    =#

    #= Method 3 (Horner): Nest multiplication =#
    result = poly.coeffs[end]
    for i = deg(poly):-1:1
        result *= x - bases[i]
        result += poly.coeffs[i]
    end

    result
end

