;-------------------
;Extremeワザ
;-------------------

;結月,抜刀(NotCounter)
[statedef 3500]
type = S
movetype = A
physics = S
anim = 500
hitcountpersist = 0
ctrl = 0
sprpriority = 4

;必殺を出す時出て来る顔アップ。
[state ]
type = Explod
trigger1 = time = 1
anim = 691 
supermovetime = -1
PosType = left
Facing = facing

[State , player push]
Type = PlayerPush
Trigger1 = 1
Value = 0

[state ]
type = velset
trigger1 = time = 14
x = 20

[state 3500, sound]
type = playSnd
trigger1 = time = 0
volume = 4
channel = 10
value = 1,9

[State 3500, Effect]
type = Explod
trigger1 = time = 0
supermovetime = -1
anim = 1003
postype = p1
pos = 0 , 0
scale = 0.5,0.5
sprpriority = 5
ID = 1003

[state 3500]
type = superpause
trigger1 = time = 1
sound = 20 , 0 
poweradd = -1000
pos = 0, 0 
Time = 30
Darken = 1
poweradd = 0
P2DefMul = 1

[State 3500, ヒット定義]
type = HitDef
trigger1 = UniqHitCount = 0
trigger1 = MoveContact = 0
animtype = up
attr = A, HA  ;（standing, Hyper Attack）
Hitflag = MAFD
Guardflag = L
damage = 150
priority = 5
pausetime = 20,100
sparkno = -1 
hitsound   = s500,0
guardsound = 6,0
EnvShake.Time              = 32
EnvShake.Ampl              = 5
EnvShake.Phase             = 5
EnvShake.Freq              = 5
ground.type = High
ground.slidetime = 4
ground.hittime  = 6
ground.velocity = -1,-0
air.velocity = -1,-0
hitonce = 1
fall = 1
fall.recover = 160

[state 3500]
type = posset
trigger1 = pos Y > 0
Y = 0

[state 3500]
type = changestate
trigger1 = time = 60
value = 0
ctrl = 1



;結月,抜刀(Counter)
[statedef 3501]
type = S
movetype = H
physics = S
anim = 500
hitcountpersist = 0
ctrl = 0
sprpriority = 4

[state ]
type = Explod
trigger1 = time = 1
anim = 691 
supermovetime = -1
PosType = left
Facing = facing

[state ]
type = velset
trigger1 = time = 14
x = 20

[State , player push]
Type = PlayerPush
Trigger1 = 1
Value = 0

[state 3500, sound]
type = playSnd
trigger1 = time = 0
volume = 4
channel = 10
value = 1,9


[State 3500, Effect]
type = Explod
trigger1 = time = 0
supermovetime = -1
anim = 1003
postype = p1
pos = 0 , 0
scale = 0.5,0.5
sprpriority = 5
ID = 1003

[state 3500]
type = superpause
trigger1 = time = 1
sound = 20 , 0 
poweradd = -1500
pos = 0, 0 
Time = 30
Darken = 1
poweradd = 0
P2DefMul = 1

[State 3500, ヒット定義]
type = HitDef
trigger1 = UniqHitCount = 0
trigger1 = MoveContact = 0
animtype = up
attr = A, HA  ;（Air, Hyper Attack）
Hitflag = MAFD
Guardflag = L
damage = 400
priority = 5
pausetime = 10,120
sparkno = -1 
hitsound   = s500,0
guardsound = 6,0
EnvShake.Time              = 32
EnvShake.Ampl              = 5
EnvShake.Phase             = 5
EnvShake.Freq              = 5
ground.type = High
ground.slidetime = 4
ground.hittime  = 6
ground.velocity = -1,-0
air.velocity = -1,-0
hitonce = 1
fall = 1
fall.recover = 160


[state 3500]
type = changestate
trigger1 = time = 60
value = 0
ctrl = 1





;結月式ひし形戦車　マークワン start
[statedef 3505]
type = S
movetype = A
physics = N
anim = 41
velset = 0,-20
hitcountpersist = 0
ctrl = 0
sprpriority = 4


