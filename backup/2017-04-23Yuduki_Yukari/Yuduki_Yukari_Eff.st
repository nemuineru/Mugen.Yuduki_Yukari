
;タイムオーバー（負けた時）
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 無敵]
type = NotHitBy
trigger1 = 1 ;トリガーを何も書かず「1」にする事により、『無条件で常に実行させる命令』になる。
value = SCA
time = 1


;通常勝利
[Statedef 180]
type = S

[State 180, ステート変更]
type = ChangeState
trigger1 = Time = 0
trigger1 = var(15) != [11,15] 
value = 181

[State 180, ステート変更]
type = ChangeState
trigger1 = Time = 0
trigger1 = var(15) = 11 
value = 182


;---------------------------------------------------------------------------
;勝利ポーズ1
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[state 181]
type = Playsnd
trigger1 = time = 18
volume = 4
Channel = 0
value = 1,7

[State 181, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;----:サヨナラチェーンソーWin:-----;

[state -2]
type = Assertspecial
trigger1 = var(15) = 10
trigger1 = time > 0
Flag = NoMusic

[state 181]
type = AssertSpecial
trigger1 = var(15) = 10
trigger1 = time < 300
flag = RoundNotOver

;Overed Weapon Win
[Statedef 182]
type = S
ctrl = 0
anim = 182
velset = 0,0

[state 182]
type = Playsnd
trigger1 = time = 32
volume = 4
Channel = 0
value = 700,0
volume = 500

[State 182, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[state -2]
type = Assertspecial
trigger1 = time > 0
Flag = NoMusic

[state 181]
type = AssertSpecial
trigger1 = time < 500
flag = RoundNotOver


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; イントロの判定
; Initialize (at the start of the round)
[Statedef 5900]
type = S

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = !roundsexisted
value = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = !roundsexisted
fvalue = 0

;-------------------------(アニメーション分岐)

[State 190, 変数];対おっぱい星人イントロ
type = Changestate
triggerall = roundno = 1
trigger1 = (P2name = "Kung Fu girl")||(P2name = "morigan")||(P2name = "dragon")
trigger2 = (P2name = "siranui mai")||(P2name = "iroha")||(P2name = "Arcueid")||(P2name = "ciel")  
trigger3 = (P2name = "kanna")||(P2name = "astraea")
trigger3 = (P2name = "kanna")||(P2name = "chun li")||(P2name = "cammy")
value = 51190

[State 190, 変数];対ミクちゃん
type = Changestate
triggerall = roundno = 1
trigger1 = (P2name = "miku")||(P2name = "Miku")||(P2name = "Hatsune_Miku")||(P2name = "Hatsune Miku")
value = 51193

[State 190, 変数];対色物
type = Changestate
triggerall = roundno = 1
trigger1 = (P2name = "Mr_Shihan")||(P2name = "Mr_Shihan_KY")
value = 51195

[State 5900, 3] ;通常イントロ
type = ChangeState
trigger1 = roundno = 1
value = 190

;============================================


;イントロ:特殊と通常

;-------------------

;ノーマルイントロ
[Statedef 190]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 190, アニメ変更]
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

;anim 190の時（通常）
[state 190]
type = Playsnd
trigger1 = var(45) = 0
triggerall = anim = 190
trigger1 = time = 42
volume = 10000
Channel = 0
value = 1000,0

[State 190, 特殊効果];
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態

[State 190, ステート変更];アニメーションが終われば「通常立ち」のステートに変更する
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------


;---------------------------------------------------
;----------------------------（対 おっぱい星人）

;（対 おっぱい星人）
[Statedef 51190]
type = S
ctrl = 0
anim = 51190
velset = 0,0

;パンッ
[state 190]
type = Playsnd
trigger1 = anim = 51191
trigger1 = time = 1
volume = 10000
Channel = 1
value = 52,0
persistent = 0

;アニメ変更
[State 190, アニメ変更]
type = ChangeAnim
triggerall = Anim = 51190
trigger1 = Enemy,StateNo = 0
trigger2 = time > 64
value = 51191

;カーソルP2
[state ]
type = explod 
triggerall = anim = 51191
trigger1 = enemy,stateno = 0
anim = 51192
ownpal = 1
pos = Enemy,Const(size.mid.pos.x)  , Enemy,Const(size.mid.pos.y) - 20 
postype = p2
ID = 51192
SprPriority = 10
persistent = 0

;カーソルP1
[state ]
type = explod
triggerall = anim = 51191
trigger1 = AnimElemTime(4) = 1
anim = 51192
ownpal = 1
pos = 7,-49
postype = p1
Facing = 1
ID = 51192
SprPriority = 10
persistent = 0

;セレクト音
[state 190]
type = Playsnd
trigger1 = NumExplod(51192) = 1
trigger1 = anim = 51191
trigger1 = time % 20 = 10
volume = 10000
Channel = 2
value = 52,1

;セリフ
[state 190]
type = Playsnd
triggerall = anim = 51191
trigger1 = animElemtime(5) = 0
volume = 10000
Channel = 0
value = 1000,1

[State 190, 特殊効果];
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態

[State 190, ステート変更];アニメーションが終われば「通常立ち」のステートに変更する
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;------------------------

;（対 ミク）
[Statedef 51193]
type = S
ctrl = 0
anim = 51193
velset = 0,0

;アニメ変更
[State 190, アニメ変更]
type = ChangeAnim
triggerall = Anim = 51193
trigger1 = Enemy,StateNo = 0
trigger1 = time > 64
value = 51194

;ボイス
[state 190]
type = Playsnd
trigger1 = anim = 51194
trigger1 = AnimElemtime(5) = 0
volume = 10000
Channel = 1
value = 51193,0
persistent = 0

;ボイス
[state 190]
type = Playsnd
trigger1 = anim = 51194
trigger1 = AnimElemtime(28) = 0
volume = 10000
Channel = 1
value = 51193,1
persistent = 0

[State 190, 特殊効果];
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態

[State 190, ステート変更];アニメーションが終われば「通常立ち」のステートに変更する
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;（対 色物）
[Statedef 51195]
type = S
ctrl = 0
anim = 51195
velset = 0,0

;アニメ変更
[State 190, アニメ変更]
type = ChangeAnim
triggerall = Anim = 51195
trigger1 = Enemy,StateNo = 0
trigger2 = time > 32
value = 51196

;ボイス(すごい男だ)
[state 190]
type = Playsnd
trigger1 = (P2name = "Mr_Shihan")||(P2name = "Mr_Shihan_KY")
trigger1 = anim = 51196
trigger1 = AnimElemtime(7) = 0
volume = 10000
Channel = 1
value = 51195,0
persistent = 0

[State 190, 特殊効果];
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態

[State 190, ステート変更];アニメーションが終われば「通常立ち」のステートに変更する
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;---------------------------------------------------

;KOカット - 脱衣
[statedef 2455]
type = S
movetype = I
physics = N
anim = 9999
ctrl = 0
sprpriority = -1

[state 2455, Explod]
type = Explod
trigger1 = time = 0
ID = 2455
postype = back
pos = 0,0
scale = 0.4,0.4
bindtime = -1
anim = 2455
sprpriority = 8
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 1
Facing = 1

[state 2455, Explod]
type = Explod
trigger1 = time = 0
ID = 2555
pos = 0,0
postype = back
scale = 0.4,0.4
bindtime = -1
anim = 2555
sprpriority = 9
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 1
Facing = 1

;---------------------===============

;初期: ネームエントリー用ヘルパー
[statedef 7626]
type = S
movetype = I 
physics = N
anim = 9999
ctrl = 0

[state 7626]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1 )
trigger1 = roundno = 1
trigger1 = NumHelper(17626) != 1
postype = left
pos = 50 - 22 + Ifelse(Teamside = 1, 0 , 140) ,-120
ID = 17626
stateno = 17626
keyctrl = 0
ownpal = 1
name = "Name Entry1"
supermovetime = 900000
pausemovetime = 900000

