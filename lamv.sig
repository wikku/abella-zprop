sig lamv.

kind val,expr type.

type lam    (val -> expr) -> val.

type ret    val -> expr.
type app    val -> val -> expr.
type let    expr -> (val -> expr) -> expr.

type redv   val -> val -> o.
type red    expr -> expr -> o.

type redm   expr -> expr -> o.
type redvm  val -> val -> o.