[state ]
type = Explod
trigger1 = vel Y > -2
anim = 691 
supermovetime = -1
PosType = left
Facing = facing
persistent = 0


[state 423, gravity]
type = gravity
trigger1 = time

[State , player push]
Type = PlayerPush
Trigger1 = 1
Value = 0

[state 3500]
type = superpause
trigger1 = vel Y = 0
sound = 20 , 0 
poweradd = -3000
pos = 0, 0 
Time = 30
Darken = 1
poweradd = 0
P2DefMul = 1

[State -2, After Image V2]
Type = AfterImage
trigger1 = time = 0
Time = 1
length = 8
framegap = 4
PalBright = 155,122,100
Palmul = 40,40,40
Trans = sub

[State -2, After Image V2]
Type = AfterImageTime
trigger1 = 1
Time = 4
Ignorehitpause = 1

[state 2]
type = changestate
trigger1 = vel Y > 0
value = 3506

 ;落下後の動作
[statedef 3506]
type = S
movetype = A
physics = N
anim = 1250
velset = 0,5
hitcountpersist = 0
ctrl = 0
sprpriority = 2

[state ]
type = notHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT

[state 423, gravity]
type = gravity
trigger1 =! (Vel Y>0 && Pos Y>=-Vel Y)

[state 33, posset]
type = posSet
trigger1 = pos Y >=0 && vel Y > 0
Y = 0

[state 350,Velset]
type = velset
trigger1 = pos Y = 0 && command != "up"
Y = 0

;=======================

[state 350 , changeanim]
type = changeAnim
triggerall = (Anim != 700)
trigger1 = Abs(vel X) > 0
trigger1 = Anim = 1250
value = 1251
persistent = 1

[state 350 , changeanim]
type = changeAnim
triggerall = (Anim != 700)
trigger1 = Abs(vel X) = 0
trigger1 = Anim = 1251
value = 1250
persistent = 1

[state 350 , changeanim(Jump)]
type = changeAnim
triggerall = (Anim != 700)
triggerall = time < 300
triggerall = pos Y = 0
trigger1 = command = "holdup"
trigger1 = var(55) != 1
trigger2 = var(55) = 1 && time % (22 + (random % 8))
value = 1255
persistent = 1

[state 350 , changeanim(Shot)]
type = changeAnim
triggerall = (Anim != 700)
triggerall = (NumProjID(3505) = 0 && !(palno = [10,12])) || (palno = [10,12])
triggerall = time < 300
trigger1 = command = "a" && var(55) != 1
trigger2 = time % 6 = 0 && (palno = [10,12])  && var(55) = 1 && p2Dist Y = [-80,80]
trigger3 = time % 24 = 0 &&  var(55) = 1 && p2Dist Y = [-60,60]
value = 1254
persistent = 1

[state 350 , changeanim(Shot,JumpAfter)]
type = changeAnim
triggerall = (Anim != 700)
trigger1 = Anim = 1254
trigger1 = AnimElemTime(2) = 0
trigger2 = Anim = 1255
trigger2 = AnimElemTime(2) = 0
value = 1250
persistent = 1

;=====================

[state 350 , Explod]
type = Explod
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
trigger1 = anim != 700
Anim = 1245
pos = 40,-20
sprpriority = 2
persistent = 1

[state 350 , Explod]
type = Explod
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
trigger1 = anim != 700
Anim = 1245
pos = -40,-20
sprpriority = 3
persistent = 1

[state 3651, Envshake(Down)]
type = EnvShake
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
trigger1 = anim != 700
Time = 12
Ampl = 10 * Abs(vel Y)/5
Freq = 120 * Abs(vel Y)/5

[state 3651, Envshake(Shot)]
type = EnvShake
trigger1 = Anim = 1254
trigger1 = AnimElemTime(1) = 0
Time = 4
Ampl = 3
Freq = 200

[state 350 , run snd start]
type = playsnd
trigger1 = Anim = 1251
trigger1 = AnimElemtime(1) = 0  
value = 25,0
channel = 30