[state 7626]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1)
trigger1 = roundno = 1
trigger1 = NumHelper(17627) != 1
postype = left
pos = 50 - 22 + 32 + Ifelse(Teamside = 1, 0 , 140) ,(helper(17626), pos Y)
ID = 17627
stateno = 17627
keyctrl = 0
ownpal = 1
name = "Name Entry2"
supermovetime = 900000
pausemovetime = 900000

[state 7626]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1 )
trigger1 = roundno = 1
trigger1 = NumHelper(17628) != 1
postype = left
pos =  50 - 22 + 64 + Ifelse(Teamside = 1, 0 , 140) ,(helper(17626), pos Y)
ID = 17628
stateno = 17628
keyctrl = 0
ownpal = 1
name = "Name Entry3"
supermovetime = 900000
pausemovetime = 900000

;-------------------------
[state ]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1 )
trigger1 = roundno = 1
trigger1 = NumHelper(17629) != 1
postype = left
pos =  49 - 22 + Ifelse(Teamside = 1, 0 , 140),-120
ID = 17629
stateno = 17629
keyctrl = 0
ownpal = 1
name = "Name Selectation"
supermovetime = 900000
pausemovetime = 900000

[state 17]
type = destroySelf
trigger1 = Roundstate = 2 

;#1
[statedef 17626]
type = S
movetype = I 
physics = N
anim = 17626
ctrl = 0

