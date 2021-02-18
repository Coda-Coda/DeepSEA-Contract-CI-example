Require Import DataTypeOps.
Require Import LayerCONTRACT.

Require Import DeepSpec.lib.Monad.StateMonadOption.
Require Import DeepSpec.lib.Monad.RunStateTInv.
Require Import lib.ArithInv.
Import DeepSpec.lib.Monad.Monad.MonadNotation.

Require Import ZArith.
Require Import cclib.Maps.
Require Import cclib.Integers.

Print Contract_test_opt.

Import core.MemoryModel. 
Section WithMem.
Context {memModelOps : MemoryModelOps mem}.

Theorem emptyThm : forall n d d' me b,
    runStateT (Contract_test_opt n me) d = Some (b, d')
    -> True.
Proof.
intros.
apply I.
Qed.
(* test comment *)
Theorem emptyIshThm : forall n d d' me b,
    runStateT (Contract_test_opt n me) d = Some (b, d')
    -> n = 5%Z -> b = true.
Proof.
intros.
rewrite H0 in H.
Transparent Contract_test_opt.
unfold Contract_test_opt in H.
simpl in H.
inversion H.
reflexivity.
Qed.

Open Scope Z.
Theorem correctnessThm : forall n d d' me b,
    runStateT (Contract_test_opt n me) d = Some (b, d')
    -> (b = true <-> n < 10).
Proof.
intros.
Transparent Contract_test_opt.
split.
 - intros.
   unfold Contract_test_opt in H.
   destruct (n <? 10) eqn:Case.
     + Locate "<?". Search Z.ltb Z.lt.
       pose proof Zlt_is_lt_bool n 10.
       apply H1. exact Case.
     + simpl in H.
       rewrite H0 in H.
       inversion H.
 - intros.
   unfold Contract_test_opt in H.
   pose proof Zlt_is_lt_bool n 10.
   apply H1 in H0.
   rewrite H0 in H.
   simpl in H.
   inversion H.
   reflexivity.
Qed.

End WithMem.
