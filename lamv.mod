module lamv.

red (app (lam E) V) (E V).
red (let (ret V) E) (E V).
%red (let (let E1 E2) E3) (let E1 (x\ let (E2 x) E3)).

% congruence
redv (lam E1) (lam E2) :- pi x\ red (E1 x) (E2 x).

red (app V1 V2) (app V1' V2) :- redv V1 V1'.
red (app V1 V2) (app V1 V2') :- redv V2 V2'.
red (let E1 E2) (let E1' E2) :- red E1 E1'.
red (let E1 E2) (let E1 E2') :- pi x\ red (E2 x) (E2' x).
red (ret V) (ret V') :- redv V V'.

redm E E.
redm E E' :- red E E'.
redm E E'' :- redm E E', redm E' E''.
%redm E E' :- red E E'', redm E'' E'.

redvm V V.
redvm V V' :- redv V V'.
redvm V V'' :- redvm V V', redvm V' V''.
%redvm V V' :- redv V V'', redvm V'' V'.