[state 17]
type = changeanim
trigger1 = 1
value = 17626
elem =  helper(17629),var(31)

[state 17]
type = destroySelf
trigger1 = Roundstate = 2 

;-------------------------
;#2
[statedef 17627]
type = S
movetype = I 
physics = N
anim = 17626
ctrl = 0

[state 17]
type = changeanim
trigger1 = 1
value = 17626
elem = helper(17629),var(32)

[state 18]
type = explod
trigger1 = time % 2 = 0
anim = 17630
ID = 17630
pos = 63 ,0

[state 17 ]
type = destroySelf
trigger1 = Roundstate = 2 

;---------------------------
;#3
[statedef 17628]
type = S
movetype = I 
physics = N
anim = 17626
ctrl = 0

[state 17]
type = changeanim
trigger1 = 1
value = 17626
elem = helper(17629),var(33)

[state 17]
type = destroySelf
trigger1 = Roundstate = 2 


;----------------------
;select
[statedef 17629]
type = S
movetype = I 
physics = N
anim = 17629
ctrl = 0
sprpriority = 4

;=============PLAYER操作=============;

[state 17]
type = posadd
triggerall = screenpos X < 48 + 66  - 22
trigger1 = (root,var(55) != [1,2])
trigger1 = root,command = "fwd"
x = 32

[state 10]
type = posadd
triggerall = screenpos X > 49 - 22
trigger1 = (root,var(55) != [1,2])
trigger1 = root,command = "back"
x = -32

[state 31]
type = Null
trigger1 = (root,var(55) = [1,2])
trigger2 = time > 4
trigger3 = time = 4 && var(31) := root,var(31)
trigger4 = time = 4 && var(32) := root,var(32)
trigger5 = time = 4 && var(33) := root,var(33)

[state 54]
type = varadd
triggerall = screenpos X < 48 + 66 - 22 + Ifelse(Teamside = 1, 0 , 140)
trigger1 = (root,var(55) != [1,2])
trigger1 = root,command = "up"
v  = 31 +  (Screenpos X - 48 + 22 - Ifelse(Teamside = 1, 0 , 140))/32   
value = 1

[state 87]
type = varadd
triggerall = screenpos X < 48 + 66 - 22 + Ifelse(Teamside = 1, 0 , 140)
trigger1 = (root,var(55) != [1,2])
trigger1 = root,command = "down"
v  = 31 +  (Screenpos X - 48 + 22 - Ifelse(Teamside = 1, 0 , 140) )/32   
value = -1