[state 350 , run snd stop]
type = stopsnd
trigger1 = vel X = 0 
channel = 30

[state 350 , shot snd start]
type = playsnd
trigger1 = Anim = 1254
trigger1 = AnimElemTime(1) = 0 
value = 25,1
channel = 29
persistent = 1

[state 350 , Jump snd start]
type = playsnd
trigger1 = anim = 1255
trigger1 = animElemTime(1) = 0
value = 25,3
channel = 27
persistent = 1

[state 350 , Crush snd start]
type = playsnd
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
trigger1 = anim != 1256
value = 25,2
channel = 28
persistent = 1


[State 3500, ヒット定義]
type = HitDef
triggerall = ( p2movetype != H ) || Target,stateno = 5120 || Target,stateno = 5110
trigger1 = (anim = [1250,1255])
trigger1 = vel Y > 0.2
trigger1 =! pos Y >=0 && vel Y > 0
animtype = Back
attr = A, HA  ;（Air, Hyper Attack）
Hitflag = MAFD
Guardflag = M
damage = 80 * (Abs(vel Y)/8)*(Abs(vel Y)/8)
priority = 5
pausetime = 20,10
sparkno = -1 
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 4
ground.hittime  = 6
ground.velocity = -5,-6
air.velocity = -5,-6
hitonce = 0
fall = 1
fall.recover = 160

[State 3500, ヒット定義]
type = HitDef
trigger1 = Abs(vel X) > 0 && vel Y = 0
trigger1 = (anim = [1250,1255])
trigger1 = time % 8 = 0
trigger2 = time % 8 = 0
trigger2 = vel Y < -0.2
animtype = Back
attr = A, HA  ;（Air, Hyper Attack）
Hitflag = MAFD
Guardflag = M
damage = 20,0
priority = 5
pausetime = 2,2
sparkno = -1 
hitsound   = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 4
ground.hittime  = 6
ground.velocity = -1,-1
air.velocity = -1,-1
hitonce = 0
fall = 1
fall.recover = 10

[state 2121, Shell]
type = projectile
trigger1 = Anim = 1254
trigger1 = AnimElemTime(1) = 0
attr = S,HP
Hitflag = MAFD
GuardFlag = MA
Animtype = UP
projID = 3505
Projanim = 1252
projremovetime = -1            ;飛び道具の消えるまでの時間（フレーム）※-1なら当たるか画面外に出るまで消えない
Velocity = 15,0
offset = 24,-35
pausetime = 20,1
Accel = 0,0
Damage = 50,0
sparkno = s1245
guard.sparkno = s1245
sparkxy = 0,0
hitsound = 5,3
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime = 16
ground.velocity = -6,-10
air.velocity = -6,-10
envshake.time = 8
envshake.ampl = 6
envshake.freq = 100
fall = 1
fall.recover = 160


[state 350,Velset]
type = velset
trigger1 = Anim = 1255
trigger1 = pos Y = 0
trigger1 = time < 300
Y = -8
X = vel x

[state 350,Velset]
type = velset
trigger1 = pos Y = 0
trigger1 = time < 300
trigger1 = var(55) != 1
trigger1 = command != "holdfwd" || command != "holdback"
x = 0

[state 350,Velset]
type = velset
trigger1 = pos Y = 0
trigger1 = time < 300
trigger1 = var(55) != 1
trigger1 = command = "holdfwd"
x = 3

[state 350,Velset]
type = velset
triggerall = pos Y = 0
triggerall = time < 300
trigger1 = var(55) != 1
trigger1 = command = "holdback"
x = -3

;==================

[state 350,Velset AI]
type = velset
triggerall = pos Y = 0
triggerall = time < 300
triggerall = var(55) = 1
trigger1 = Abs(P2Dist X) < 80 && Abs(P2Dist X) > 60
x = 0

[state 350,Velset AI]
type = velset
triggerall = pos Y = 0
triggerall = time < 300
triggerall = var(55) = 1
trigger1 = Abs(P2Dist X) > 80 && P2Dist X > 0
x = 3

