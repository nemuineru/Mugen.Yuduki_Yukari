;--------------------------------------------------------------------------
;通常攻撃
;--------------------------------------------------------------------------

;弱チョップ
[Statedef 201]
type    = S
movetype= A
physics = S
juggle  = 1
hitcountpersist = 1
velset = 0.2,0
ctrl = 0
anim = 201
poweradd = 20
sprpriority = 2
facep2 = 1

[State 201, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 1, 3
volume = 200

[State 201, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 5, 1
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 6, 8
sparkno = s1050
sparkxy = -10, -76
hitsound = s50 , 0
guardsound = 6, 0
ground.type = High
ground.slidetime = 2
ground.hittime  = 3
ground.velocity = -2.0,0
air.velocity = -3.0,0.1
air.type = High
fall = 0
air.hittime = 12

[State 201, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------------

;ヤクザキック
[Statedef 203]
type    = S
movetype= A
physics = S
juggle  = 10
velset = 5,0
hitcountpersist = 1
ctrl = 0
anim = 203
poweradd = 20
sprpriority = 2
facep2 = 1

[State 203, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 0

[State 203, ヒット定義]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 38, 0
animtype = medium
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 3, 8
sparkno = s1051
sparkxy = -10, -76
hitsound = s50, 1
guardsound = 6, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 10
ground.velocity = -4
airguard.velocity = -4,-.8
air.type = High
fall = 1
air.velocity = -4,-3
air.hittime = 12

[State 203, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;チェーンソー。
[Statedef 204]
type    = S
movetype= A
physics = S
juggle  = 2
hitcountpersist = 1
velset = 6,0
ctrl = 0
anim = 204
poweradd = 20
sprpriority = 2
facep2 = 1

[State 204, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 2

[State 204, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 1, 2
volume = 200

[State 204, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
channel = 5
value = 30, 5
volume = -100


[State 204, ヒット定義]
type = HitDef
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 21,12
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 2, 33
sparkno = s1052
sparkxy = -10, -76
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.slidetime = 2
ground.hittime  = 0
ground.velocity = -5,-3
airguard.velocity = -1,-0.8
air.type = Low
air.velocity = -4,-2
fall = 1
kill = 0
air.hittime = 2



[State 204, ヒット定義]
type = HitDef
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 22,6
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 6, 8
sparkno = s1053
sparkxy = -10, -76
hitsound = 5, 1
guardsound = 6, 0
ground.type = Low
ground.slidetime = 2
ground.hittime  = 0
ground.velocity = -5,-2
airguard.velocity = -0.8,-0.8
air.type = Low
air.velocity = -5,-2
fall = 1
kill = 1
air.hittime = 2

[State 204, ステート変更]
type = ChangeState
trigger1 = Time = 25
value = 0
ctrl = 1

;パン投げ
[statedef 280, Throw Bread]
type = S
movetype = A
physics = S
hitcountpersist = 1
poweradd = 20
velset = 0.1
anim = 280
ctrl = 0

[state 280]
type = projectile
Trigger1 = animelemtime(2) = 2
attr = S,NP
Hitflag = MAF
GuardFlag = MA
Animtype = Med
projID = 281
Projanim = 281
ProjHitAnim = 282
projshadow = 0,0,0             ;飛び道具の影の色合い（赤,緑,青）※現在影無し
projhits = 1                   ;飛び道具のヒット数（２以上なら多段ヒットになる）
projmisstime = 1               ;飛び道具の連続でヒットしない間隔　※projhitsが２以上の時のみ
projpriority = 5               ;飛び道具の攻撃優先度・相手のProjectileよりも高いと消しながら進む
projremovetime = -1            ;飛び道具の消えるまでの時間（フレーム）※-1なら当たるか画面外に出るまで消えない
Velocity = 3,-4
offset = 32,-40
pausetime = 5,8
Accel = 0, 0.2
Damage = 30,3
sparkno = s1051
sparkxy = 0,0
guard.sparkno = 40
hitsound = 5,3
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime = 16
ground.velocity = -6,0
air.velocity = -3,-4
air.juggle = 4 ;Projectileの場合はここで設定しないとヒットした時ジャグルが消費しない
envshake.time = 8
envshake.ampl = 6
envshake.freq = 100

[state 280]
type = changestate 
trigger1 = animelemtime(4) = 3
ctrl = 1
value = 0

;--------------------------------------------------------------------------
;つるはしストライク
[Statedef 250]
type    = A
movetype= A
physics = A
hitcountpersist = 1
juggle  = 3
poweradd= 20
ctrl = 0
anim = 250
sprpriority = 2

[State 250, Velocity]
type = veladd
trigger1 = Time = 1
X = 2
Y = -0.8

[State 250, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 2, 10
volume = 10000

[State 250, ヒット定義]
type = HitDef
trigger1 = Animelem = 2
trigger2 = Animelem = 3
attr = A, NA
Animtype = med
damage = 8,4
guardflag = HA
priority = 3
pausetime = 2,3
sparkno = s1050
sparkxy = -5,-35
hitsound   = 5,1
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -0.2,-1
air.velocity = -0.2,-2
guard.kill = 0

;エアーストライク
[Statedef 251]
type    = A
movetype= A
physics = A
hitcountpersist = 1
juggle  = 3
poweradd= 20
ctrl = 0
anim = 251
sprpriority = 2

[State 251, Velocity]
type = veladd
trigger1 = Time = 1
X = 5
Y = -0.8

[State 251, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 2, 5
volume = 10000

[State 251, ヒット定義]
type = HitDef
trigger1 = Animelem = 2
trigger2 = Animelem = 3
trigger3 = Animelem = 4
attr = A, NA
damage = 42,10
animtype = med
guardflag = HA
priority = 3
pausetime = 8,10
sparkno = s1051
sparkxy = -5,-35
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -4,-3
air.velocity = -4,-3


;-----------
;ヒップアタック
[Statedef 253]
type    = A
movetype= A
physics = A
juggle  = 3
hitcountpersist = 1
poweradd= 20
ctrl = 0
anim = 253
sprpriority = 2

[State 253, 空中で止まる]
type = velset
trigger1 = Time < 10
X = 0
Y = 0

[State 253, Velocity]
type = veladd
trigger1 = Time = 10
X = 8
Y = -2

[State 253, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 2, 3
volume = 10000

[State 253, ヒット定義]
type = HitDef
trigger1 = ( Animelem = 4 | Animelem = 5 )
attr = A, NA
damage = 24,5
Animtype = med
guardflag = HA
Hitflag = MAF
priority = 3
pausetime = 2,3
sparkno = s1050
sparkxy = -5,-35
hitsound   = 5,3
guardsound = 6,0
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -4,-2
air.velocity = -5,-2
Fall = 1
Air.Fall = 1
Fall.RecoverTime = 40
Down.Bounce = 1
Fall.XVelocity = -2
Fall.YVelocity = -5.0
guard.kill = 0
hitonce = 1

;-------------------------------------
;ショットガン
[Statedef 256]
type    = A
movetype= A
physics = A
juggle  = 3
poweradd= 20
ctrl = 0
hitcountpersist = 1
anim = 256
sprpriority = 3

[State 256, Velocity]
type = velset
trigger1 = Time = 12
X = -6
Y = -6

[State 256, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 8
value = 50, 20
volume = -200

[State 256, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit
value = 51, 1 
volume = 10000

[State 256, ヒット定義]
Type                       = Projectile
trigger1 = AnimelemTime(3) = 2
Attr                       = A,NP
HitFlag                    = MAF
GuardFlag                  = MA
AnimType                   = Heavy
Ground.Type                = Low
ProjID                     = 1256
ProjRemove                 = 1
ProjRemoveTime             = 400
ProjPriority               = 1
ProjHitAnim         =	1000
ProjremAnim	=	1000
ProjCancelAnim 	=	1000
ProjMissTime = 5
Velocity                   = 20  , 22.5 - (random % 2) * (random % 10) / 10  
accel = 0 , 0.1
Damage                     = 20 , 5
affectteam = E
GetPower                   = 40
guardsound = 6, 0
GivePower                  = 30
PauseTime                  = 4,5
sparkno = s1052
HitSound                   = s51, 1
volume = 1000
Priority                   = 4, H
Fall                       = 1
Ground.HitTime             = 3
Ground.SlideTime           = 3
Ground.Velocity            = -0.4,-0.2
Air.Velocity               = -0.4,-0.2
Guard.Velocity             = -0.3
Offset                     = 23 , -38
ProjAnim                   = 242

[State 256, ヒット定義]
Type                       = Projectile
trigger1 = AnimelemTime(3) = 3
Attr                       = A,NP
HitFlag                    = MAF
GuardFlag                  = MA
AnimType                   = Heavy
Ground.Type                = Low
ProjID                     = 1256
ProjRemove                 = 1
ProjRemoveTime             = 400
ProjPriority               = 1
ProjHitAnim         =	1000
ProjremAnim	=	1000
ProjCancelAnim 	=	1000
ProjMissTime = 5
Velocity                   = 20  , 22.5 - (random % 2) * (random % 10) / 10  
accel = 0 , 0.1
Damage                     = 30 , 5
guardsound = 6, 0
affectteam = E
GetPower                   = 40
GivePower                  = 30
PauseTime                  = 4,5
HitSound                   = s51, 1
sparkno = s1052
volume = 1000
Priority                   = 4, H
Fall                       = 1
Ground.HitTime             = 3
Ground.SlideTime           = 3
Ground.Velocity            = -0.4,-0.2
Air.Velocity               = -0.4,-0.2
Guard.Velocity             = -0.3
Offset                     = 23 , -38
ProjAnim                   = 242
[State 256, ヒット定義]
Type                       = Projectile
trigger1 = AnimelemTime(3) = 4
Attr                       = A,NP
HitFlag                    = MAF
GuardFlag                  = MA
AnimType                   = Heavy
Ground.Type                = Low
ProjID                     = 1256
ProjRemove                 = 1
ProjRemoveTime             = 400
ProjPriority               = 1
ProjHitAnim         =	1000
ProjremAnim	=	1000
ProjCancelAnim 	=	1000
ProjMissTime = 5
Velocity                   = 20  , 22.5 - (random % 2) * (random % 10) / 10  
accel = 0 , 0.1
Damage                     = 20 , 5
affectteam = E
GetPower                   = 40
GivePower                  = 30
PauseTime                  = 4,5
HitSound                   = s51, 1
volume = 1000
Priority                   = 4, H
Fall                       = 1
Ground.HitTime             = 3
sparkno = s1052
guardsound = 6, 0
Ground.SlideTime           = 3
Ground.Velocity            = -0.4,-0.2
Air.Velocity               = -0.4,-0.2
Guard.Velocity             = -0.3
Offset                     = 23 , -38
ProjAnim                   = 242

[State 256, ヒット定義]
Type                       = Projectile
trigger1 = AnimelemTime(3) = 5
Attr                       = A,NP
HitFlag                    = MAF
GuardFlag                  = MA
AnimType                   = Heavy
Ground.Type                = Low
ProjID                     = 1256
ProjRemove                 = 1
ProjRemoveTime             = 400
ProjPriority               = 1
ProjHitAnim         =   1052
ProjMissTime = 5
Velocity                   = 20  , 22.5 - (random % 2) * (random % 10) / 10  
accel = 0 , 0.1
Damage                     = 30 , 5
affectteam = E
GetPower                   = 40
GivePower                  = 30
PauseTime                  = 4,5
HitSound                   = s51, 1
volume = 1000
sparkno = s1052
Priority                   = 4, H
Fall                       = 1
guardsound = 6, 0
Ground.HitTime             = 3
Ground.SlideTime           = 3
Ground.Velocity            = -0.4,-0.2
Air.Velocity               = -0.4,-0.2
Guard.Velocity             = -0.3
Offset                     = 23 , -38
ProjAnim                   = 242

;--------------------------------------------------------------------------
;かがみチョップ
[Statedef 270]
type    = C
movetype= A
physics = S
juggle  = 1
velset = 0,0
hitcountpersist = 1
ctrl = 0
anim = 270
poweradd = 5
sprpriority = 2

[State 270, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 1, 3
volume = 10000

[State 270, ヒット定義]
type = HitDef
trigger1 = Animelem = 2
attr = C, NA  ;（Crouching, Normal Attack）
damage = 2, 1
animtype = Light
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 4, 8
sparkno = s1050
sparkxy = -10, -76
hitsound = 5, 0
guardsound = 6, 0
ground.type = Low
ground.slidetime = 2
ground.hittime  = 3
ground.velocity = -0.8,0.5
airguard.velocity = -0.1,0.5
fall = 0
air.velocity = -1.0,0.5
air.hittime = 2


[State 270, cont.]
type =ctrlset
trigger1 = time = 5
value = 1

[State 270, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Helper Striker：突き上げスピーカー
[statedef 271]
type    = C
movetype= A
physics = S
poweradd= 0
velset = 0.1,0
anim = 271
ctrl = 0
sprpriority = 2

[state 271, 物理的なキャラの幅]
type = Width
trigger1 = (AnimElemTime(2) >= 0) && (AnimElemTime(10) < 0)
player = 30,0 ;相手を押す幅を変える（黄緑の線）
edge = 48,0   ;画面端を押す幅を変える（オレンジの線）

[state 271,Helper]
type = helper
trigger1 = AnimElemTime(2) = 3
Persistent = 0
Name = "Block"
pos = 64,0
facing = 1
stateno = 1271
keyctrl = 1
ownpal = 0
size.xscale = 1
size.yscale = 1
ID = 1271

[state 271,元のステートに]
type = Changestate
trigger1 = time = 13
value = 11
ctrl = 1

;クレイモア置き
[statedef 240]
type    = C
movetype= A
physics = S
poweradd= 0
velset = 0.1,0
anim = 240
ctrl = 0
sprpriority = 3

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 1, 2
volume = 10000

[state 240, 物理的なキャラの幅]
type = Width
trigger1 = (AnimElemTime(2) >= 0) && (AnimElemTime(10) < 0)
player = 30,0 ;相手を押す幅を変える（黄緑の線）
edge = 48,0   ;画面端を押す幅を変える（オレンジの線）

[state 240,Helper]
type = helper
trigger1 = AnimElemTime(2) = 4
Persistent = 0
Name = "Claymore"
pos = 18,-30
facing = 1
stateno = 1240
keyctrl = 1
ownpal = 0
size.xscale = 1
size.yscale = 1
ID = 241

[state 240,元のステートに]
type = Changestate
trigger1 = time = 15
value = 11
ctrl = 1

;かがみツルハシ
[Statedef 272]
type    = C
movetype= A
hitcountpersist = 1
physics = S
juggle  = 3
poweradd= 20
ctrl = 0
anim = 272
sprpriority = 2

[State 272, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 1, 8
volume = 10000

[State 272, ヒット定義]
type = HitDef
trigger1 = Animelem = 1
trigger2 = Animelem = 2
trigger3 = Animelem = 3
attr = C, NA  ;（Crouching, Normal Attack）
Animtype = med
damage = 24,12
guardflag = L
priority = 3
pausetime = 2,3
sparkno = s1053
sparkxy = -5,-35
hitsound   = 5,1
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -1
air.velocity = -2.0,-1

[State 272, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;----------------
;クレイモアが飛んでる
[Statedef 1240]
type     = A
movetype = A
physics = N
ctrl     = 0
anim     = 241
sprpriority = 2

[state 1240]
type = NotHitBy
trigger1 = 1
value = SCA

[state 1240]
type = velset
trigger1 = time = 0
X = 2


[state 1240]
type = veladd
trigger1  = time > 1
Y = 0.2


[State 1240]
type = Changestate
trigger1 = Pos Y >= 0
value = 1241
ctrl = 0  

;----------------------
;クレイモア
[Statedef 1241]
type     = S
movetype = A
physics = S
velset = 0,0
ctrl     = 0
anim     = 241
sprpriority = 2

[state ]
type = AssertSpecial
trigger1= var(10) < 1
Flag = UnGuardable

[State ****, AttackDist]
type = AttackDist
trigger1 = var(10) < 1
value = 1

[state 1241 , Switch]
Type = varset
triggerall = var(10) < 1
Trigger1 = Command = "ExplosiveSwitch"
Trigger2 = time = 200
v = 10
Value = 1

[state 1241 , var]
Type = varadd
trigger1= var(10) >= 1
v = 10
Value = 1

[state ]
type = playsnd
trigger1 = time = 0
value = 51, 0

[state 1241, Projectile]
Type                       = Projectile
trigger1 = var(10) >= 1 && var(10) <= 11
Attr                       = S,NP
HitFlag                    = MAF
GuardFlag                  = MA
AnimType                   = medium
Ground.Type                = High
ProjID                     = 1241
ProjRemove                 = 1
ProjRemoveTime             = 400
ProjPriority               = 1
ProjHitAnim                = 1000
Velocity                   = 20  , -4 + (random % 5) 
accel = 0 , 0.1
Damage                     = 5 , 5
affectteam = B
GetPower                   = 40
GivePower                  = 30
guardsound = 6, 0
PauseTime                  = 0,5
HitSound                   = s51,7
sparkno		= s1000
Priority                   = 4, H
Fall                       = 0
Ground.HitTime             = 3
Ground.SlideTime           = 3
Ground.Velocity            = -0.4,-0.2
Air.Velocity               = -0.4,-0.2
fall = 1
Guard.Velocity             = -0.3
Offset                     = 5, 10 + (random % 5)
ProjAnim                   = 242


[State 1241, Effect]
type = Explod
trigger1 = var(10) = 2
anim = 1000
pos = 0 , 0
scale = 1,1
sprpriority = 3
ID = 1000

[State 1241, ヘルパーを消す]
type = DestroySelf
trigger1 = var(10) = 11

[state 1241]
type = VarSet
trigger1 = var(10) >= 11
V = 10
value = 0

[state 1241]
type = VarSet
trigger1 = var(10) = 11
V = 10
value = 0

;スピーカーさんのすていたす
[Statedef 1271]
type     = S
movetype = A
ctrl     = 0
anim     = 1271
sprpriority = 1

[state 1271]
type = NotHitBy
trigger1 = 1
value = SCA

[state 1271]

type = velset
trigger1  = time < 16
X = 0.05

[state 1271]
type = Afterimage
trigger1 = 1

[state 1271]
type = HitDef
trigger1 = time % 3 = 2
trigger1 = hitcount < 4
trigger1 = Enemy,gethitvar(hitcount) < 20 
attr = C, NA 
damage = 8,5
animtype = UP
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 6, 2
sparkno = s1052
sparkxy = -10, -76
hitsound = 5, 3
guardsound = 6, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -0.1,-2
airguard.velocity = -2,-0.5
air.type = Low
air.velocity = -0.1,-2

[state 1271]
type = HitDef
trigger1 = hitcount >= 4 && hitcount < 5
trigger1 = Enemy,gethitvar(hitcount) < 20
attr = C, NA 
damage = 40,10
animtype = UP
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 14, 18
sparkno = s1051
sparkxy = -10, -76
hitsound = 5,4
guardsound = 6, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -2,-13
airguard.velocity = -2,-0.5
air.type = Low
air.velocity = -2,-13
fall = 1
air.hittime = 30

[State 1271, Pallet FX]
type = palfx
trigger1 = time > 16
Mul = time*18 ,time*18 , time*18

[State 1271, ヘルパーを消す]
type = DestroySelf
trigger1 = time > 60 
trigger1 = root,StateNo != 420

[state 1271, 追加攻撃]
type = Explod
trigger1 = root,StateNo = 420
trigger1 = root,time = 47
anim = 1001
pos = 60, -40




