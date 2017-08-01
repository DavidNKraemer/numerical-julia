# numerical-julia
Implementation of numerical algorithms from Tim Sauer's Numerical Analysis text in Julia

# Draft Implementations 

**NOTE**. Each implementation listed is complete insofar as it has been written
and passes a select few simple tests. Documentation and more extensive testing
is required. 

We may reorganize the `src` directory into something more useful later.

## Chapter 0: Fundamentals

* Evaluating polynomials (Horner's method) [source][ch0-01]
* Binary representation of numbers [source][ch0-02]
* TODO floating point representation of numbers

## Chapter 1: Solving Equations

* Bisection method [source][ch1-01]
* Fixed point iteration [source][ch1-02]
* Newton's method [source][ch1-04]
* Secant Method [source][ch1-05a]
* Method of False Position [source][ch1-05b]

[ch0-01]: src/chapter-0/01_evaluating_polynomials.jl
[ch0-02]: src/chapter-0/02_binary_numbers.jl

[ch1-01]: src/chapter-1/01_bisection_method.jl
[ch1-02]: src/chapter-1/02_fixed_point_iteration.jl
[ch1-04]: src/chapter-1/04_newtons_method.jl
[ch1-05a]: src/chapter-1/05_false_position.jl
[ch1-05b]: src/chapter-1/05_secant_method.jl