[state 350,Velset AI]
type = velset
triggerall = pos Y = 0
triggerall = time < 300
triggerall = var(55) = 1
trigger1 = Abs(P2Dist X) < 60
trigger2 = P2Dist X < 0
x = -3

;==================


[state 350,Velset(timeover)]
type = velset
trigger1 = pos Y = 0
trigger1 = time > 300
x = 0
y = 0

[state ]
type = changeAnim
trigger1 = time > 300
trigger1 = (Vel Y> 0 && Pos Y>=-Vel Y) || pos Y = 0
trigger2 = time = 400
value = 1256
persistent = 0

[state ]
type = explod
trigger1 = time > 300
trigger1 = Vel Y>0 && Pos Y>=-Vel Y  || pos Y = 0
trigger2 = time = 400
Anim = 1253 
sprpriority = 10
persistent = 0

[state 2]
type = changestate
trigger1 = Anim = 1256
trigger1 = pos Y = 0
trigger1 = AnimElemtime(12) = 0
trigger2 = time > 500
value = 0
ctrl = 1

;=======

;オーバードウェポン結月ゆかり (決死)
[statedef 3600]
type = S
movetype = A
physics = S
poweradd = 0
anim = 600
ctrl = 0
sprpriority = 5
velset = -5,0

[state 3600]
type = superpause
trigger1 = time = 0
sound = s600 , 1  
anim = -1
pos = 0, 0 
Time = 256
Darken = 0
poweradd = 0
P2DefMul = 1

[State 3600, Effect]
type = Explod
trigger1 = time = 7
supermovetime = -1
anim = 1003
postype = p1
pos = 0 , 0
scale = 0.5,0.5
sprpriority = 3
ID = 1003

[state 3600]
type = BGpalFX
trigger1 = time = 0
time = 256
sinadd = -20, -120 ,-120 , 1024

[state 3600]
type = BGpalFX
trigger1 = time = 1
time = -1
add = -20, -120 ,-120

[state 3600]
type = superpause
trigger1 = time = 1
anim = -1
pos = 0, 0 
Time = 120
Darken = 0
poweradd = -3000
Movetime = 120
P2DefMul = 1

[state 3600]
type = playsnd
trigger1 = time = 1
value = s610 , 10
channel  = 2

[state 3600]
type = AfterImage
trigger1 = ifElse( Time%4 = 0 , 1, 0 )
time = 5

[state 3600]
type = Playsnd
trigger1 = time = 2
volume = 15
Channel = 0
value = 600,2

[state 3600]
type = Explod
ID = 10
SuperMoveTime = -1
trigger1 = time = 7
sprpriority = 6
Anim = 605

[state 3600]
type = changestate
trigger1 = time = 120
value = 3601
ctrl = 0

[statedef 3601]
type = S
movetype = A
physics = U
poweradd = 0
hitcountpersist = 1
anim = 601
ctrl = 0
sprpriority = 4
velset = 80,0

[state 3601]
type = AfterImage
trigger1 = ifElse(Time%2 = 0 , 1, 0 )
time = 5

[state 3601]
type = envshake
trigger1 = HitCount > 1

[state 3601]
type = playsnd
trigger1 = time = 0
volume = 3
value   = s610,0
channel = 2

[State 3601, ヒット定義]
type = HitDef
trigger1 = 1
attr = A, HA  ;（standing, Hyper Attack）
Hitflag = MAF
damage = 25
priority = 5
pausetime = 5,1
sparkno = -1 
hitsound   = 5,4
guardsound = 6,0
EnvShake.Time              = 32
EnvShake.Ampl              = 5
EnvShake.Phase             = 5
EnvShake.Freq              = 5
ground.type = Low
ground.slidetime = 4
ground.hittime  = 6
ground.velocity = -30
air.velocity = -2,-1

[State 3601, Effect]
type = Explod
trigger1 = Hitpausetime = 0
anim = 1002
postype = p1
pos = 20 , -50
scale = 0.5,0.5
sprpriority = 5
ID = 1002