[state 69]
type = Playsnd
trigger1 = (root,var(55) != [1,2])
trigger1 = root,command = "up" ||  root,command = "down" || root,command = "fwd" ||  root,command = "back" 
value = 17626, 1
channel = 200
volume = -100

;=============AI version 

[state 13]
type = Null
trigger1 = (root,var(55) != [1,2]) 
trigger2 = time > 7 
trigger3 = time = 5 && var(31) := 0
trigger4 = time = 6 && var(32) := 1
trigger5 = time = 7 && var(33) := 1

[state 22]
type = varadd
triggerall = (root,var(55) = [1,2]) && ( Roundstate = 0 || Roundstate = 1 ) 
triggerall = screenpos X < 48 + 66 - 22 + Ifelse(Teamside = 1, 0 , 140)
trigger1 = time % 6 = 1
trigger1 = root,var(31 +  (Screenpos X - 48 + 22)/32) != var(31 +  (Screenpos X - 48 + 22  - Ifelse(Teamside = 1, 0 , 140) )/32)
v  = 31 +  (Screenpos X - 48 + 22 - Ifelse(Teamside = 1, 0 , 140))/32   
value = 1

[state 44]
type = posadd
triggerall = (root,var(55) = [1,2])
triggerall = screenpos X < 48 + 66 - 22 + Ifelse(Teamside = 1, 0 , 140)
trigger1 = root,var(31 +  (Screenpos X - 48 + 22 - Ifelse(Teamside = 1, 0 , 140) )/32) = var(31 +  (Screenpos X - 48 + 22  - Ifelse(Teamside = 1, 0 , 140) )/32)
x = 32


[state 90]
type = Playsnd
triggerall = (root,var(55) = [1,2]) && ( Roundstate = 0 || Roundstate = 1 ) 
triggerall = screenpos X < 48 + 66 - 22 + Ifelse(Teamside = 1, 0 , 140)
trigger1 = time % 6 = 1
value = 17626, 1
channel = 200
volume = -100

[state 120]
type =  AssertSpecial
trigger1 = screenpos X < 48 + 68 - 22  + Ifelse(Teamside = 1, 0 , 140)
trigger1 = time < 900
flag = intro




;=======================

;varのアジャスト
[state 17]
type = varset
trigger1 = var(31) >= 39 
var(31) = 1

[state 17]
type = varset
trigger1 =  var(31) <= 0 
var(31) = 38

[state 17]
type = varset
trigger1 = var(32) >= 39 
var(32) = 1

[state 17]
type = varset
trigger1 =  var(32) <= 0 
var(32) = 38

[state 17]
type = varset
trigger1 = var(33) >= 39 
var(33) = 1

[state 17]
type = varset
trigger1 =  var(33) <= 0 
var(33) = 38


[state 17]
type = destroySelf
trigger1 = Roundstate = 2 

;------------------

;特殊ゲージ
[statedef 4000]
type = S
movetype = I 
physics = N
anim = 9999
ctrl = 0

;テンションゲージの状態 
[state 4000, Explod] 
type = Explod
trigger1 = 1
anim = ifelse(root,var(50) = 0 , 1099 ,1100 + root,var(50))
ID = 10000
postype = left
pos = ifelse(teamside=1,35,285),235
facing = ifelse(teamside=1,1,-1)
bindtime = -1
IgnoreHitPause = 1
sprpriority = 8
ownpal = 1
supermovetime = 99999
pausemovetime = 99999

 ;テンションゲージの枠 
[state 4000, Explod]
type = Explod
trigger1 = numexplod(10001) = 0
anim = 1100
ID = 10001
ownpal = 1
pos = ifelse(teamside=1,35,285),235
postype = left
facing = ifelse(teamside=1,1,-1)
bindtime = -1
IgnoreHitPause = 1
removetime = -1
sprpriority = 7
supermovetime = 99999
pausemovetime = 99999

 ;シンクロゲージの枠
