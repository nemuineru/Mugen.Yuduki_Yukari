;ズッコケチェーンソー スタート
[statedef 215] 
type = S
movetype = A
physics  = S
juggle  = 2
poweradd= 20
ctrl = 0
anim = 215
velset = -0.6,0
sprpriority = 2

[State 215, ヒット定義]
type = HitDef
trigger1 = time % 8 = 1
attr = S, SA
damage = 6,3
guardflag = H
Hitflag = MAF
priority = 3
pausetime = 4,8
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -2
air.velocity = -2,-1
Fall.RecoverTime = 40
guard.kill = 0

[state ]
type =  veladd
trigger1 = time = 29
Y = -4
X = 12


[state ,]
type = Changestate
trigger1 = AnimTime = 0
value = 216

;ズッコケチェーンソー 空中
[statedef 216] 
type = A
movetype = A
physics  = N
juggle  = 2
hitcountpersist = 1
poweradd= 20
ctrl = 0
anim = 216
sprpriority = 2

[state ]
type = gravity
trigger1 = 1

[State 216, ヒット定義]
type = HitDef
trigger1 = time > 4 && time % 10 = 1
attr = S, SA
damage = 10,3
guardflag = HA
Hitflag = MAF
priority = 3
pausetime = 5,8
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,2
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -2,-3
air.velocity = -2,-2
Fall.RecoverTime = 20
guard.kill = 0
fall = 0


[state ,]
type = Changestate
trigger1 = Pos Y > 0
value = 217

[state ]
type = Posset
trigger1 = pos Y > 0
y = 0

[state ]
type = velset
trigger1 = pos Y > 0
y = 0

;ズッコケチェーンソー 攻撃中
[statedef 217]
type = S
movetype = A
physics  = S
hitcountpersist = 1
juggle  = 2
poweradd= 20
ctrl = 0
anim = 217
sprpriority = 2



[state ]
type = MakeDust
trigger1 = 1
pos = -0,0

[state ]
type = playsnd
trigger1 = time = 0
value = 51,10
channel = 90
volume = 1000

[state ]
type = velset
trigger1 = vel Y > 0
y = 0

[state ]
type = veladd
trigger1 = vel Y = 0
x = 5
persistent = 0

[state ]
type = Posset
trigger1 = pos Y > 0
y = 0

[State 217, ヒット定義]
type = HitDef
trigger1 = time % 4 = 1
attr = S, SA
damage = 12,3
guardflag = HA
Hitflag = MAFD
priority = 3
pausetime = 6,9
sparkno = 2
sparkxy = -5,-35
hitsound   = 5,3
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -3,-2
air.velocity = -3,-1
Fall.RecoverTime = 90
guard.kill = 0
fall = 1

[state ,]
type = Changestate
trigger1 = Vel X = 0
value = 218

;ズッコケチェーンソー 終わり
[statedef 218]
type = C
movetype = A
hitcountpersist = 1
physics  = S
juggle  = 2
poweradd= 20
ctrl = 0
anim = 218
sprpriority = 2

[State 217, ヒット定義]
type = HitDef
trigger1 = time % 10 = 1
attr = S, SA
damage = 5,3
guardflag = HA
Hitflag = MAFD
priority = 3
pausetime = 5,9
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,2
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -4,-2
air.velocity = -4,-1
Fall.RecoverTime = 40
guard.kill = 0
fall = 1

[state ,]
type = Changestate
trigger1 = Animtime = 0
value = 0
Ctrl = 1

;--------------------------------

;ポセイドン式ヌケボー
[Statedef 220]
type     = S
movetype = A
physics  = A
juggle  = 3
poweradd= 20
ctrl = 0
anim = 220
velset = 2,-5
sprpriority = 2

[State 220, Velocity]
type = veladd
trigger1 = Time = 8
X = 25
Y = -5

