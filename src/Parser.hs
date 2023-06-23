{-# OPTIONS_GHC -w #-}
module Parser(parse) where
import Lexer.Token
import Lambda.Lambda
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,143) ([3696,32896,0,0,0,65436,63,0,14784,512,0,0,0,3696,49280,57,59138,8191,0,61440,65534,0,0,231,39944,8195,3696,128,0,0,0,924,28704,32782,14784,512,231,39944,8195,3696,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,59136,2048,0,28672,65535,14784,512,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Expr","int","var","if","then","else","true","false","'!'","'&&'","'||'","'^'","'++'","'--'","'+'","'-'","'*'","'**'","'=='","'!='","'('","')'","%eof"]
        bit_start = st * 26
        bit_end = (st + 1) * 26
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..25]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (5) = happyShift action_4
action_0 (6) = happyShift action_2
action_0 (7) = happyShift action_5
action_0 (10) = happyShift action_6
action_0 (11) = happyShift action_7
action_0 (12) = happyShift action_8
action_0 (24) = happyShift action_9
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (6) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (5) = happyShift action_4
action_3 (6) = happyShift action_2
action_3 (7) = happyShift action_5
action_3 (10) = happyShift action_6
action_3 (11) = happyShift action_7
action_3 (12) = happyShift action_8
action_3 (13) = happyShift action_14
action_3 (14) = happyShift action_15
action_3 (15) = happyShift action_16
action_3 (16) = happyShift action_17
action_3 (17) = happyShift action_18
action_3 (18) = happyShift action_19
action_3 (19) = happyShift action_20
action_3 (20) = happyShift action_21
action_3 (21) = happyShift action_22
action_3 (22) = happyShift action_23
action_3 (23) = happyShift action_24
action_3 (24) = happyShift action_9
action_3 (26) = happyAccept
action_3 (4) = happyGoto action_13
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 (5) = happyShift action_4
action_5 (6) = happyShift action_2
action_5 (7) = happyShift action_5
action_5 (10) = happyShift action_6
action_5 (11) = happyShift action_7
action_5 (12) = happyShift action_8
action_5 (24) = happyShift action_9
action_5 (4) = happyGoto action_12
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_3

action_7 _ = happyReduce_4

action_8 (5) = happyShift action_4
action_8 (6) = happyShift action_2
action_8 (7) = happyShift action_5
action_8 (10) = happyShift action_6
action_8 (11) = happyShift action_7
action_8 (12) = happyShift action_8
action_8 (24) = happyShift action_9
action_8 (4) = happyGoto action_11
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (5) = happyShift action_4
action_9 (6) = happyShift action_2
action_9 (7) = happyShift action_5
action_9 (10) = happyShift action_6
action_9 (11) = happyShift action_7
action_9 (12) = happyShift action_8
action_9 (24) = happyShift action_9
action_9 (4) = happyGoto action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (5) = happyShift action_4
action_10 (6) = happyShift action_2
action_10 (7) = happyShift action_5
action_10 (10) = happyShift action_6
action_10 (11) = happyShift action_7
action_10 (12) = happyShift action_8
action_10 (13) = happyShift action_14
action_10 (14) = happyShift action_15
action_10 (15) = happyShift action_16
action_10 (16) = happyShift action_17
action_10 (17) = happyShift action_18
action_10 (18) = happyShift action_19
action_10 (19) = happyShift action_20
action_10 (20) = happyShift action_21
action_10 (21) = happyShift action_22
action_10 (22) = happyShift action_23
action_10 (23) = happyShift action_24
action_10 (24) = happyShift action_9
action_10 (25) = happyShift action_35
action_10 (4) = happyGoto action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (5) = happyShift action_4
action_11 (6) = happyShift action_2
action_11 (7) = happyShift action_5
action_11 (10) = happyShift action_6
action_11 (11) = happyShift action_7
action_11 (12) = happyShift action_8
action_11 (13) = happyShift action_14
action_11 (14) = happyShift action_15
action_11 (15) = happyShift action_16
action_11 (16) = happyShift action_17
action_11 (17) = happyShift action_18
action_11 (18) = happyShift action_19
action_11 (19) = happyShift action_20
action_11 (20) = happyShift action_21
action_11 (21) = happyShift action_22
action_11 (22) = happyShift action_23
action_11 (23) = happyShift action_24
action_11 (24) = happyShift action_9
action_11 (4) = happyGoto action_13
action_11 _ = happyReduce_18

action_12 (5) = happyShift action_4
action_12 (6) = happyShift action_2
action_12 (7) = happyShift action_5
action_12 (8) = happyShift action_34
action_12 (10) = happyShift action_6
action_12 (11) = happyShift action_7
action_12 (12) = happyShift action_8
action_12 (13) = happyShift action_14
action_12 (14) = happyShift action_15
action_12 (15) = happyShift action_16
action_12 (16) = happyShift action_17
action_12 (17) = happyShift action_18
action_12 (18) = happyShift action_19
action_12 (19) = happyShift action_20
action_12 (20) = happyShift action_21
action_12 (21) = happyShift action_22
action_12 (22) = happyShift action_23
action_12 (23) = happyShift action_24
action_12 (24) = happyShift action_9
action_12 (4) = happyGoto action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (5) = happyShift action_4
action_13 (6) = happyShift action_2
action_13 (7) = happyShift action_5
action_13 (10) = happyShift action_6
action_13 (11) = happyShift action_7
action_13 (12) = happyShift action_8
action_13 (13) = happyShift action_14
action_13 (14) = happyShift action_15
action_13 (15) = happyShift action_16
action_13 (16) = happyShift action_17
action_13 (17) = happyShift action_18
action_13 (18) = happyShift action_19
action_13 (19) = happyShift action_20
action_13 (20) = happyShift action_21
action_13 (21) = happyShift action_22
action_13 (22) = happyShift action_23
action_13 (23) = happyShift action_24
action_13 (24) = happyShift action_9
action_13 (4) = happyGoto action_13
action_13 _ = happyReduce_17

action_14 (5) = happyShift action_4
action_14 (6) = happyShift action_2
action_14 (7) = happyShift action_5
action_14 (10) = happyShift action_6
action_14 (11) = happyShift action_7
action_14 (12) = happyShift action_8
action_14 (24) = happyShift action_9
action_14 (4) = happyGoto action_33
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (5) = happyShift action_4
action_15 (6) = happyShift action_2
action_15 (7) = happyShift action_5
action_15 (10) = happyShift action_6
action_15 (11) = happyShift action_7
action_15 (12) = happyShift action_8
action_15 (24) = happyShift action_9
action_15 (4) = happyGoto action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (5) = happyShift action_4
action_16 (6) = happyShift action_2
action_16 (7) = happyShift action_5
action_16 (10) = happyShift action_6
action_16 (11) = happyShift action_7
action_16 (12) = happyShift action_8
action_16 (24) = happyShift action_9
action_16 (4) = happyGoto action_31
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_5

action_18 _ = happyReduce_6

action_19 (5) = happyShift action_4
action_19 (6) = happyShift action_2
action_19 (7) = happyShift action_5
action_19 (10) = happyShift action_6
action_19 (11) = happyShift action_7
action_19 (12) = happyShift action_8
action_19 (24) = happyShift action_9
action_19 (4) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (5) = happyShift action_4
action_20 (6) = happyShift action_2
action_20 (7) = happyShift action_5
action_20 (10) = happyShift action_6
action_20 (11) = happyShift action_7
action_20 (12) = happyShift action_8
action_20 (24) = happyShift action_9
action_20 (4) = happyGoto action_29
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (5) = happyShift action_4
action_21 (6) = happyShift action_2
action_21 (7) = happyShift action_5
action_21 (10) = happyShift action_6
action_21 (11) = happyShift action_7
action_21 (12) = happyShift action_8
action_21 (24) = happyShift action_9
action_21 (4) = happyGoto action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (5) = happyShift action_4
action_22 (6) = happyShift action_2
action_22 (7) = happyShift action_5
action_22 (10) = happyShift action_6
action_22 (11) = happyShift action_7
action_22 (12) = happyShift action_8
action_22 (24) = happyShift action_9
action_22 (4) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (5) = happyShift action_4
action_23 (6) = happyShift action_2
action_23 (7) = happyShift action_5
action_23 (10) = happyShift action_6
action_23 (11) = happyShift action_7
action_23 (12) = happyShift action_8
action_23 (24) = happyShift action_9
action_23 (4) = happyGoto action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (5) = happyShift action_4
action_24 (6) = happyShift action_2
action_24 (7) = happyShift action_5
action_24 (10) = happyShift action_6
action_24 (11) = happyShift action_7
action_24 (12) = happyShift action_8
action_24 (24) = happyShift action_9
action_24 (4) = happyGoto action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (5) = happyShift action_4
action_25 (6) = happyShift action_2
action_25 (7) = happyShift action_5
action_25 (10) = happyShift action_6
action_25 (11) = happyShift action_7
action_25 (12) = happyShift action_8
action_25 (13) = happyShift action_14
action_25 (14) = happyShift action_15
action_25 (15) = happyShift action_16
action_25 (16) = happyShift action_17
action_25 (17) = happyShift action_18
action_25 (18) = happyShift action_19
action_25 (19) = happyShift action_20
action_25 (20) = happyShift action_21
action_25 (21) = happyShift action_22
action_25 (22) = happyShift action_23
action_25 (23) = happyShift action_24
action_25 (24) = happyShift action_9
action_25 (4) = happyGoto action_13
action_25 _ = happyReduce_12

action_26 (5) = happyShift action_4
action_26 (6) = happyShift action_2
action_26 (7) = happyShift action_5
action_26 (10) = happyShift action_6
action_26 (11) = happyShift action_7
action_26 (12) = happyShift action_8
action_26 (13) = happyShift action_14
action_26 (14) = happyShift action_15
action_26 (15) = happyShift action_16
action_26 (16) = happyShift action_17
action_26 (17) = happyShift action_18
action_26 (18) = happyShift action_19
action_26 (19) = happyShift action_20
action_26 (20) = happyShift action_21
action_26 (21) = happyShift action_22
action_26 (22) = happyShift action_23
action_26 (23) = happyShift action_24
action_26 (24) = happyShift action_9
action_26 (4) = happyGoto action_13
action_26 _ = happyReduce_11

action_27 (5) = happyShift action_4
action_27 (6) = happyShift action_2
action_27 (7) = happyShift action_5
action_27 (10) = happyShift action_6
action_27 (11) = happyShift action_7
action_27 (12) = happyShift action_8
action_27 (13) = happyShift action_14
action_27 (14) = happyShift action_15
action_27 (15) = happyShift action_16
action_27 (16) = happyShift action_17
action_27 (17) = happyShift action_18
action_27 (18) = happyShift action_19
action_27 (19) = happyShift action_20
action_27 (20) = happyShift action_21
action_27 (21) = happyShift action_22
action_27 (22) = happyShift action_23
action_27 (23) = happyShift action_24
action_27 (24) = happyShift action_9
action_27 (4) = happyGoto action_13
action_27 _ = happyReduce_10

action_28 (5) = happyShift action_4
action_28 (6) = happyShift action_2
action_28 (7) = happyShift action_5
action_28 (10) = happyShift action_6
action_28 (11) = happyShift action_7
action_28 (12) = happyShift action_8
action_28 (13) = happyShift action_14
action_28 (14) = happyShift action_15
action_28 (15) = happyShift action_16
action_28 (16) = happyShift action_17
action_28 (17) = happyShift action_18
action_28 (18) = happyShift action_19
action_28 (19) = happyShift action_20
action_28 (20) = happyShift action_21
action_28 (21) = happyShift action_22
action_28 (22) = happyShift action_23
action_28 (23) = happyShift action_24
action_28 (24) = happyShift action_9
action_28 (4) = happyGoto action_13
action_28 _ = happyReduce_9

action_29 (5) = happyShift action_4
action_29 (6) = happyShift action_2
action_29 (7) = happyShift action_5
action_29 (10) = happyShift action_6
action_29 (11) = happyShift action_7
action_29 (12) = happyShift action_8
action_29 (13) = happyShift action_14
action_29 (14) = happyShift action_15
action_29 (15) = happyShift action_16
action_29 (16) = happyShift action_17
action_29 (17) = happyShift action_18
action_29 (18) = happyShift action_19
action_29 (19) = happyShift action_20
action_29 (20) = happyShift action_21
action_29 (21) = happyShift action_22
action_29 (22) = happyShift action_23
action_29 (23) = happyShift action_24
action_29 (24) = happyShift action_9
action_29 (4) = happyGoto action_13
action_29 _ = happyReduce_8

action_30 (5) = happyShift action_4
action_30 (6) = happyShift action_2
action_30 (7) = happyShift action_5
action_30 (10) = happyShift action_6
action_30 (11) = happyShift action_7
action_30 (12) = happyShift action_8
action_30 (13) = happyShift action_14
action_30 (14) = happyShift action_15
action_30 (15) = happyShift action_16
action_30 (16) = happyShift action_17
action_30 (17) = happyShift action_18
action_30 (18) = happyShift action_19
action_30 (19) = happyShift action_20
action_30 (20) = happyShift action_21
action_30 (21) = happyShift action_22
action_30 (22) = happyShift action_23
action_30 (23) = happyShift action_24
action_30 (24) = happyShift action_9
action_30 (4) = happyGoto action_13
action_30 _ = happyReduce_7

action_31 (5) = happyShift action_4
action_31 (6) = happyShift action_2
action_31 (7) = happyShift action_5
action_31 (10) = happyShift action_6
action_31 (11) = happyShift action_7
action_31 (12) = happyShift action_8
action_31 (13) = happyShift action_14
action_31 (14) = happyShift action_15
action_31 (15) = happyShift action_16
action_31 (16) = happyShift action_17
action_31 (17) = happyShift action_18
action_31 (18) = happyShift action_19
action_31 (19) = happyShift action_20
action_31 (20) = happyShift action_21
action_31 (21) = happyShift action_22
action_31 (22) = happyShift action_23
action_31 (23) = happyShift action_24
action_31 (24) = happyShift action_9
action_31 (4) = happyGoto action_13
action_31 _ = happyReduce_15

action_32 (5) = happyShift action_4
action_32 (6) = happyShift action_2
action_32 (7) = happyShift action_5
action_32 (10) = happyShift action_6
action_32 (11) = happyShift action_7
action_32 (12) = happyShift action_8
action_32 (13) = happyShift action_14
action_32 (14) = happyShift action_15
action_32 (15) = happyShift action_16
action_32 (16) = happyShift action_17
action_32 (17) = happyShift action_18
action_32 (18) = happyShift action_19
action_32 (19) = happyShift action_20
action_32 (20) = happyShift action_21
action_32 (21) = happyShift action_22
action_32 (22) = happyShift action_23
action_32 (23) = happyShift action_24
action_32 (24) = happyShift action_9
action_32 (4) = happyGoto action_13
action_32 _ = happyReduce_14

action_33 (5) = happyShift action_4
action_33 (6) = happyShift action_2
action_33 (7) = happyShift action_5
action_33 (10) = happyShift action_6
action_33 (11) = happyShift action_7
action_33 (12) = happyShift action_8
action_33 (13) = happyShift action_14
action_33 (14) = happyShift action_15
action_33 (15) = happyShift action_16
action_33 (16) = happyShift action_17
action_33 (17) = happyShift action_18
action_33 (18) = happyShift action_19
action_33 (19) = happyShift action_20
action_33 (20) = happyShift action_21
action_33 (21) = happyShift action_22
action_33 (22) = happyShift action_23
action_33 (23) = happyShift action_24
action_33 (24) = happyShift action_9
action_33 (4) = happyGoto action_13
action_33 _ = happyReduce_13

action_34 (5) = happyShift action_4
action_34 (6) = happyShift action_2
action_34 (7) = happyShift action_5
action_34 (10) = happyShift action_6
action_34 (11) = happyShift action_7
action_34 (12) = happyShift action_8
action_34 (24) = happyShift action_9
action_34 (4) = happyGoto action_36
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_19

action_36 (5) = happyShift action_4
action_36 (6) = happyShift action_2
action_36 (7) = happyShift action_5
action_36 (9) = happyShift action_37
action_36 (10) = happyShift action_6
action_36 (11) = happyShift action_7
action_36 (12) = happyShift action_8
action_36 (13) = happyShift action_14
action_36 (14) = happyShift action_15
action_36 (15) = happyShift action_16
action_36 (16) = happyShift action_17
action_36 (17) = happyShift action_18
action_36 (18) = happyShift action_19
action_36 (19) = happyShift action_20
action_36 (20) = happyShift action_21
action_36 (21) = happyShift action_22
action_36 (22) = happyShift action_23
action_36 (23) = happyShift action_24
action_36 (24) = happyShift action_9
action_36 (4) = happyGoto action_13
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (5) = happyShift action_4
action_37 (6) = happyShift action_2
action_37 (7) = happyShift action_5
action_37 (10) = happyShift action_6
action_37 (11) = happyShift action_7
action_37 (12) = happyShift action_8
action_37 (24) = happyShift action_9
action_37 (4) = happyGoto action_38
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (5) = happyShift action_4
action_38 (6) = happyShift action_2
action_38 (7) = happyShift action_5
action_38 (10) = happyShift action_6
action_38 (11) = happyShift action_7
action_38 (12) = happyShift action_8
action_38 (13) = happyShift action_14
action_38 (14) = happyShift action_15
action_38 (15) = happyShift action_16
action_38 (16) = happyShift action_17
action_38 (17) = happyShift action_18
action_38 (18) = happyShift action_19
action_38 (19) = happyShift action_20
action_38 (20) = happyShift action_21
action_38 (21) = happyShift action_22
action_38 (22) = happyShift action_23
action_38 (23) = happyShift action_24
action_38 (24) = happyShift action_9
action_38 (4) = happyGoto action_13
action_38 _ = happyReduce_16

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

happyReduce_18 = happySpecReduce_2  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (UnOp Not happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 26 26 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TNumber happy_dollar_dollar -> cont 5;
	TDef happy_dollar_dollar -> cont 6;
	TIf -> cont 7;
	TThen -> cont 8;
	TElse -> cont 9;
	TTrue -> cont 10;
	TFalse -> cont 11;
	TNot -> cont 12;
	TAnd -> cont 13;
	TOr -> cont 14;
	TXor -> cont 15;
	TSucc -> cont 16;
	TPred -> cont 17;
	TAdd -> cont 18;
	TSub -> cont 19;
	TMul -> cont 20;
	TPow -> cont 21;
	TEqual -> cont 22;
	TDiff -> cont 23;
	TLParen -> cont 24;
	TRParen -> cont 25;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 26 tk tks = happyError' (tks, explist)
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
