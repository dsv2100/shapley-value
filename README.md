# shapley-value

Base version for Shapley value computation. It intends to be a start point for codes related to future research papers related to Shapley value

This current version contains:
- Proper data transofrmations to fit the game theory notation into R (shapley_value function)
- Computation of standard formula for Shapley value stated in 1951 (shapley_value_standard_formula)
- Computation of Shapley value using the same formula used that was used in S. J. Willson "A value for partially defined cooperative games" 1991. It will help to introduce PDG.
- Computation of Shapley value using the alternative version proposed in Beranardi & Freixas, "The Shapley value analyzed under the Felsenthal and Machover bargaining model", 2018

Note none of these formulas are the well known approximations of Shapley value, hence we strongly recommend to use them for small n.