[state ]
type = veladd
trigger1 = time % 4 = 1 
X = -0.05

[State 9000, EnvColor]
type = EnvColor
trigger1 = vel X >= 0
trigger1 = time % 3 = 1
trigger1 = MoveContact
value = 248*(GameTime%2),248*(GameTime%2),248*(GameTime%2)
time = 1
ignorehitpause = 1
under = 1
pausemovetime = -1

[state 3601, Changestate]
type = changestate
trigger1 = vel X <= 0
value = 3602
ctrl = 0

;----------------
[statedef 3602]
type = S
movetype = A
physics = S
hitcountpersist = 1
poweradd = 0
anim = 602
ctrl = 0
sprpriority = 5

[state 3651]
type = varset
trigger1 = 1
trigger1 = Enemy,Life = 0
v = 15
Value = 11

[state 3651]
type = PlaySnd
trigger1 = P2Life = 0 || EnemyNear,Alive = 0
trigger1 = time = 1
value = 500,1
channel = 5
volume = 1000

[State 9000, EnvColor]
type = EnvColor
trigger1 = time < 32
trigger1 = P2Life = 0 || EnemyNear,Alive = 0
value = 248*(GameTime%2) + 240,248*(GameTime%2),248*(GameTime%2)
time = 1
ignorehitpause = 1
under = 1
pausemovetime = -1

[state 3600]
type = BGpalFX
trigger1 = time = 1
time = 1
Add = 20, 120 ,120

[state 3602, Changestate]
type = changestate
trigger1 = time = 32
value = 0
ctrl = 1


;-------=======================================
;サヨナラチェーンソーStart
[statedef 3650]
type = S
movetype = A
physics = S
poweradd = 0
anim = 650
ctrl = 0
sprpriority = 5

[state ]
type = Explod
trigger1 = time = 1
anim = 691 
supermovetime = -1
PosType = left
Facing = facing

[state 1241 , Switch]
Type = varset
Trigger1 = time = 0
fv = 29
Value = 1
ignorehitpause = 1

[state 3650]
type = Assertspecial
trigger1 = time > 0
Flag = NoMusic

[state 3650]
type = superpause
trigger1 = time = 58
pos = 0, -20 
Time = 50
Darken = 0
sound = 20,0
poweradd = 0
Movetime = 0
P2DefMul = 50

[state 3650]
type = superpause
trigger1 = Animelemtime(1) = 58
pos = 0, -20 
Time = 70
Darken = 0
poweradd = -3000
Movetime = 70
P2DefMul = 50

[state 3650]
type = Velset
trigger1 = Animelemtime(25) = 0
trigger2 = Animelemtime(33) = 0
X = 10

[state 3650]
type = Playsnd
trigger1 = Animelemtime(25) = 0
trigger2 = Animelemtime(33) = 0
value = 5,0
channel = 5

[state 3650]
type = Playsnd
trigger1 = time = 57
value = 650,10
volume = 400
channel = 2

[State 3650, Effect]
type = Explod
trigger1 = time = 58
supermovetime = -1
anim = 1003
postype = p1
pos = 0 , 0
scale = 0.5,0.5
sprpriority = 3
ID = 1003

[state 3650]
type = BGpalFX
trigger1 = time = 0
time = 32
sinadd = -20, -120 ,-20 , 128

[state 3650]
type = BGpalFX
trigger1 = time = 32
time = -1
add = -20, -120 ,-20


[state 3650]
type = AfterImage
trigger1 = ifElse( Time%4 = 0 , 1, 0 )
time = 5

[state 3650]
type = AfterImage
trigger1 = ifElse( Time%4 = 0 , 1, 0 )
time = 5

[State -3, After Image Time]
Type = AfterImageTime
trigger1 = 1
Time = 2
Ignorehitpause = 1

