alphabet = "0123456789abcdefghijklmnopqrstuvwxyz" # Only supports thru base 36
intfloor(x) = convert(Int,floor(x))

"
    convertintrep(n::Int, base::Int)

Converts the input `n` into its string representation with respect to `base`.
"
function convertintrep(n::Int, base::Int)
    result = ""
    while n > 1
        result *= "$(alphabet[1 + (n % base)])"
        n = intfloor(n / base)    
    end

    result[end:-1:1]
end

"
    convertfracrep(n::Real, base::Int, precision)

Converts the input 0 ≦ `n` < 1 into its string representation with respect to
`base` for `precision` number of places.
"
function convertfracrep(n::Real, base::Int, precision)
    result = ""
    for _ in 1:precision
        n *= base
        result *= "$(alphabet[1 + intfloor(n)])"
        n -= intfloor(n)
    end

    result
end

"
    convertfloat(n::Real, base::Int, precision)

Converts a real number `n` into its string representation with respect to
`base` by a fixed `precision`. This is a concatenation of `convertintrep` and
`convertfracrep`.
"
function convertfloat(n::Real, base::Int, precision)
    intpart = intfloor(n)
    fracpart = n - floor(n)
    convertintrep(intpart, base) * "." * convertfracrep(fracpart, base, precision)
end

int2dec(n::Int) = convertintrep(n, 10)
int2bin(n::Int) = "0b" * convertintrep(n, 2)
int2hex(n::Int) = "0x" * convertintrep(n, 16)
