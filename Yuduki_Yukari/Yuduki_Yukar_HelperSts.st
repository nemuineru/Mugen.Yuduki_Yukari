;車さんのすていたす
[statedef 1400]
type     = S
movetype = A
ctrl     = 0
poweradd= -500
anim     = 1401
sprpriority = 4

[state 1400]
type = NotHitBy
trigger1 = 1
value = SCA

[state 1400]
type = velAdd
trigger1 = 1
X = 0.2

[state 1400]
type = Afterimage
trigger1 = 1

[state 1400]
type = HitDef
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
attr = S, SP ;Standing Normal Projct
damage = 120,60
animtype = Heavy
guardflag = H
hitflag = MAFD
priority = 3, Hit
pausetime = 12, 10
sparkno = 0
sparkxy = -10, -76
hitsound = 5, 4
guardsound = 6, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -30,-10
Guard.Velocity = -3
airguard.velocity = -2,-0.5
air.type = Low
air.velocity = -30,-10
fall = 1
HitOnce = 1
air.hittime = 30


[State 1400, ヘルパーを消す]
type = DestroySelf
trigger1 =( pos X < -480 ||  pos X > 480 ) 

;Creeperさんのすていたす
[Statedef 1401]
type     = S
movetype = A
ctrl     = 0
poweradd= -500
anim     = 1242
sprpriority = 4

[state 1400 , 0]
type = NotHitBy
trigger1 = 1
value = SCA

[state 1400 , 1]
type = velset
trigger1 = Abs(P2Dist X) > 40 || Abs(P2Dist Y) > 5 
X = Ifelse(P2Dist X > 0 , 6 , -6)

[state 1400 , 3]
type = Changestate
trigger1 = time > 900
trigger2 = Abs(P2Dist X)  < 10 && Abs(P2Dist Y) < 3
value = 1402

;creeper爆発
[Statedef 1402]
type     = S
movetype = A
ctrl     = 0
velset = 0,0
poweradd= 0
anim     = 1243
sprpriority = 4

[state 400]
type = playsnd
trigger1 = time = 4
value = 20, (random % 4)
channel = 20

[state 1400 , 0]
type = NotHitBy
trigger1 = 1
value = SCA

[state 1400]
type = HitDef
trigger1 = movecontact = 0
attr = S, SP ;Standing Normal Projct
damage = 200,50
animtype = UP
hitflag = MAFD
AffectTeam = B
priority = 3, Hit
pausetime = 5,30
sparkno = s1052
sparkxy = -10, -76
guardsound = 6, 0
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = 0,-10
air.velocity = 0,-10
fall = 1
fall.recover = 1800
PalFX.Time = 24
PalFX.sinAdd = (240),(120),(120) , (4)


[state 1400]
type = explod
trigger1 = time > 3 && time % 2 = 0 && time < 40
anim = 1245
pos = 50 - random % 100, -( random % 120)
sprpriority = 400

[State 1400, ヘルパーを消す]
type = DestroySelf
trigger1 = time > 30

;-----------------
;弦巻マキ
[statedef 2280]
type     = S
movetype = I
ctrl     = 0
anim     = 2280
velset = 0,0
sprpriority = 0

[state 1400 , 0]
type = NotHitBy
trigger1 = 1
value = SCA

[state 11]
type = Turn
trigger1 = (RootDist X < 0)

[state 1400 , 3]
type = Changestate
trigger1 = Abs(RootDist X)  > 90 
value = 2281

[state 22]
type = changeState
trigger1 = root,command = "start"
trigger1 = roundstate = 2
value = 2283

;動く
[statedef 2281]
type     = S
movetype = I
ctrl     = 0
anim     = 2281
sprpriority = 0

[state 1400 , 1]
type = velset
trigger1 = Abs(RootDist X) > 20
X = Ifelse(RootDist X > 0 , 3 , -3)

[state 1400 , 3]
type = Changestate
trigger1 = time > 900
trigger2 = Abs(RootDist X)  < 20 
value = 2280

[state 11]
type = Turn
trigger1 = (RootDist X < 0)

[state 22]
type = changeState
trigger1 = root,command = "start"
trigger1 = roundstate = 2
value = 2283

;ヒサツわざ　グレーとエレキファイアー
[statedef 2283]
type = U
movetype = A
ctrl = 0
anim = 2283

[state 1]
type = gravity
trigger1 = pos Y < 0

[state 2]
type = posset
trigger1 = pos Y > 0
Y = 0

[state 3]
type = velset
trigger1 = AnimElemTime(3) = 0
Y = -13

[state 4]
type = Superpause
trigger1 = vel Y > 0
trigger1 = AnimElemTime(3) > 0
persistent = 0
poweradd = -1000
time = 15

[state 5]
type = ChangeState
trigger1  = pos Y = 0
trigger1 = AnimElemTime(3) > 0
value = 2284

;業終わり
[statedef 2284]
type = U
movetype = A
anim = 2284
ctrl = 0
velset = 0,0

[state 2]
type = posset
trigger1 = pos Y = !0
Y = 0

[state 3]
type = projectile
trigger1 = animelemtime(1) = 0
Attr = S,HP
HitFlag = MAFD
PauseTime = 4,6
Ground.HitTime = 30
Air.Hittime = 30 
projanim = 2285
projID = 2285
Velocity = 3,0
projHits = 8
projMisstime = 2
Ground.Velocity = -2,-2
Air.Velocity = -2,-2
Fall = 1
Fall.Recover = 0
Animtype = DiagUp
offset = 30,-2
damage = 40,20

[state 4]
type = changestate
trigger1 = animtime = 0
value = 2280





