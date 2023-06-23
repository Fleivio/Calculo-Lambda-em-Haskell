{-# OPTIONS_GHC -w #-}
module Parser(parse) where
import Lexer.Token
import Lambda.Lambda
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,200) ([23776,34816,128,0,0,0,59136,24574,4,0,39936,11,17,0,0,0,16384,0,49152,185,33040,371,544,2,64,0,1024,0,1024,16,0,61040,19967,0,0,0,2048,30592,12287,2,0,52736,32773,39944,11,14353,23,34,0,0,0,49152,185,33040,371,544,743,1088,1486,2176,2972,4352,5944,8704,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57344,92,49288,185,272,0,0,0,128,4,0,2972,4352,0,0,0,0,0,16384,63936,6143,31617,12287,59138,16386,52740,32773,39944,11,17,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Expr","args","int","var","if","then","else","true","false","let","in","'!'","'&&'","'||'","'^'","'++'","'--'","'+'","'-'","'*'","'**'","'=='","'!='","'='","'('","')'","','","'.'","'/'","%eof"]
        bit_start = st * 33
        bit_end = (st + 1) * 33
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..32]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_4
action_0 (7) = happyShift action_2
action_0 (8) = happyShift action_5
action_0 (11) = happyShift action_6
action_0 (12) = happyShift action_7
action_0 (13) = happyShift action_8
action_0 (15) = happyShift action_9
action_0 (28) = happyShift action_10
action_0 (32) = happyShift action_11
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (7) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (6) = happyShift action_4
action_3 (7) = happyShift action_2
action_3 (8) = happyShift action_5
action_3 (11) = happyShift action_6
action_3 (12) = happyShift action_7
action_3 (13) = happyShift action_8
action_3 (15) = happyShift action_9
action_3 (16) = happyShift action_20
action_3 (17) = happyShift action_21
action_3 (18) = happyShift action_22
action_3 (19) = happyShift action_23
action_3 (20) = happyShift action_24
action_3 (21) = happyShift action_25
action_3 (22) = happyShift action_26
action_3 (23) = happyShift action_27
action_3 (24) = happyShift action_28
action_3 (25) = happyShift action_29
action_3 (26) = happyShift action_30
action_3 (28) = happyShift action_10
action_3 (32) = happyShift action_11
action_3 (33) = happyAccept
action_3 (4) = happyGoto action_19
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 (6) = happyShift action_4
action_5 (7) = happyShift action_2
action_5 (8) = happyShift action_5
action_5 (11) = happyShift action_6
action_5 (12) = happyShift action_7
action_5 (13) = happyShift action_8
action_5 (15) = happyShift action_9
action_5 (28) = happyShift action_10
action_5 (32) = happyShift action_11
action_5 (4) = happyGoto action_18
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_3

action_7 _ = happyReduce_4

action_8 (7) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (6) = happyShift action_4
action_9 (7) = happyShift action_2
action_9 (8) = happyShift action_5
action_9 (11) = happyShift action_6
action_9 (12) = happyShift action_7
action_9 (13) = happyShift action_8
action_9 (15) = happyShift action_9
action_9 (28) = happyShift action_10
action_9 (32) = happyShift action_11
action_9 (4) = happyGoto action_16
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (6) = happyShift action_4
action_10 (7) = happyShift action_2
action_10 (8) = happyShift action_5
action_10 (11) = happyShift action_6
action_10 (12) = happyShift action_7
action_10 (13) = happyShift action_8
action_10 (15) = happyShift action_9
action_10 (28) = happyShift action_10
action_10 (32) = happyShift action_11
action_10 (4) = happyGoto action_15
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (7) = happyShift action_13
action_11 (28) = happyShift action_14
action_11 (5) = happyGoto action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (31) = happyShift action_45
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (30) = happyShift action_44
action_13 _ = happyReduce_23

action_14 (7) = happyShift action_13
action_14 (5) = happyGoto action_43
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (6) = happyShift action_4
action_15 (7) = happyShift action_2
action_15 (8) = happyShift action_5
action_15 (11) = happyShift action_6
action_15 (12) = happyShift action_7
action_15 (13) = happyShift action_8
action_15 (15) = happyShift action_9
action_15 (16) = happyShift action_20
action_15 (17) = happyShift action_21
action_15 (18) = happyShift action_22
action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_24
action_15 (21) = happyShift action_25
action_15 (22) = happyShift action_26
action_15 (23) = happyShift action_27
action_15 (24) = happyShift action_28
action_15 (25) = happyShift action_29
action_15 (26) = happyShift action_30
action_15 (28) = happyShift action_10
action_15 (29) = happyShift action_42
action_15 (32) = happyShift action_11
action_15 (4) = happyGoto action_19
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (6) = happyShift action_4
action_16 (7) = happyShift action_2
action_16 (8) = happyShift action_5
action_16 (11) = happyShift action_6
action_16 (12) = happyShift action_7
action_16 (13) = happyShift action_8
action_16 (15) = happyShift action_9
action_16 (16) = happyShift action_20
action_16 (17) = happyShift action_21
action_16 (18) = happyShift action_22
action_16 (19) = happyShift action_23
action_16 (20) = happyShift action_24
action_16 (21) = happyShift action_25
action_16 (22) = happyShift action_26
action_16 (23) = happyShift action_27
action_16 (24) = happyShift action_28
action_16 (25) = happyShift action_29
action_16 (26) = happyShift action_30
action_16 (28) = happyShift action_10
action_16 (32) = happyShift action_11
action_16 (4) = happyGoto action_19
action_16 _ = happyReduce_19

action_17 (27) = happyShift action_41
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (6) = happyShift action_4
action_18 (7) = happyShift action_2
action_18 (8) = happyShift action_5
action_18 (9) = happyShift action_40
action_18 (11) = happyShift action_6
action_18 (12) = happyShift action_7
action_18 (13) = happyShift action_8
action_18 (15) = happyShift action_9
action_18 (16) = happyShift action_20
action_18 (17) = happyShift action_21
action_18 (18) = happyShift action_22
action_18 (19) = happyShift action_23
action_18 (20) = happyShift action_24
action_18 (21) = happyShift action_25
action_18 (22) = happyShift action_26
action_18 (23) = happyShift action_27
action_18 (24) = happyShift action_28
action_18 (25) = happyShift action_29
action_18 (26) = happyShift action_30
action_18 (28) = happyShift action_10
action_18 (32) = happyShift action_11
action_18 (4) = happyGoto action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (6) = happyShift action_4
action_19 (7) = happyShift action_2
action_19 (8) = happyShift action_5
action_19 (11) = happyShift action_6
action_19 (12) = happyShift action_7
action_19 (13) = happyShift action_8
action_19 (15) = happyShift action_9
action_19 (16) = happyShift action_20
action_19 (17) = happyShift action_21
action_19 (18) = happyShift action_22
action_19 (19) = happyShift action_23
action_19 (20) = happyShift action_24
action_19 (21) = happyShift action_25
action_19 (22) = happyShift action_26
action_19 (23) = happyShift action_27
action_19 (24) = happyShift action_28
action_19 (25) = happyShift action_29
action_19 (26) = happyShift action_30
action_19 (28) = happyShift action_10
action_19 (32) = happyShift action_11
action_19 (4) = happyGoto action_19
action_19 _ = happyReduce_17

action_20 (6) = happyShift action_4
action_20 (7) = happyShift action_2
action_20 (8) = happyShift action_5
action_20 (11) = happyShift action_6
action_20 (12) = happyShift action_7
action_20 (13) = happyShift action_8
action_20 (15) = happyShift action_9
action_20 (28) = happyShift action_10
action_20 (32) = happyShift action_11
action_20 (4) = happyGoto action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (6) = happyShift action_4
action_21 (7) = happyShift action_2
action_21 (8) = happyShift action_5
action_21 (11) = happyShift action_6
action_21 (12) = happyShift action_7
action_21 (13) = happyShift action_8
action_21 (15) = happyShift action_9
action_21 (28) = happyShift action_10
action_21 (32) = happyShift action_11
action_21 (4) = happyGoto action_38
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (6) = happyShift action_4
action_22 (7) = happyShift action_2
action_22 (8) = happyShift action_5
action_22 (11) = happyShift action_6
action_22 (12) = happyShift action_7
action_22 (13) = happyShift action_8
action_22 (15) = happyShift action_9
action_22 (28) = happyShift action_10
action_22 (32) = happyShift action_11
action_22 (4) = happyGoto action_37
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_5

action_24 _ = happyReduce_6

action_25 (6) = happyShift action_4
action_25 (7) = happyShift action_2
action_25 (8) = happyShift action_5
action_25 (11) = happyShift action_6
action_25 (12) = happyShift action_7
action_25 (13) = happyShift action_8
action_25 (15) = happyShift action_9
action_25 (28) = happyShift action_10
action_25 (32) = happyShift action_11
action_25 (4) = happyGoto action_36
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_4
action_26 (7) = happyShift action_2
action_26 (8) = happyShift action_5
action_26 (11) = happyShift action_6
action_26 (12) = happyShift action_7
action_26 (13) = happyShift action_8
action_26 (15) = happyShift action_9
action_26 (28) = happyShift action_10
action_26 (32) = happyShift action_11
action_26 (4) = happyGoto action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_4
action_27 (7) = happyShift action_2
action_27 (8) = happyShift action_5
action_27 (11) = happyShift action_6
action_27 (12) = happyShift action_7
action_27 (13) = happyShift action_8
action_27 (15) = happyShift action_9
action_27 (28) = happyShift action_10
action_27 (32) = happyShift action_11
action_27 (4) = happyGoto action_34
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (6) = happyShift action_4
action_28 (7) = happyShift action_2
action_28 (8) = happyShift action_5
action_28 (11) = happyShift action_6
action_28 (12) = happyShift action_7
action_28 (13) = happyShift action_8
action_28 (15) = happyShift action_9
action_28 (28) = happyShift action_10
action_28 (32) = happyShift action_11
action_28 (4) = happyGoto action_33
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_4
action_29 (7) = happyShift action_2
action_29 (8) = happyShift action_5
action_29 (11) = happyShift action_6
action_29 (12) = happyShift action_7
action_29 (13) = happyShift action_8
action_29 (15) = happyShift action_9
action_29 (28) = happyShift action_10
action_29 (32) = happyShift action_11
action_29 (4) = happyGoto action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_4
action_30 (7) = happyShift action_2
action_30 (8) = happyShift action_5
action_30 (11) = happyShift action_6
action_30 (12) = happyShift action_7
action_30 (13) = happyShift action_8
action_30 (15) = happyShift action_9
action_30 (28) = happyShift action_10
action_30 (32) = happyShift action_11
action_30 (4) = happyGoto action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_4
action_31 (7) = happyShift action_2
action_31 (8) = happyShift action_5
action_31 (11) = happyShift action_6
action_31 (12) = happyShift action_7
action_31 (13) = happyShift action_8
action_31 (15) = happyShift action_9
action_31 (16) = happyShift action_20
action_31 (17) = happyShift action_21
action_31 (18) = happyShift action_22
action_31 (19) = happyShift action_23
action_31 (20) = happyShift action_24
action_31 (21) = happyShift action_25
action_31 (22) = happyShift action_26
action_31 (23) = happyShift action_27
action_31 (24) = happyShift action_28
action_31 (25) = happyShift action_29
action_31 (26) = happyShift action_30
action_31 (28) = happyShift action_10
action_31 (32) = happyShift action_11
action_31 (4) = happyGoto action_19
action_31 _ = happyReduce_12

action_32 (6) = happyShift action_4
action_32 (7) = happyShift action_2
action_32 (8) = happyShift action_5
action_32 (11) = happyShift action_6
action_32 (12) = happyShift action_7
action_32 (13) = happyShift action_8
action_32 (15) = happyShift action_9
action_32 (16) = happyShift action_20
action_32 (17) = happyShift action_21
action_32 (18) = happyShift action_22
action_32 (19) = happyShift action_23
action_32 (20) = happyShift action_24
action_32 (21) = happyShift action_25
action_32 (22) = happyShift action_26
action_32 (23) = happyShift action_27
action_32 (24) = happyShift action_28
action_32 (25) = happyShift action_29
action_32 (26) = happyShift action_30
action_32 (28) = happyShift action_10
action_32 (32) = happyShift action_11
action_32 (4) = happyGoto action_19
action_32 _ = happyReduce_11

action_33 (6) = happyShift action_4
action_33 (7) = happyShift action_2
action_33 (8) = happyShift action_5
action_33 (11) = happyShift action_6
action_33 (12) = happyShift action_7
action_33 (13) = happyShift action_8
action_33 (15) = happyShift action_9
action_33 (16) = happyShift action_20
action_33 (17) = happyShift action_21
action_33 (18) = happyShift action_22
action_33 (19) = happyShift action_23
action_33 (20) = happyShift action_24
action_33 (21) = happyShift action_25
action_33 (22) = happyShift action_26
action_33 (23) = happyShift action_27
action_33 (24) = happyShift action_28
action_33 (25) = happyShift action_29
action_33 (26) = happyShift action_30
action_33 (28) = happyShift action_10
action_33 (32) = happyShift action_11
action_33 (4) = happyGoto action_19
action_33 _ = happyReduce_10

action_34 (6) = happyShift action_4
action_34 (7) = happyShift action_2
action_34 (8) = happyShift action_5
action_34 (11) = happyShift action_6
action_34 (12) = happyShift action_7
action_34 (13) = happyShift action_8
action_34 (15) = happyShift action_9
action_34 (16) = happyShift action_20
action_34 (17) = happyShift action_21
action_34 (18) = happyShift action_22
action_34 (19) = happyShift action_23
action_34 (20) = happyShift action_24
action_34 (21) = happyShift action_25
action_34 (22) = happyShift action_26
action_34 (23) = happyShift action_27
action_34 (24) = happyShift action_28
action_34 (25) = happyShift action_29
action_34 (26) = happyShift action_30
action_34 (28) = happyShift action_10
action_34 (32) = happyShift action_11
action_34 (4) = happyGoto action_19
action_34 _ = happyReduce_9

action_35 (6) = happyShift action_4
action_35 (7) = happyShift action_2
action_35 (8) = happyShift action_5
action_35 (11) = happyShift action_6
action_35 (12) = happyShift action_7
action_35 (13) = happyShift action_8
action_35 (15) = happyShift action_9
action_35 (16) = happyShift action_20
action_35 (17) = happyShift action_21
action_35 (18) = happyShift action_22
action_35 (19) = happyShift action_23
action_35 (20) = happyShift action_24
action_35 (21) = happyShift action_25
action_35 (22) = happyShift action_26
action_35 (23) = happyShift action_27
action_35 (24) = happyShift action_28
action_35 (25) = happyShift action_29
action_35 (26) = happyShift action_30
action_35 (28) = happyShift action_10
action_35 (32) = happyShift action_11
action_35 (4) = happyGoto action_19
action_35 _ = happyReduce_8

action_36 (6) = happyShift action_4
action_36 (7) = happyShift action_2
action_36 (8) = happyShift action_5
action_36 (11) = happyShift action_6
action_36 (12) = happyShift action_7
action_36 (13) = happyShift action_8
action_36 (15) = happyShift action_9
action_36 (16) = happyShift action_20
action_36 (17) = happyShift action_21
action_36 (18) = happyShift action_22
action_36 (19) = happyShift action_23
action_36 (20) = happyShift action_24
action_36 (21) = happyShift action_25
action_36 (22) = happyShift action_26
action_36 (23) = happyShift action_27
action_36 (24) = happyShift action_28
action_36 (25) = happyShift action_29
action_36 (26) = happyShift action_30
action_36 (28) = happyShift action_10
action_36 (32) = happyShift action_11
action_36 (4) = happyGoto action_19
action_36 _ = happyReduce_7

action_37 (6) = happyShift action_4
action_37 (7) = happyShift action_2
action_37 (8) = happyShift action_5
action_37 (11) = happyShift action_6
action_37 (12) = happyShift action_7
action_37 (13) = happyShift action_8
action_37 (15) = happyShift action_9
action_37 (16) = happyShift action_20
action_37 (17) = happyShift action_21
action_37 (18) = happyShift action_22
action_37 (19) = happyShift action_23
action_37 (20) = happyShift action_24
action_37 (21) = happyShift action_25
action_37 (22) = happyShift action_26
action_37 (23) = happyShift action_27
action_37 (24) = happyShift action_28
action_37 (25) = happyShift action_29
action_37 (26) = happyShift action_30
action_37 (28) = happyShift action_10
action_37 (32) = happyShift action_11
action_37 (4) = happyGoto action_19
action_37 _ = happyReduce_15

action_38 (6) = happyShift action_4
action_38 (7) = happyShift action_2
action_38 (8) = happyShift action_5
action_38 (11) = happyShift action_6
action_38 (12) = happyShift action_7
action_38 (13) = happyShift action_8
action_38 (15) = happyShift action_9
action_38 (16) = happyShift action_20
action_38 (17) = happyShift action_21
action_38 (18) = happyShift action_22
action_38 (19) = happyShift action_23
action_38 (20) = happyShift action_24
action_38 (21) = happyShift action_25
action_38 (22) = happyShift action_26
action_38 (23) = happyShift action_27
action_38 (24) = happyShift action_28
action_38 (25) = happyShift action_29
action_38 (26) = happyShift action_30
action_38 (28) = happyShift action_10
action_38 (32) = happyShift action_11
action_38 (4) = happyGoto action_19
action_38 _ = happyReduce_14

action_39 (6) = happyShift action_4
action_39 (7) = happyShift action_2
action_39 (8) = happyShift action_5
action_39 (11) = happyShift action_6
action_39 (12) = happyShift action_7
action_39 (13) = happyShift action_8
action_39 (15) = happyShift action_9
action_39 (16) = happyShift action_20
action_39 (17) = happyShift action_21
action_39 (18) = happyShift action_22
action_39 (19) = happyShift action_23
action_39 (20) = happyShift action_24
action_39 (21) = happyShift action_25
action_39 (22) = happyShift action_26
action_39 (23) = happyShift action_27
action_39 (24) = happyShift action_28
action_39 (25) = happyShift action_29
action_39 (26) = happyShift action_30
action_39 (28) = happyShift action_10
action_39 (32) = happyShift action_11
action_39 (4) = happyGoto action_19
action_39 _ = happyReduce_13

action_40 (6) = happyShift action_4
action_40 (7) = happyShift action_2
action_40 (8) = happyShift action_5
action_40 (11) = happyShift action_6
action_40 (12) = happyShift action_7
action_40 (13) = happyShift action_8
action_40 (15) = happyShift action_9
action_40 (28) = happyShift action_10
action_40 (32) = happyShift action_11
action_40 (4) = happyGoto action_50
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (6) = happyShift action_4
action_41 (7) = happyShift action_2
action_41 (8) = happyShift action_5
action_41 (11) = happyShift action_6
action_41 (12) = happyShift action_7
action_41 (13) = happyShift action_8
action_41 (15) = happyShift action_9
action_41 (28) = happyShift action_10
action_41 (32) = happyShift action_11
action_41 (4) = happyGoto action_49
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_20

action_43 (29) = happyShift action_48
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (7) = happyShift action_13
action_44 (5) = happyGoto action_47
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (6) = happyShift action_4
action_45 (7) = happyShift action_2
action_45 (8) = happyShift action_5
action_45 (11) = happyShift action_6
action_45 (12) = happyShift action_7
action_45 (13) = happyShift action_8
action_45 (15) = happyShift action_9
action_45 (28) = happyShift action_10
action_45 (32) = happyShift action_11
action_45 (4) = happyGoto action_46
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (6) = happyShift action_4
action_46 (7) = happyShift action_2
action_46 (8) = happyShift action_5
action_46 (11) = happyShift action_6
action_46 (12) = happyShift action_7
action_46 (13) = happyShift action_8
action_46 (15) = happyShift action_9
action_46 (16) = happyShift action_20
action_46 (17) = happyShift action_21
action_46 (18) = happyShift action_22
action_46 (19) = happyShift action_23
action_46 (20) = happyShift action_24
action_46 (21) = happyShift action_25
action_46 (22) = happyShift action_26
action_46 (23) = happyShift action_27
action_46 (24) = happyShift action_28
action_46 (25) = happyShift action_29
action_46 (26) = happyShift action_30
action_46 (28) = happyShift action_10
action_46 (32) = happyShift action_11
action_46 (4) = happyGoto action_19
action_46 _ = happyReduce_21

action_47 _ = happyReduce_24

action_48 (31) = happyShift action_53
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (6) = happyShift action_4
action_49 (7) = happyShift action_2
action_49 (8) = happyShift action_5
action_49 (11) = happyShift action_6
action_49 (12) = happyShift action_7
action_49 (13) = happyShift action_8
action_49 (14) = happyShift action_52
action_49 (15) = happyShift action_9
action_49 (16) = happyShift action_20
action_49 (17) = happyShift action_21
action_49 (18) = happyShift action_22
action_49 (19) = happyShift action_23
action_49 (20) = happyShift action_24
action_49 (21) = happyShift action_25
action_49 (22) = happyShift action_26
action_49 (23) = happyShift action_27
action_49 (24) = happyShift action_28
action_49 (25) = happyShift action_29
action_49 (26) = happyShift action_30
action_49 (28) = happyShift action_10
action_49 (32) = happyShift action_11
action_49 (4) = happyGoto action_19
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (6) = happyShift action_4
action_50 (7) = happyShift action_2
action_50 (8) = happyShift action_5
action_50 (10) = happyShift action_51
action_50 (11) = happyShift action_6
action_50 (12) = happyShift action_7
action_50 (13) = happyShift action_8
action_50 (15) = happyShift action_9
action_50 (16) = happyShift action_20
action_50 (17) = happyShift action_21
action_50 (18) = happyShift action_22
action_50 (19) = happyShift action_23
action_50 (20) = happyShift action_24
action_50 (21) = happyShift action_25
action_50 (22) = happyShift action_26
action_50 (23) = happyShift action_27
action_50 (24) = happyShift action_28
action_50 (25) = happyShift action_29
action_50 (26) = happyShift action_30
action_50 (28) = happyShift action_10
action_50 (32) = happyShift action_11
action_50 (4) = happyGoto action_19
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (6) = happyShift action_4
action_51 (7) = happyShift action_2
action_51 (8) = happyShift action_5
action_51 (11) = happyShift action_6
action_51 (12) = happyShift action_7
action_51 (13) = happyShift action_8
action_51 (15) = happyShift action_9
action_51 (28) = happyShift action_10
action_51 (32) = happyShift action_11
action_51 (4) = happyGoto action_56
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (6) = happyShift action_4
action_52 (7) = happyShift action_2
action_52 (8) = happyShift action_5
action_52 (11) = happyShift action_6
action_52 (12) = happyShift action_7
action_52 (13) = happyShift action_8
action_52 (15) = happyShift action_9
action_52 (28) = happyShift action_10
action_52 (32) = happyShift action_11
action_52 (4) = happyGoto action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (6) = happyShift action_4
action_53 (7) = happyShift action_2
action_53 (8) = happyShift action_5
action_53 (11) = happyShift action_6
action_53 (12) = happyShift action_7
action_53 (13) = happyShift action_8
action_53 (15) = happyShift action_9
action_53 (28) = happyShift action_10
action_53 (32) = happyShift action_11
action_53 (4) = happyGoto action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (6) = happyShift action_4
action_54 (7) = happyShift action_2
action_54 (8) = happyShift action_5
action_54 (11) = happyShift action_6
action_54 (12) = happyShift action_7
action_54 (13) = happyShift action_8
action_54 (15) = happyShift action_9
action_54 (16) = happyShift action_20
action_54 (17) = happyShift action_21
action_54 (18) = happyShift action_22
action_54 (19) = happyShift action_23
action_54 (20) = happyShift action_24
action_54 (21) = happyShift action_25
action_54 (22) = happyShift action_26
action_54 (23) = happyShift action_27
action_54 (24) = happyShift action_28
action_54 (25) = happyShift action_29
action_54 (26) = happyShift action_30
action_54 (28) = happyShift action_10
action_54 (32) = happyShift action_11
action_54 (4) = happyGoto action_19
action_54 _ = happyReduce_22

action_55 (6) = happyShift action_4
action_55 (7) = happyShift action_2
action_55 (8) = happyShift action_5
action_55 (11) = happyShift action_6
action_55 (12) = happyShift action_7
action_55 (13) = happyShift action_8
action_55 (15) = happyShift action_9
action_55 (16) = happyShift action_20
action_55 (17) = happyShift action_21
action_55 (18) = happyShift action_22
action_55 (19) = happyShift action_23
action_55 (20) = happyShift action_24
action_55 (21) = happyShift action_25
action_55 (22) = happyShift action_26
action_55 (23) = happyShift action_27
action_55 (24) = happyShift action_28
action_55 (25) = happyShift action_29
action_55 (26) = happyShift action_30
action_55 (28) = happyShift action_10
action_55 (32) = happyShift action_11
action_55 (4) = happyGoto action_19
action_55 _ = happyReduce_18

action_56 (6) = happyShift action_4
action_56 (7) = happyShift action_2
action_56 (8) = happyShift action_5
action_56 (11) = happyShift action_6
action_56 (12) = happyShift action_7
action_56 (13) = happyShift action_8
action_56 (15) = happyShift action_9
action_56 (16) = happyShift action_20
action_56 (17) = happyShift action_21
action_56 (18) = happyShift action_22
action_56 (19) = happyShift action_23
action_56 (20) = happyShift action_24
action_56 (21) = happyShift action_25
action_56 (22) = happyShift action_26
action_56 (23) = happyShift action_27
action_56 (24) = happyShift action_28
action_56 (25) = happyShift action_29
action_56 (26) = happyShift action_30
action_56 (28) = happyShift action_10
action_56 (32) = happyShift action_11
action_56 (4) = happyGoto action_19
action_56 _ = happyReduce_16

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TDef happy_var_1))
	 =  HappyAbsSyn4
		 (Def happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TNumber happy_var_1))
	 =  HappyAbsSyn4
		 (Number happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (Boolean True
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (Boolean False
	)

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (UnOp Succ happy_var_1
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  4 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (UnOp Pred happy_var_1
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Add happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Sub happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Mul happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Pow happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Eq happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Diff happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 And happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Or happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Op happy_var_1 Xor happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 6 4 happyReduction_16
happyReduction_16 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_2  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 6 4 happyReduction_18
happyReduction_18 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TDef happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let [(happy_var_2, happy_var_4)] happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (UnOp Not happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  4 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 4 happyReduction_21
happyReduction_21 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lamb happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 6 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lamb happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  5 happyReduction_23
happyReduction_23 (HappyTerminal (TDef happy_var_1))
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  5 happyReduction_24
happyReduction_24 _
	(HappyTerminal happy_var_2)
	(HappyTerminal (TDef happy_var_1))
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 33 33 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TNumber happy_dollar_dollar -> cont 6;
	TDef happy_dollar_dollar -> cont 7;
	TIf -> cont 8;
	TThen -> cont 9;
	TElse -> cont 10;
	TTrue -> cont 11;
	TFalse -> cont 12;
	TLet -> cont 13;
	TIn -> cont 14;
	TNot -> cont 15;
	TAnd -> cont 16;
	TOr -> cont 17;
	TXor -> cont 18;
	TSucc -> cont 19;
	TPred -> cont 20;
	TAdd -> cont 21;
	TSub -> cont 22;
	TMul -> cont 23;
	TPow -> cont 24;
	TEqual -> cont 25;
	TDiff -> cont 26;
	TAssign -> cont 27;
	TLParen -> cont 28;
	TRParen -> cont 29;
	TComma -> cont 30;
	TDot -> cont 31;
	TLamb -> cont 32;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 33 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
