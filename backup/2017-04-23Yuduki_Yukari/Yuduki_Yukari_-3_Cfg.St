[statedef -3]

[state -2, Varset - 初期化]
type = varset
triggerAll = time = 1 
trigger1 = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1 = RoundNo = 1
;------------初期コンボテンションゲージの値(-1 - 23)
var(50) = 8
;=======================================
persistent = 1

[state -2, Varset - 初期化]
type = varset
triggerAll = time = 1 
trigger1 = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1 = RoundNo = 1
;------------初期シンクロゲージ値(0 - 300)
fvar(29) = 50 
;=======================================
persistent = 1

[state -2, Varset - 初期化]
type = varset
triggerAll = time = 1 
trigger1 = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1 = RoundNo = 1
;------------脱衣KOモードON/OFF(1,0)
var(57) = 1
;--------------------------------------

[state -2, Varset - 初期化]
type = varset
triggerAll = time = 1 
trigger1 = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1 = RoundNo = 1
 ;------------シークレットモードON/OFF(1,0)---
var(58) = 1
;--------------------------------------

[state -2, Varset - 初期化 AI起動]
type = varset
trigger1 = roundno = 1
trigger1 = Helper(400),time = 0
trigger1 = var(55) != [1,3]
 ;------------AI起動
var(55) = 0; (1,2にすることで常時起動　逆に3にすることで起動しない)
;-----------------------------

[state -2, Null (ネームエントリー)]
type = null
triggerall = ( Roundstate = 0 || Roundstate = 1 ) 
triggerall = RoundNo = 1
trigger1 = time > 2
trigger2 = time = 0 && var(31) := 24
trigger3 = time = 1 && var(32) := 10
trigger4 = time = 2 && var(33) := 17

;0 - 37の範囲で‥
;文字 : (0)A B C D E F G H I J (10)K L M N O P Q R S T (20)U V W X Y Z 1 2 3 4 (30)5 6 7 8 9 0 . &(37)

;--------------------------------
[state -2, varset (ネームエントリー計算)]
type = varset
triggerAll = time = 3
triggerAll = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1= RoundNo = 1
var(31) = var(31) % 38 + 1


[state -2, varset (ネームエントリー計算)]
type = varset
triggerAll = time = 3 
triggerAll = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1= RoundNo = 1
var(32) = var(32) % 38 + 1

[state -2, varset (ネームエントリー計算)]
type = varset
triggerAll = time = 3 
triggerAll = ( Roundstate = 0 || Roundstate = 1 ) 
trigger1= RoundNo = 1
var(33) = var(33) % 38 + 1
;---------------------------------