[state 4000, Explod]
type = Explod
trigger1 = numexplod(10002) = 0
anim = 1180
ownpal = 1
ID = 10002
pos = ifelse(teamside=1,5,315),235
postype = left
facing = ifelse(teamside=1,1,-1)
bindtime = -1
IgnoreHitPause = 1
removetime = -1
sprpriority = 7
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージのAI枠
[state 4000, Explod] 
type = Explod
trigger1 = numexplod(10101) = 0
ownpal = 1
anim = 10101
ID = 10101
pos = ifelse(teamside=1,5,315),235
postype = left
facing = ifelse(teamside=1,1,-1)
bindtime = -1
IgnoreHitPause = 1
removetime = -1
sprpriority = 998
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージのAI枠
[state 4000, Explod] 
type = Explod
trigger1 = numexplod(10102) = 0
trigger1 = Root,var(55) = 1 
ownpal = 1
anim = 10102
ID = 10102
pos = ifelse(teamside=1,5,315),235
postype = left
facing = ifelse(teamside=1,1,-1)
bindtime = -1
IgnoreHitPause = 1
removetime = -1
sprpriority = 999
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁 P1(1の桁)
[state 4000, Explod1] 
type = Explod
ownpal = 1
trigger1 = teamside = 1
anim = ifelse(root,var(53) != 300 , 1200 + root,var(53) % 10 , 1200 )
ID = 10003
postype = left
pos = ifelse(teamside=1,18,302),235
bindtime = -1
IgnoreHitPause = 1
sprpriority = 9
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁 P1(10の桁)
[state 4000, Explod2] 
type = Explod
trigger1 = teamside = 1
anim = ifelse(root,var(53) != 300 , 1200 + ( root,var(53) % 100 - root,var(53) % 10 ) / 10 , 1200 )
ID = 10004
postype = left
pos = ifelse(teamside=1,11,309),235
bindtime = -1
IgnoreHitPause = 1
sprpriority = 10
ownpal = 1
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁 P1(100の桁)
[state 4000, Explod3] 
type = Explod
trigger1 = teamside = 1
anim = ifelse(root,var(53) != 300 , 1200 + root,var(53) / 100, 1200 )
ID = 10005
postype = left
pos = ifelse(teamside=1,4,316),235
bindtime = -1
IgnoreHitPause = 1
sprpriority = 11
ownpal = 1
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁 P2(1の桁)
[state 4000, Explod1] 
type = Explod
trigger1 = teamside = 2
anim = ifelse(root,var(53) != 300 , 1200 + root,var(53) % 10 , 1200 )
ID = 10003
postype = left
pos = ifelse(teamside=1,4,316 - 25 ),235
bindtime = -1
IgnoreHitPause = 1
sprpriority = 9
ownpal = 1
supermovetime = 99999
pausemovetime = 99999

 ;シンクロゲージの桁 P1(10の桁)
[state 4000, Explod2]
type = Explod
trigger1 = teamside = 2
anim = ifelse(root,var(53) != 300 , 1200 + ( root,var(53) % 100 - root,var(53) % 10 ) / 10 , 1200 )
ID = 10004
postype = left
pos = ifelse(teamside=1,11,309-25),235
bindtime = -1
IgnoreHitPause = 1
ownpal = 1
sprpriority = 10
supermovetime = 99999
pausemovetime = 99999

;テンションゲージの桁 P2(100の桁)
[state 4000, Explod3] 
type = Explod
trigger1 = teamside = 2
anim = ifelse(root,var(53) != 300 , 1200 + root,var(53) / 100, 1200 )
ID = 10005
postype = left
pos = ifelse(teamside=1,18,302 - 25),235
bindtime = -1
IgnoreHitPause = 1
ownpal = 1
sprpriority = 11
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁MAX P1(1の桁)
[state 4000, Explod1] 
type = Explod
trigger1 = teamside = 1 && root,var(53) = 300
trigger1 = numexplod(10013) = 0 
anim = 1210
ID = 10013
postype = left
pos = ifelse(teamside=1,18,302),235
bindtime = -1
IgnoreHitPause = 1
ownpal = 1
removetime = -2
sprpriority = 10
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁MAX P1(10の桁)
[state 4000, Explod2] 
type = Explod
trigger1 = teamside = 1 && root,var(53) = 300
trigger1 = numexplod(10014) = 0 
anim = 1210
ID = 10014
postype = left
pos = ifelse(teamside=1,11,309),235
bindtime = -1
ownpal = 1
IgnoreHitPause = 1
removetime = -2
sprpriority = 11
supermovetime = 99999
pausemovetime = 99999