[State 220, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 0

[State 220, ヒット定義]
type = HitDef
trigger1 = time > 8
attr = S, SA
damage = 80,5
guardflag = HA
Hitflag = MAF
priority = 3
pausetime = 20,20
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -10,-2
air.velocity = -10,-2
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 40
guard.kill = 0
hitonce = 1

[state 236, varadd]
type = varadd
trigger1 = Movehit
var(50) = 3

[state 221,　自爆ダメージ]
type = LifeAdd
trigger1 = ( MoveGuarded || Movehit ) = 1
value = -40

[State 220, ヒット定義]
type = Changestate
trigger1 = ( MoveGuarded || Movehit )= 1
value = 221

;---------

;攻撃ヒット時
[Statedef 221]
type     = A
movetype = A
physics  = A
juggle  = 3
poweradd= 20
ctrl = 0
anim = 221
velset = -2,-8
sprpriority = 2

[state 221 , アニメーション表示]
type = Explod
trigger1 = time = 1
anim = 1221
postype = p2
Pos = 0,-40
Angle = 20*time

[state 221 , var(11) 自爆技セット]
type = Varset
trigger1 = time = 1
var(11) = 1

[state 221 , ヤラレに移動]
type = Changestate
trigger1 = Vel Y > 0.2
value = 5035



;チェンソー昇竜。
[Statedef 235]
type    = S
movetype= A
physics = S
juggle  = 2
velset = 3,0
ctrl = 0
anim = 235
hitcountpersist = 1
poweradd = 20
sprpriority = 2
facep2 = 1

[State 235, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 2

[State 235, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
attr = S, SA ;立ち通常打撃（Standing, Normal Attack）
damage = 32,12
animtype = Med
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 4, 12
sparkno = 0
sparkxy = -10, -76
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.slidetime = 2
ground.hittime  = 0
ground.velocity = 0,0
airguard.velocity = -0.8,-0.8
air.type = Low
air.velocity = -0.8,-1
fall = 0
kill = 0
air.hittime = 2

[State 235, ステート変更]
type = ChangeState
trigger1 = Time = 18
value = 236
ctrl = 0

;-------------------------
;チェンソー昇竜本体。
[Statedef 236]
type    = A
movetype= A
physics = A
hitcountpersist = 1
juggle  = 4
poweradd= 110
velset = 1,-8
anim = 236
ctrl = 0
sprpriority = 2

[State 236, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(13) < 0
value = 5,0

[State 236, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 2

[State 236, ヒット定義]
type = HitDef
trigger1 = time % 2 = 0
trigger1 = time < 13
attr = A, SA
animtype  = Med
damage    = 4,2
priority  = 5
guardflag = L
pausetime = 10,8
sparkxy = 0,-48
hitsound   = s30,5
guardsound = 6,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 18
ground.velocity = -1, -6
guard.velocity = -3
air.velocity = -0.1 ,-4
airguard.velocity = -4,-4.5
p2facing = 1
forcestand = 1 ;攻撃を当てた相手を強制的に「立ち状態」にする

[State 236, ヒット定義]
type = HitDef
trigger1 = AnimElem = 5
attr = A, SA
animtype  = Up ;相手のアニメが『垂直吹っ飛び』になる（相手のairに[Begin Action 5051]がある場合）
damage    = 45, 14
priority  = 5
guardflag = L
pausetime = 12,12
sparkxy = 0,-110
hitsound   = 5,4
guardsound = 6,0
ground.type = Low
ground.slidetime = 15
ground.hittime  = 18
ground.velocity = -1,-9.5
guard.velocity = -4
air.velocity = -1,-7.5
airguard.velocity = -4,-4.5
p2facing = 1
fall = 1               ;相手は「ダウン状態」に
fall.recovertime = 160  ;相手は「４０フレームの間空中受け身が出来ない」
yaccel =  0.6           ;相手のＹ軸方向の移動速度を「0.4ポイント」ずつ増やしていく


;--------------------
;光魔法　かっこいいポーズ(いわゆる阿修羅閃空みたいなもん)
[statedef 300]
type = S
movetype = I
physics = N
juggle = 0
poweradd = 10
hitcountpersist = 1
velset = Vel X * 2.5,Vel Y * 0.5
anim = 300
ctrl = 0

[state accel]
type = velAdd
trigger1 = Abs(Vel X) != 0
X = Ifelse(Vel X > 0, -0.05 , 0.05)

[state sound]
type = playsnd
trigger1 = time = 3
value = 300,0

[state ]
type = gravity
triggerall = !(pos Y >=0 && vel Y > 0) && AnimElemTIme(6) > 0 
trigger1 = pos y < 0

[state accel]
type = veladd
triggerall = !(pos Y >=0 && vel Y > 0) && AnimElemTIme(6) < 0 
trigger1 = pos y < 0
Y = Ifelse(Vel Y > 0, -0.01 , 0.01)

[state pos]
type = posset
trigger1 = pos y > 0
Y = 0

[State -2, After Image V3]
Type = AfterImage
trigger1 = AnimElemTIme(3) = 0
Time = 2
length = 8
framegap = 2
PalBright = 100,14,18
PalPostBright = 0,0,0
Paladd = 40,10,20

[State -2, After Image V3]
Type = AfterImageTime
trigger1 = AnimElemTIme(5) < 0 
Time = 4
Ignorehitpause = 1

[state 301]
type = ctrlSet
trigger1 = AnimElemTime(7) = 1
value = 1

[state 301]
type = statetypeset
trigger1 = AnimElemTime(7) = 1
statetype = A 

[state reset]
type = changestate
trigger1 = pos Y = 0 && AnimElemTime(7) = 1
value = 0
ctrl = 1

;----------------------------
;R700スナイピング
[statedef 301]
type = S
movetype = A
physics = S
juggle = 0
poweradd = 10
hitcountpersist = 1
velset = -0.1,0
anim = 301
ctrl = 0

[state 301]
type = varadd
trigger1 = time = 0
var(50) = -4 + var(54)*2

[state 301, playsnd]
type = playsnd
trigger1 = time = 5
value = 51,9

[state 301]
type = Projectile
trigger1 = time = 6 
attr = S, SP
damage = 30
getpower = 30
animtype = Hard
pausetime = 0,12
offset = 40,-52
velocity = 40,0
projID = 302
projanim = 302
projscale = 0.5,0.5
projshadow = 0,0,0
projhits = 1
projmisstime = 1
projpriority = 1
projremovetime = -1
guard.Dist = 0
guardflag = MA 
priority = 3
sparkno = 2
sparkxy = 0,0
guard.sparkno = 40
hitsound = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
guard.hittime  = 15
guard.ctrltime = 15
ground.velocity = -1,0
guard.hittime = 0
air.velocity = -1.0,-.2
air.juggle = 1
envshake.time = 4
envshake.ampl = 3
envshake.freq = 100

[state 301,元のステートに]
type = Changestate
trigger1 = time = Ifelse( 0 < 40 - var(54)*20 ,40 - var(54)*20 , 1 ) 
value = 0
ctrl = 1


;------------


;トルネード
[Statedef 350]
type     = S
movetype = A
physics  = N
juggle  = 15
poweradd= 10
hitcountpersist = 1
ctrl = 0
anim = 350
velset = 0,0
sprpriority = 2

[state 350,Velset]
type = veladd
trigger1 = time < 64
trigger1 = var(55) != 1
trigger1 = command = "prsfwd"
x = 0.2

[state 350,Velset]
type = veladd
trigger1 = time < 64
trigger1 = var(55) != 1
trigger1 = command = "prsback"
x = -0.2


[state 350,Velset AI]
type = veladd
trigger1 = time < 64
trigger1 = var(55) = 1
trigger1 = Abs(P2Dist X) > 20
trigger1 = P2Dist X < 0
x = -0.2

[state 350,Velset AI]
type = veladd
trigger1 = time < 64
trigger1 = var(55) = 1
trigger1 = Abs(P2Dist X) > 20
trigger1 = P2Dist X > 0
x = 0.2

[state 350,Velset]
type = varadd
trigger1 = time = 1
trigger1 = var(54) =! 1
var(50) = -8

[state 350,Varset]
type = varadd
trigger1 = time = 1
trigger1 = var(54) = 1
var(50) = -6


[state 350.徐々に止まる]
type = velset
trigger1 = time > 64
x = Vel X / 3

[State 350, HitDef]
type = HitDef
trigger1 = time % 3 = 0
attr = S,SA        ;SCA,SA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
;affectteam = E          ;B,E,F
animtype = hard          ;light,medium,hard,back,up,diagup
air.animtype = hard
;fall.animtype = Back
priority = 4,Hit
damage = 2,1
pausetime =  5 - var(54)* 2,4
;guard.pausetime = 0,0
sparkno = 2
sparkxy = 10,-48
hitsound = 5,3
guardsound = 6,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 3
ground.hittime = 5
air.hittime = 6
ground.velocity = -2,-2
air.velocity = -1,-2
fall = 1
id = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 0
getpower = 20,5
givepower = 10,0
palfx.time = 0
envshake.time = 0

[State 350, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 64
value = 351
ignorehitpause = 0

[state 350]
type = Changestate
trigger1 = AnimTime = 0
trigger1 = Anim = 351
value = 0
ignorehitpause = 0
ctrl = 1

;-----------

;サマーソルトキック
[statedef 352]
type = A
movetype = A
physics = A
juggle = 2
poweradd
hitcountpersist = 1
ctrl = 0
anim = 252

[state 352]
type = veladd
trigger1 = time = 0
X = -0.5
Y = -2

[state ]
type = playsnd
trigger1 = time = 0
value = 51,3

[state 352]
type = hitdef
trigger1 = Movecontact =! 1
attr = A, SA
animtype  = Up
damage    = 80 + var(54)* 30, 10 + var(54)* 30
priority  = 5
guardflag = L
pausetime = 13,1
sparkxy = 0,-48
hitsound   = s50,1
guardsound = 6,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 18
ground.velocity = -2, -8
guard.velocity = -3
air.velocity = -2 ,-9
airguard.velocity = -4,-4.5
p2facing = 1
fall = 1
fall.recover = 45 
hitonce = 1

;グレードアップバージョン
[statedef 353]
type = A
movetype = A
physics = A
juggle = 2
poweradd
hitcountpersist = 1
ctrl = 0
anim = 252

[state 352]
type = veladd
trigger1 = time = 0
X = -0.5
Y = -2

[state ]
type = playsnd
trigger1 = time = 0
value = 51,3

[state 352]
type = hitdef
trigger1 = Movecontact =! 1
attr = A, SA
animtype  = Up
damage    = 80 + var(54)* 30, 10 + var(54)* 30
priority  = 5
guardflag = L
pausetime = 13,1
sparkxy = 0,-48
hitsound   = s50,1
guardsound = 6,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 18
ground.velocity = -2, -8
guard.velocity = -3
air.velocity = -2 ,-9
airguard.velocity = -4,-4.5
p2facing = 1
fall = 1
fall.recover = 45 
hitonce = 1

;--------------------------------------------------------------------------
;===================================特殊格闘================================
;--------------------------------------------------------------------------

;Helper Striker：ロケットリーグ
[statedef 401]
type    = S
movetype= A
physics = S
velset = 0.1,0
anim = 401
ctrl = 0
sprpriority = 2

[state 401,Helper]
type = helper
trigger1 = AnimElemTime(2) = 3
Persistent = 0
name = "RL"
pos = -240,0
facing = 1
stateno = 1400
keyctrl = 1
ownpal = 0
size.xscale = 1
size.yscale = 1
ID = 1401

[state 401,元のステートに]
type = Changestate
trigger1 = time = 30
value = 0
ctrl = 1
;----------------


;Helper Striker:Creeper
[statedef 402]
type    = S
movetype= A
physics = S
velset = 0.1,0
anim = 402
ctrl = 0
sprpriority = 2

[state 401,Helper]
type = helper
trigger1 = AnimElemTime(2) = 3
Persistent = 0
name = "Creeper"
pos = -240,0
facing = 1
stateno = 1401
keyctrl = 0
ownpal = 1
size.xscale = 1
size.yscale = 1
ID = 1401

[state 401,元のステートに]
type = Changestate
trigger1 = time = 30
value = 0
ctrl = 1

;----------------

;スパイラッDDT
[statedef 410]
type     = A
movetype = A
Physics = A
ctrl     = 0
poweradd = 100
anim     = 405
sprpriority = 4

[state 410]
type = hitdef
trigger1 = Enemynear,stateno != 415
attr = A, ST ;空Super投げ（Air, Throw）
hitflag = MA 
priority = 4, Hit
sparkno = -1  ;-1だからヒットスパークは表示しない
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 411
p2stateno = 415

;================
;投げスタート
[statedef 411]
type     = A
movetype = A
Physics = N
ctrl     = 0
poweradd = 100
anim     = 406
velset = 0,0
SprPriority = 0

[state 411]
type = targetbind
trigger1 = animElemTime(3) < 0 
pos = 5, -51

[state 411]
type = sprPriority
trigger1 = animElemTime(3) = 0
value = 2

[state 411]
type = targetbind
trigger1 = animElemTime(3) > 0 
pos = 0, -51

[state 411]
type = Changestate
trigger1 = time = 30
value = 412
ctrl = 0

;=====

;投げ中
[statedef 412] 
type     = S
movetype = A
Physics = N
ctrl     = 0
poweradd = 100
anim     = 407
SprPriority = 2

[state 412, velocity]
type = veladd
trigger1 = time = 0
X = 3

[State 412, gravity]
Type = gravity
Trigger1 = 1

[state 412, targetbind]
type = targetBind
trigger1 = 1
pos = 0,0

[state 412, changestate]
type = changestate
trigger1 = pos Y > 0
ctrl = 0
value = 413

;=====

;投げおわり
[statedef 413] 
type     = S
movetype = A
Physics = N
ctrl     = 0
poweradd = 100
anim     = 408
velset = 0,0
SprPriority = 2

[State 253, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 2, 11
volume = 10000

[state 412]
type = EnvShake
trigger1 = time = 0
Time = 4
Freq = 180
Ampl = 6

[state 412]
type = EnvShake
trigger1 = time = 5
Time = 4
Freq = 180
Ampl = 4

[state 412]
type = EnvShake
trigger1 = time = 9
Time = 4
Freq = 180
Ampl = 2

[state 412, targetbind]
type = targetBind
trigger1 = time < 3
pos = -20,0

[state 413]
type = posSet
trigger1 = pos Y > 0
Y = 0

[state 415]
type = playsnd 
trigger1 = time = 0
value = 51,2
volume = 10000

[state 413, changestate]
type = changestate
trigger1 = AnimElemTime(4) = 0
ctrl = 1
value = 0

;=====

;相手
[statedef 415]
type    = A
movetype= H
physics = N
velset = 0,0

[State 415, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 1405

[state 412, damage]
type = lifeAdd
trigger1 = pos Y >= 0 && vel Y > 0
value = -25 * ( 1  + ( Enemynear,Vel Y / 1.5 + Enemynear,Vel X / 1.5 + Enemynear,var(54)*2 ) )
persistent = 0  

[State 415, アニメをやられにする]
type = ChangeAnim
trigger1 = pos Y = 0
value = 5110

[state 415]
type = posset
trigger1 = pos Y >=0 && vel Y > 0
Y = 0

[state 415]
type = velset
trigger1 = pos Y >=0 && vel Y > 0
trigger2 = pos Y = 0
Y = 0

[state 415, 相手のステートに戻す]
type = selfstate
trigger1 = pos Y = 0
trigger1 = life >= 1
trigger1 = Time > 13+21+73+ (100*(1 - ( Life / LifeMax ) ))
trigger2 = time > 300
value = 5120

[state 415, 相手のステートに戻す]
type = selfstate
trigger1 = pos Y = 0 && vel Y = 0
trigger1 = life = 0
value = 5150


;--------------


;サウンドアップ(コンボテンションゲージ 消費 LV1 - ALL)
[statedef 420]
type = S
movetype = H
physics  = N
juggle  = 0
poweradd= 10
hitcountpersist = 1
ctrl = 0
anim = 310
velset = 0,0
sprpriority = 2

[state ]
type = Playsnd
trigger1 = movecontact = 1
value = 60,0
persistent = 0

[state ]
type = explod
trigger1 = time = 47
anim = 1010
postype = p1
pos = 0 , -40

[state , pt12-23の時]
type = Hitdef
trigger1 = var(50) > 0 && var(50) < 12
AnimType = Up
attr = S, SA
damage = 10, 5
guardflag = H
Hitflag = MA
priority = 3
pausetime = 3,15
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -10,-10
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 80


[state , pt12-23の時]
type = Hitdef
trigger1 = var(50) > 11 && var(50) < 23
AnimType = Up
attr = S, SA
damage = 60, 30 
guardflag = H
Hitflag = MA
priority = 3
pausetime = 3,15
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -10,-10
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 80

[state , pt24の時]
type = Hitdef
trigger1 = var(50) = 23
trigger2 = NumHelper(1271) = 1 && (var(50) > 16 && var(50) < 23)
AnimType = Up
attr = S, SA
damage = 100 
Hitflag = MA
guardflag = H
priority = 3
pausetime = 1,60
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -17,-17
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 999990
guard.kill = 1
hitonce = 1

[state , pt24の時(スピーカー付き)]
type = Hitdef
trigger1 = var(50) = 23
trigger1 = NumHelper(1271) = 1 
AnimType = Up
attr = S, SA
damage = 55 
Hitflag = MAF
priority = 3
pausetime = 10,100
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -20,-17
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 999990
guard.kill = 1
hitonce = 1

[state -2, Varset - 最大値]
type = varset
trigger1 = time = 50
trigger1 = var(54) =! 1
var(50) = -1 

[state ]
type = gravity
trigger1 = pos Y < 0
trigger1 = time > 77

[state ]
type = velset
trigger1 = pos Y > -1
trigger1 = time > 77
Y = 0

[state ]
type = posset
trigger1 = pos Y > 0
Y = 0

[state ]
type = Changestate
trigger1 = pos Y > -5
trigger1 = time > 95
trigger2 = Alive = 0
ctrl = 1
value = 0 


;=====================

;ハイパーモード起動
[statedef 700]
type = S
movetype = A
ctrl = 0
anim = 700
sprpriority = 3

[State 201, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 51, 6
volume = 500

[state ]
type = pause
trigger1 = time = 0
time = 10
movetime = 10

[state ]
type = velset
trigger1 = time < 45
X = 0
Y = 0

[state -2]
type = Explod
trigger1 = NumExplod(22203) = 0
trigger1 = var(54) = 1
ID = 22203
Anim = 22203
postype = p1
Pos = 0,-30
Persistent = 0
IgnoreHitpause = 1
removetime = 10000

[state ]
type = Hitdef
trigger1 = time % 10 = 0
AnimType = light
attr = S, SA
damage = 0 , 0 
Hitflag = MA
priority = 3
pausetime = 20,20
sparkno = 3
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -5,-5
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 400
hitonce = 1

[state ]
type = gravity
trigger1 = pos Y < -1
trigger1 = time > 45

[state ]
type = velset
trigger1 = pos Y > -1
trigger1 = time > 45
X = 0


[state ]
type = posset
trigger1 = pos Y > -1
Y = 0

[state ]
type = Changestate
trigger1 = pos Y > -5
trigger1 = time > 45
ctrl = 1
value = 0 


;---------------------------------------------------------------------------
; こっちは制御を奪った相手の食らいステート。
; 相手の制御を解く場合、「ChangeState」のコントローラにしてしまうと
;「相手が制御を奪われた状態のままになるバグ」が発生してしまう。
; なので必ず『SelfState』で相手のステートに戻し、制御を解除しないといけない。
; そこさえ注意しておけば、自由に相手の食らいモーションを設定出来る。
;
; デバッグ表示中に相手の情報の一部の文字が黄色になったら、それが
; P2StateNoやTargetStateで制御を奪われた状態の証。
; 投げが成功したらCtrl+Dで相手側の情報を確認だ！m9っ｀Д´)
;---------------------------------------------------------------------------