[state 3650]
type = HitDef
trigger1 = 1
attr = S, HT  ;（standing, Hyper Throw）
Hitflag = MAFD
animtype = Up
priority = 5
pausetime = 1,1
hitsound = 5,4 
sparkno = s1010
sparkXY = 0, -40 
guardsound = 6,0
P2GetP1state = 1
P1StateNo = 3651
P2StateNo = 3653
ground.type = High
hitonce = 1
fall = 1
fall.Recover = 0

[state 3650]
type = BGpalFX
trigger1 =  animElemtime(37) > 0
time = 1
add = 0 , 0 , 0

[state 3650]
type = changeState
trigger1 = animElemtime(37) > 0
ctrl = 1
value = 0

;-----------------------------------
;自分が攻撃ヒットした時
[statedef 3651]
type = S
movetype = A
physics = S
poweradd = 0
anim = 652
ctrl = 0
sprpriority = 3

[state ]
type = varadd
var(52) = 1
trigger1 = time = 0
trigger2 = time = 27
trigger3 = time = 51
trigger4 = time = 86
trigger5 = time = 98
trigger6 = time = 122

[state ]
type = HitAdd
value = 1
trigger1 = time = 0
trigger2 = time = 27
trigger3 = time = 51
trigger4 = time = 86
trigger5 = time = 98
trigger6 = time = 122


[state 650]
type = AssertSpecial
trigger1 = time > 0 && time < 205
Flag = NoMusic

[state 650]
type = Assertspecial
trigger1 = ( time > 0 && time < 122 )
Flag = NoBG
Flag = NoFG
Flag = NoBarDisplay

[state 600]
type = superpause
trigger1 = time = 0
Time = 0
anim = s9999

[state 3651]
type = playsnd
trigger1 = time = 0
channel = 2
volume = 100
value = 650, 0

[state 3651]
type = playsnd
trigger1 = time = 27
channel = 4
volume = 30
value = 30, 0

[state 3651]
type = playsnd
trigger1 = time = 51
channel = 4
volume = 30
value = 30, 1

[state 3651]
type = playsnd
trigger1 = time = 86
channel = 4
volume = 30
value = 30, 2

[state 3651]
type = playsnd
trigger1 = time = 98
channel = 4
volume = 30
value = 30, 3

[state 3651]
type = playsnd
trigger1 = time = 122
channel = 4
volume = 30
value = 30, 4

[state 3651]
type = Envshake
trigger1 = time = 27
Time = 12
Ampl = 20
Freq = 30

[state 3651]
type = EnvShake
trigger1 = time = 51
Time = 12
Ampl = 20
Freq = 50

[state 3651]
type = Envshake
trigger1 = time = 86
Time = 12
Ampl = 20
Freq = 80

[state 3651]
type = EnvShake
trigger1 = time = 98
Time = 12
Ampl = 20
Freq = 100

[state 3651]
type = EnvShake
trigger1 = time = 122
Time = 12
Ampl = 20
Freq = 120

[State 3651, ヘルパーでEffect作り]
type = Helper
trigger1 = time = 1
supermovetime = 0
Name = "Cutin_Sayonara"
postype = back
size.Xscale = 0.77
size.Yscale = 0.77
pos = 150,-100
stateNo = 3652
ID = 3652
Ignorehitpause = 1 

[state 3651]
type = Velset
X = 2
trigger1 = time = 0

[state 3651]
type = posSet
trigger1 = time = 1
X = 0
Y = 0

[state 3651]
type = targetbind
trigger1 = time = 0
pos = 0, -90
time = 125

[state 3651]
type = targetbind
trigger1 = time = 126
pos = 80, -90
time = 1

[state 3651]
type = varset
trigger1 = 1
trigger1 = Enemy,Alive = 0
v = 15
Value = 10

[state 3651]
type = Changestate
trigger1 = time > 320
trigger1 = EnemyNear,pos Y > -120
ctrl = 1
value = 0

[state 3651]
type = stopsnd
trigger1 = time = 319 && enemy,alive = 1
channel = 2

[state 3650]
type = BGpalFX
trigger1 = time = 319
time = 1
add = 0,0,0