;テンションゲージの桁MAX P1(100の桁)
[state 4000, Explod3] 
type = Explod
trigger1 = teamside = 1 && root,var(53) = 300
trigger1 = numexplod(10015) = 0 
anim = 1210
ID = 10015
postype = left
pos = ifelse(teamside=1,4,316),235
bindtime = -1
IgnoreHitPause = 1
removetime = -2
ownpal = 1
sprpriority = 12
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージの桁MAX P2(1の桁)
[state 4000, Explod1] 
type = Explod
trigger1 = teamside = 2 && root,var(53) = 300
trigger1 = numexplod(10013) = 0 
anim = 1210
ID = 10013
postype = left
pos = ifelse(teamside=1,4,316 - 25 ),235
bindtime = -1
IgnoreHitPause = 1
ownpal = 1
removetime = -2
sprpriority = 10
supermovetime = 99999
pausemovetime = 99999

 ;シンクロゲージの桁MAX P2(10の桁)
[state 4000, Explod2]
type = Explod
trigger1 = teamside = 2 && root,var(53) = 300
trigger1 = numexplod(10014) = 0 
anim = 1210
ID = 10014
postype = left
pos = ifelse(teamside=1,11,309-25),235
bindtime = -1
ownpal = 1
IgnoreHitPause = 1
removetime = -2
sprpriority = 11
supermovetime = 99999
pausemovetime = 99999

 ;テンションゲージの桁MAX P2(100の桁)
[state 4000, Explod3]
type = Explod
trigger1 = teamside = 2 && root,var(53) = 300
trigger1 = numexplod(10015) = 0 
anim = 1210
ID = 10015
postype = left
pos = ifelse(teamside=1,18,302 - 25),235
ownpal = 1
bindtime = -1
IgnoreHitPause = 1
removetime = -2
sprpriority = 12
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージのゲージ
[state 4000, Explod] 
type = Explod
trigger1 = 1
anim = ifelse(root,var(53) != 300 , 1160 + root,var(53)/20 , 1175)  
ID = 10006
pos = ifelse(teamside=1,5,315),235
ownpal = 1
facing = ifelse(teamside=1,1,-1)
postype = left
bindtime = -1
IgnoreHitPause = 1
sprpriority = 20
supermovetime = 99999
pausemovetime = 99999

;シンクロゲージ・ハイパーモード
[state 4000, Explod]
type = Explod
trigger1 = time % 24 = 0 && root,var(54) = [1,3]
anim = 21100
ID = 21100
pos = ifelse(teamside=1,45,274),200
facing = ifelse(teamside=1,1,-1)
postype = left
ownpal = 1
bindtime = -1
removetime = 24
IgnoreHitPause = 1
sprpriority = 21
supermovetime = 99999
pausemovetime = 99999

;---------------------------------------

[Statedef 1516, しりもちやられ]
type=S
movetype=H
physics=N
ctrl=0

[State 1516]
type=ChangeAnim
Trigger1=Time=0
value=9847

[State 1516]
Type=NotHitBy
Trigger1=1
Value=SAC,NT,ST,HT,NA,SA,HA,NP,SP,HP
Time=1

[State 1516]
type=VelSet
trigger1=1
x=-4

[State 1516]
type=VelSet
trigger1=time>20
x=0

[State 1516]
type=changeState
trigger1=time>20
value=0
ctrl=1