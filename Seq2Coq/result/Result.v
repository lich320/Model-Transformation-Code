Definition c1: cnd := BEq(AId  AccountType)(ANum  100).
Definition c2: cnd := BGt(AId  Balance)(ANum  0).

Definition sid : event := (!,"id","Client","Server").
Definition rid : event := (?,"id","Client","Server").
Definition spwd : event := (!,"pwd","Client","Server").
Definition rpwd : event := (?,"pwd","Client","Server").
Definition sloginSucc : event := (!,"loginSucc","Client","Server").
Definition rloginSucc : event := (?,"loginSucc","Client","Server").
Definition scmd : event := (!,"cmd","Client","Server").
Definition rcmd : event := (?,"cmd","Client","Server").
Definition sloginFail : event := (!,"loginFail","Server","Client").
Definition rloginFail : event := (?,"loginFail","Server","Client").

Definition ExampleSeq: SeqDiag := Dstrict (Dstrict (Dstrict (De sid)(De rid))(Dstrict (De spwd)(De rpwd)))(Dalt C1 (Dstrict(Dstrict (De sloginSucc)(De rloginSucc))(Dopt C2 (Dstrict (De scmd)(De rcmd))))(Dstrict (De sloginFail)(De rloginFail))).