[state 3650]
type = changeState
trigger1 = ( Target,StateNo != 3653 && Target,Alive = 1)  
ctrl = 1
value = 0

;---------------------
;アニメーション用Helper

[statedef 3652]
type = S
movetype = I
physics = N
sprpriority = 4
ctrl = 0
anim = 651

[state 3652]
type = destroySelf
trigger1 = Animelemtime(25) > 7

;-------------------

;敵のステート
[statedef 3653]
type = A
movetype = H
Physics = N
velset = 0,0

[state 3653]
type = screenbound
trigger1 = time > 0

[state 3653]
type = posSet
trigger1 = time = 0
X = 0
Y = -90

[state 3653]
type = changeanim2
trigger1 = time = 0
value = 653

[state 3653]
type = lifeadd
trigger1 = time = 127
value = -(P2Life * 2)

[state 3653]
type = lifeset
trigger1 = time = 128
value = 0

[state 3653]
type = lifeadd
trigger1 = time > 130
value = -1

[state 3653]
type = velset 
trigger1 = time = 127
X = 0
Y = -90

[state 3653]
type = gravity
trigger1 = time > 127

[State 3653, 相手ステートに戻す]
type = changestate
trigger1 = time > 205
trigger1 = pos Y > -130
value = 5035

;We Can Be Like Tornado
[statedef 3655]
type = S
movetype = A
physics = N
anim = 350
hitcountpersist = 1
ctrl = 0
sprpriority = 4
velset = -0.5,0


[state ]
type = Explod
trigger1 = time = 1
anim = 691 
supermovetime = -1
PosType = left
Facing = facing

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 7
value = 1011
;elem = 1
;ignorehitpause = 
;persistent = 

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1 
value = 1234,0
volume = 300
channel = -1
;lowpriority = -1
freqmul = 1.0
loop = 0
pan = 0
;abspan = 
;ignorehitpause = 
;persistent = 


[state 350,Velset]
type = veladd
trigger1 = time < 64
trigger1 = command = "prsfwd"
x = 0.2

[state 350,Velset]
type = varadd
trigger1 = time = 1
trigger1 = var(54) =! 1
fvar(29) = -25

[state 350,Velset]
type = veladd
trigger1 = time < 64
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

[state 350.徐々に止まる]
type = velset
trigger1 = time > 64
x = Vel X / 3

[state 3500]
type = superpause
trigger1 = time = 1
sound = 20 , 0 
poweradd = -2000
pos = 0, 0 
Time = 30
Darken = 1
poweradd = 0
P2DefMul = 1
;ignorehitpause = 
;persistent = 

[State 0, HitDef]
type = HitDef
trigger1 = time % 5 = 0
attr = S,HA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFD        ;HLAFD+-
guardflag = M         ;HLA
;affectteam = E          ;B,E,F
animtype = UP          ;light,medium,hard,back,up,diagup
air.animtype = UP
;fall.animtype = Back
;priority = 4,Hit
damage = 10,5
pausetime = 5,8
sparkno = 3
sparkxy = 0,0
hitsound = 5,3
guardsound = 6,0
ground.type = High      ;Low,Trip,None
;air.type = High
ground.slidetime = 0
ground.velocity = 0,-6
;guard.velocity = 0
air.velocity = -0.5,-1
fall = 1
;fall.xvelocity = 0
fall.recover = 1
fall.recovertime = 400
;air.fall = 0
;down.velocity = 0,0
;down.hittime = 0
down.bounce = 0
id = 0
chainID = -1
nochainID = -1
hitonce = 1
kill = 1
guard.kill = 0
;getpower = 0,0
;givepower = 0,0
palfx.time = 0
;palfx.mul = 
;palfx.add = 
envshake.time = 0
;envshake.freq =
;envshake.ampl = 
;envshake.phase =
fall.envshake.time = 0
;fall.envshake.freq = 
;fall.envshake.ampl = 
;fall.envshake.phase =
;ignorehitpause = 
;persistent = 


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
