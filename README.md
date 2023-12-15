# [Abella](https://github.com/abella-prover/abella) proofs of the Z property

A rewrite system has the
[Z property](https://drops.dagstuhl.de/storage/00lipics/lipics-vol195-fscd2021/LIPIcs.FSCD.2021.24/LIPIcs.FSCD.2021.24.pdf)
if there is a function ' such that _a_ → _b_ implies _b_ ↠ _a_'  and  _a_' ↠ _b_'.

     a  ———>  b
           /
          /
         v
        v
     a' -->>  b'

Intuitively, it's a monotone function which contracts all redexes in the term (and possibly more).

This property is equivalent to [confluence](https://en.wikipedia.org/wiki/Confluence_(abstract_rewriting)):
_b_ ↞ _a_ ↠ _c_ implies there is some _d_ such that _b_ ↠ _d_ ↞ _c_.

(↠ is the reflexive-transitive closure of →)

## `lamv`

A call-by-value calculus with `let`.

    v ∷= x | λx. e
    e ∷= v | v v | let x = e in e

    (λx. e) v       →  e[x:=v]   (β.λ)
    let x = v in e  →  e[x:=v]   (β.let)

Here, reductions are defined in the specification logic (λProlog),
while the "superdevelopment" is defined in the reasoning logic.
For applications, the subexpressions are reduced first and then we reduce the possible (β.λ) redex,
while for `let`s we try to reduce the (β.let) first and then reduce subexpressions.
It's a choice, and the second one seems to have turned out a bit simpler (?).
