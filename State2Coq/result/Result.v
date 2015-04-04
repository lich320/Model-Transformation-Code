Definition g0 : guard := BGt(AId  balance)(ANum  0)
Definition g1 : guard := BEq(AId  checkPwd)(ANum  1)
Definition g2 : guard := BNot(BEq(AId  checkPwd)(ANum  1))

Definition t4: trans := ("t4", 1, nil, "withdraw", g0, nil, nil, 0, shallow).
Definition t1: trans := ("t1", 0, nil, "insertCard", BTrue, nil, nil, 1, none).
Definition t2: trans := ("t2", 0, ("Identify" :: "InputPwd" :: nil), "pwd", g1, "eloginsucc" :: nil, nil, 1, none).
Definition t3: trans := ("t3", 1, nil, "pwd", g2, "loginFail" :: nil, nil, 1, none).
Definition t5: trans := ("t5", 0, nil, "insertCard", BTrue, nil, nil, 1, none).

Definition n0 : sc := basic_sc "CardIn" (nil, nil).
Definition n1 : sc := basic_sc "InputPwd" (nil, nil).
Definition n2 : sc := or_sc "Identify" (n0 :: n1 :: nil) 0 (t1 :: t3 :: nil) (nil, "exlogin" :: nil).
Definition n3 : sc := basic_sc "Accept" ("command" :: nil, nil).
Definition n4 : sc := or_sc "Execute" (n2 :: n3 :: nil) 0 (t4 :: t2 :: nil) (nil, nil).
Definition n5 : sc := basic_sc "Wait" (nil, nil).
Definition n6 : sc := basic_sc "Write" (nil, nil).
Definition n7 : sc := or_sc "Log" (n5 :: n6 :: nil) 0 (t5 :: nil) (nil, nil).
Definition n8 : sc := and_sc "ATMServer" (n4 :: n7 :: nil) (nil, nil).
