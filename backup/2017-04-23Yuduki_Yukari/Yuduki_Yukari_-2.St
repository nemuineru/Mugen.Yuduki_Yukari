[statedef -2]


;ヘルパー登録,マキちゃん
[state -2]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1 || Roundstate = 2 )
trigger1 = NumHelper(2280) != 1
postype = p1
pos = -50,0
ID = 2280
stateno = 2280
keyctrl = 0
ownpal = 1
name = "Gauge_System"
supermovetime = 900000
pausemovetime = 900000



;ダメージ音
[state soundeffect,weak]
type = PlaySnd
trigger1 = stateno = [5000,5100]
trigger1 = time = 0
trigger1 = (GetHitVar(Damage) < 15 ) 
value = 5000,0 + random % 4
volume = 10000

[state soundeffect,strong]
type = PlaySnd
trigger1 = stateno = [5000,5100]
trigger1 = time = 0
trigger1 = (GetHitVar(Damage) <= 55 && GetHitVar(Damage) >= 15)
value = 5000,4 + random % 6
volume = 10000

[state soundeffect,heavy]
type = PlaySnd
trigger1 = stateno = [5000,5100]
trigger1 = time = 0
trigger1 = (GetHitVar(Damage) > 55)
value = 5000,10 + random % 2
volume = 10000


;------------------------------------
;--------ここから監視ステート。---------------

;脱衣KOの判定
[state -2, Helper]
type = Helper
triggerAll = !Alive
triggerAll = var(57)
triggerAll = RoundState = 3
triggerAll = numhelper(2455) = 0
trigger1 = enemy,hitdefattr = SCA, HA, HP, HT
trigger2 = enemy,stateno >= 3000 && enemy,stateno != [5000,5999]
trigger3 = EnemyNear,stateno >= 3000 && EnemyNear,stateno != [5000,5999]
trigger4 = EnemyNear,hitdefattr = SCA, HA, HP, HT
name = "Datsui_KO"
ID = 2455
Pos = 0,0
PosType = P1
stateNo = 2455
supermovetime = 900000
pausemovetime = 900000

;---------------
;ヘルパー登録
[state -2]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1 )
trigger1 = roundno = 1
trigger1 = NumHelper(7626) != 1
postype = left
pos = 0,0
ID = 7626
stateno = 7626
keyctrl = 0
ownpal = 1
name = "Name Entry"
supermovetime = 900000
pausemovetime = 900000


;----------------


;専用ゲージ:コンボテンションゲージ 記述

;ヘルパー登録
[state -2]
type = Helper
trigger1 = ( Roundstate = 0 || Roundstate = 1 || Roundstate = 2 )
trigger1 = NumHelper(4000) != 1
postype = p1
pos = 0,0
ID = 4000
stateno = 4000
keyctrl = 0
ownpal = 1
name = "Gauge_System"
supermovetime = 900000
pausemovetime = 900000

[state -2, Varset - 最小値]
type = varset
trigger1 = var(50) > 24
var(50) = 24

[state -2, Varset - 最大値]
type = varset
trigger1 = var(50) < 0
var(50) = 0

[state -2] ; コンボ評価 p1
type = Explod
triggerall = var(52) > 2
triggerall = numexplod(52) = 0
triggerall = teamside = 1
trigger1 = p2movetype != H || WinKO && ctrl
id = 52
anim = 1150 + IFelse(Var(52) < 24 , var(52) / 3  - 1 , 7 ) 
pos = 35,220
postype = left
facing = 1
removetime = -2
bindtime = -1
ontop = 1
ownpal = 1
scale = 1,1

[state -2] ; コンボ評価
type = Explod
triggerall = var(52) > 2
triggerall = numexplod(52) = 0
triggerall = teamside = 2
trigger1 = p2movetype != H || WinKO && ctrl
id = 52
anim = 1150 + IFelse(Var(52) < 24 , var(52) / 3  - 1 , 7 ) 
pos = 285,220
postype = left
facing = 1
removetime = -2
bindtime = -1
ontop = 1
ownpal = 1
scale = 1,1

[state -2];相手がKOかまた動けるようになるか
type = VarSet
trigger1 = p2movetype!=H || WinKO && ctrl
var(52) = 0

[state -2];相手がHIT中の時
type = VarAdd
trigger1 = enemynear, time = 0
trigger1 = enemynear, Hitshakeover = 0
trigger1 = p2stateno = 6300 || p2stateno = [5000,5899]
trigger2 = var(52)= -1 && (movehit || p2stateno = 6300 || p2stateno = [5000,5899])
var(52) = 1
ignorehitpause = 1

[state -2, ヒットカウント3ごとに数が増える]
type = varset
trigger1 = var(52) % 3 = 0
trigger1 = var(52) > 0
trigger1 = var(50) < 24
trigger1 = enemynear, time = 0
trigger1 = enemynear, Hitshakeover = 0
trigger1 = p2stateno = 6300 || p2stateno = [5000,5899]
var(50) = var(50)+1
ignorehitpause = 1 
persistent = 0

;==================================;
;シンクロゲージ記述

[state -2, fVarset - 最大値]
type = varset
trigger1 = fvar(29) > 300
fvar(29) = 300.0

[state -2, fVarset - 最小値]
type = varset
trigger1 = fvar(29) < 0
fvar(29) = 0.0

[state -2, fVarを実際のVarに変換、バグってるけど仕様]
type = varset
trigger1 = 1
var(53) = Floor(fvar(29))
ignorehitpause = 1 
persistent = 1

[state -2, 増加量計算　現在のパワーゲージと相手の体力差(割合)に応じてSyncのポイントが貯まる]
type = varset
trigger1 = 1
fvar(1) = 0.1 *  (Power + 1500) / (PowerMax) / ((Life + 1.0) / lifeMAX) * ((Enemynear,Life + 1.0) / EnemyNear,LifeMAX)
persistent = 1
ignorehitpause = 1


[state -2, Syncの最高増加量。]
type = varset
trigger1 = RoundState = 2
trigger1 = fvar(1) > 0.6
fvar(1) = 0.6
persistent = 1
ignorehitpause = 1

[state -2, Syncの最低増加量。]
type = varset
trigger1 = RoundState = 2
trigger1 = fvar(1) < 0.04
fvar(1) = 0.04
persistent = 1
ignorehitpause = 1

[state -2, fvar(1)の値を実際に加算]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) = 0
trigger1 = fvar(29) < 300
fvar(29) = fvar(1) 
persistent = 1
ignorehitpause = 1


;バースト、オーバードライブモード、MAX!オーバードライブモードを判別

[state -2]
type = varset
trigger1 = fvar(29) < 200 
trigger1 = stateno = 700
trigger1 = var(54) = 0
var(54) = 1

[state -2]
type = varset
trigger1 = fvar(29) >= 200 && fvar(29) < 300
trigger1 = stateno = 700
trigger1 = var(54) = 0
var(54) = 2

[state -2]
type = varset
trigger1 = fvar(29) >= 300
trigger1 = stateno = 700
trigger1 = var(54) = 0
var(54) = 3

;----------------------------------

[state -2, バーストでゲージを0%に落とす。]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) = 1
fvar(29) = - 0.8
ignorehitpause = 1

[state -2, オーバードライブ,ゲージ減少。]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) = 2
fvar(29) = - 0.2 - 0.08 * (3000 / (Power + 500))
ignorehitpause = 1

[state -2, MAX!オーバードライブモードではゲージ減少は抑えられる。]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) = 3
fvar(29) = - 0.16
ignorehitpause = 1

[state -2, オーバードライブ, MAX!オーバードライブモードのLifeAdd]
type = Lifeadd
trigger1 = time % 10 = 0
trigger1 = RoundState = 2
trigger1 = var(54) = [2,3]
value = 1.5 * (Power+1000)/1000
ignorehitpause = 1

[state -2, ハイパーモードによるパワーゲージ増加(オーバードライブ)]
type = powerAdd
triggerall = var(54) != 0 && Alive
trigger1 = time % 4 = 0
value = 1 + var(54) * 1 + Ifelse( palno - 9 > 0 , palno - 8 , 0 )*2 


[state -2, ハイパーモードリセット(バースト)]
type = varset
triggerall = var(54) = 1
trigger1 = fvar(29) <= 0
trigger2 =  alive = 0
var(54) = 0

[state -2, ハイパーモードリセット(オーバードライブ)]
type = varset
triggerall = var(54) = 2
trigger1 = fvar(29) <= 100 || (palno = 12 && fvar(29) <= 200)
trigger2 =  alive = 0
var(54) = 0

[state -2, ハイパーモードリセット(MAX!オーバードライブ)]
type = varset
triggerall = var(54) = 3
trigger1 = fvar(29) <= 200 || (palno = 12 && fvar(29) <= 250)
trigger2 =  alive = 0
var(54) = 0

[state -2,体が光る。]
type = PalFX
time = 2
trigger1 = var(54) = 2
trigger1 = time % 10 = 1 
Add = 256,256,256

[state -2,体が光る。]
type = PalFX
time = 2
trigger1 = var(54) = 3
trigger1 = time % 5 = 1 
Add = 256,200,220

[State -2, After Image V2]
Type = AfterImage
trigger1 = var(54) = 2 && time = 0
Time = 1
length = 8
framegap = 2
PalBright = 155,100,122
PalPostBright = 0,0,0
Paladd = 40,40,40
Trans = add

[State -2, After Image V2]
Type = AfterImageTime
trigger1 = var(54) = 2
Time = 4
Ignorehitpause = 1

[State -2, After Image V3]
Type = AfterImage
trigger1 = var(54) = 3 && time = 0
Time = 1
length = 8
framegap = 2
PalBright = 100,14,18
PalPostBright = 0,0,0
Paladd = 40,10,20
Trans = add

[State -2, After Image V3]
Type = AfterImageTime
trigger1 = var(54) = 3
Time = 4
Ignorehitpause = 1



;AI記述
;AIスタート
[State -2, AI起動]
type = varset
triggerall = (var(55) = 0 && roundstate = 2) || var(55) = 2
triggerall = !ishelper 
triggerall = alive = 1
trigger1 = (command = "AI0") || (command = "AI1") || (command = "AI2") || (command = "AI3") || (command = "AI4") || (command = "AI5") || (command = "AI6") || (command = "AI7") || (command = "AI8") || (command = "AI9")
trigger2 = (command = "AI10") || (command = "AI11") || (command = "AI12") || (command = "AI13") || (command = "AI14") || (command = "AI15") || (command = "AI16") || (command = "AI17") || (command = "AI18") || (command = "AI19")
trigger3 = (command = "AI20") || (command = "AI21") || (command = "AI22") || (command = "AI23") || (command = "AI24") || (command = "AI25") || (command = "AI26") || (command = "AI27") || (command = "AI28") || (command = "AI29")
trigger4 = (command = "AI30") || (command = "AI31") || (command = "AI32") || (command = "AI33") || (command = "AI34") || (command = "AI35") || (command = "AI36") || (command = "AI37") || (command = "AI38") || (command = "AI39")
trigger5 = (command = "AI40") || (command = "AI41") || (command = "AI42") || (command = "AI43") || (command = "AI44") || (command = "AI45") || (command = "AI46") || (command = "AI47") || (command = "AI48") || (command = "AI49")
trigger6 = var(55) = 2 && roundstate = 2
;trigger10000 = 0
var(55) = 1 

[state -2, AI終了]
type = varset
trigger1 = roundstate = 3 && var(55) = 1 
trigger1 = isHelper = 0
trigger2 = alive = 0 && var(55) = 1 
var(55) = 2

;パレットカラーで能力変化
;==================

;ライフ自動回復(11)
[state ]
type = LifeAdd
trigger1 = palno = 10
trigger1 = time % 12 = 1
trigger1 = life > 1
value = 2

;ライフ自動回復(12)
[state ]
type = LifeAdd
trigger1 = palno = 11
trigger1 = time % 12 = 1
trigger1 = life > 1
value = 3

;ライフ自動回復(12)
[state ]
type = LifeAdd
trigger1 = palno = 12
trigger1 = time % 12 = 1
trigger1 = life > 1
value = 5

;====================

;パワーゲージ増量(10)
[state ]
type = powerAdd
trigger1 = palno = 10
trigger1 = time % 30 = 1
trigger1 = power <= Const(data.power)
value = 1

;パワーゲージ増量(11,12)
[state ]
type = powerAdd
trigger1 = palno = [11,12]
trigger1 = time % 3 = 1
trigger1 = power <= Const(data.power)
value = 3

;パワーゲージ常時2以上(12)
[state ]
type = powerset
trigger1 = palno = 12
trigger1 = time % 3 = 1
trigger1 = power <= Const(data.power)/3*2
value = 2000


;====================

;コンボテンション(10)
[state ]
type = varset
trigger1 = RoundState = 2
trigger1 = helper(4000),time % 450 = 0
trigger1 = var(54) =! 1
trigger1 = palno = 10
var(50) = var(50)+1
persistent = 0
ignorehitpause = 1

;コンボテンション(11)
[state ]
type = varset
trigger1 = RoundState = 2
trigger1 = helper(4000),time % 250 = 0
trigger1 = var(54) =! 1
trigger1 = palno = 11
var(50) = var(50)+2
persistent = 0
ignorehitpause = 1

;コンボテンション(12)
[state ]
type = varset
trigger1 = RoundState = 2
trigger1 = helper(4000),time % 100 = 0
trigger1 = var(54) =! 1
trigger1 = palno = 12
var(50) = var(50)+2
persistent = 0
ignorehitpause = 1


;====================

;シンクロゲージ(10)
[state ]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) =! 1
trigger1 = fvar(29) < 300
trigger1 = palno = 0
trigger1 = helper(4000),time % 20 = 0
fvar(29) = 0.02
persistent = 1
ignorehitpause = 1

;シンクロゲージ(11)
[state ]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) =! 1
trigger1 = fvar(29) < 300
trigger1 = palno = 11
trigger1 = helper(4000),time % 20 = 0
fvar(29) = 0.08
persistent = 1
ignorehitpause = 1

;シンクロゲージ(12)
[state ]
type = varadd
trigger1 = RoundState = 2
trigger1 = var(54) =! 1
trigger1 = fvar(29) < 300
trigger1 = palno = 12
trigger1 = helper(4000),time % 20 = 0
fvar(29) = 0.15
persistent = 1
ignorehitpause = 1

;シンクロゲージ常時200以上(12)
[state ]
type = varset
trigger1 = RoundState = 2
trigger1 = var(54) =! 1
trigger1 = fvar(29) < 200
trigger1 = palno = 12
fvar(29) = 200
persistent = 1
ignorehitpause = 1


;====================
;===================================================
;--------------------------
;特殊やられ
;--------------------------

;メタ返し＆メタ再反論～パワーゲージ消費×2
[state -2]
type=Poweradd
triggerAll=alive&&!numexplod(19864)&&!numexplod(19865)
trigger1=numenemy&&!numpartner
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&(enemy,stateno=2910||enemy,stateno=2930)&&enemy,time=2
trigger2=numenemy&&numpartner
trigger2=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&(enemy,stateno=2910||enemy,stateno=2930)&&enemy,time=2&&(ID<Partner,ID||(ID>Partner,ID&&partner,numexplod(19864)=0&&partner,numexplod(19865)=0))
trigger3=numenemy>=2&&!numpartner
trigger3=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&(enemy(1),stateno=2910||enemy(1),stateno=2930)&&enemy(1),time=2
trigger4=numenemy>=2&&numpartner
trigger4=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&(enemy(1),stateno=2910||enemy(1),stateno=2930)&&enemy(1),time=2&&(ID<Partner,ID||(ID>Partner,ID&&partner,numexplod(19864)=0&&partner,numexplod(19865)=0))
value=-500
ignorehitpause=1

;メタ返し～ボイス
[state -2]
type=PlaySnd
triggerAll=alive&&!numexplod(19864)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2910&&enemy,time=2
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2910&&enemy(1),time=2
value=s1999,0
ignorehitpause=1

;メタ返し～カットイン（右向き）
[state -2]
type=Explod
triggerAll=alive&&!numexplod(19864)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2910&&enemy,time=2&&enemy,facing=-1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2910&&enemy(1),time=2&&enemy(1),facing=-1
anim=19864
ID=19864
postype=left
pos=0,240
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

;メタ返し～カットイン（左向き）
[state -2]
type=Explod
triggerAll=alive&&!numexplod(19864)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2910&&enemy,time=2&&enemy,facing=1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2910&&enemy(1),time=2&&enemy(1),facing=1
anim=19864
ID=19864
postype=right
pos=0,240
facing=-1
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

;メタ再反論～ボイス
[state -2]
type=PlaySnd
triggerAll=alive&&!numexplod(19865)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2930&&enemy,time=2
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2930&&enemy(1),time=2
value=s1999,1
ignorehitpause=1

;メタ再反論～カットイン（右向き）
[state -2]
type=Explod
triggerAll=alive&&!numexplod(19865)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2930&&enemy,time=2&&enemy,facing=-1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2930&&enemy(1),time=2&&enemy(1),facing=-1
anim=19865
ID=19865
postype=left
pos=0,240
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

;メタ再反論～カットイン（左向き）
[state -2]
type=Explod
triggerAll=alive&&!numexplod(19865)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2930&&enemy,time=2&&enemy,facing=1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2930&&enemy(1),time=2&&enemy(1),facing=1
anim=19865
ID=19865
postype=right
pos=0,240
facing=-1
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

[state -2, しりもち１ ]
type=ChangeAnim
trigger1=movetype=H&&((((stateno=[1500,1502])||(stateno=[4600,4602]))&&anim=5022)||(((stateno=[1510,1512])||(stateno=[4610,4612])||stateno=4620)&&anim=5027))
value=9846-ifelse((stateno=[1500,1502])||(stateno=[4600,4602]),1,0)
persistent=0

[state -2 しりもち２]
type=selfstate
trigger1=movetype=H&&(anim=9846||anim=5022||anim=5027)&&((command="holdup"&&(stateno=1510||stateno=4610||stateno=4620))||(command="holdfwd"&&(stateno=1511||stateno=4611))||(command="holdback"&&(stateno=1512||stateno=4612)))
value=1516

[state -2]
type = Assertspecial
trigger1 = var(15) = 10
trigger1 = time > 0
Flag = NoMusic

[State -2];ﾁｯﾌﾟの絵を表示
type = Explod
triggerall = roundstate >= 3
triggerall = MatchOver
triggerall = P2Name="ROCKMAN_EXE"||P4Name="ROCKMAN_EXE"
triggerall = Lose
triggerall = !NumExplod(12365)
trigger1 = NumEnemy < 2
trigger1 = Enemy,NumHelper(183)
trigger1 = Enemy,var(35)=1
trigger2 = Enemy,Teammode = Simul
trigger2 = !((ID>Partner,ID)&&Partner,NumExplod(12365))
trigger2 = Enemy(0),NumHelper(183)||Enemy(1),NumHelper(183)
trigger2 = (Enemy(0),Alive && P2Name="ROCKMAN_EXE")||(Enemy(1),Alive && P4Name="ROCKMAN_EXE")
trigger2 = (Enemy(0),var(35)=1 && P2Name="ROCKMAN_EXE")||(Enemy(1),var(35)=1 && P4Name="ROCKMAN_EXE")
anim= 12365 + IfElse(fvar(29) > 200 , 100 , 0)
ID=12365
pos = 179,128
postype = Left
facing = 1
ontop = 0
scale=1,1
ownpal=1
bindtime=-1
sprpriority=499
removetime = -1
pausemovetime = 0
supermovetime = 0
removeongethit = 0
ignorehitpause=1


[State -2];タッグを組んでいて自分が3Pまたは4Pの時に味方も対応している時は消去
type = RemoveExplod
trigger1 = NumPartner
trigger1 = ((Teammode=Simul)&&(ID>Partner,ID)&&Partner,NumExplod(12366))
ID=12365



[State -2];ﾁｯﾌﾟの名前を表示
type = Explod
triggerall = roundstate >= 3
triggerall = MatchOver
triggerall = P2Name="ROCKMAN_EXE"||P4Name="ROCKMAN_EXE"
triggerall = Lose
triggerall = !NumExplod(12366)
trigger1 = NumEnemy < 2
trigger1 = Enemy,NumHelper(183)
trigger1 = Enemy,var(35)=2
trigger2 = Enemy,Teammode = Simul
trigger2 = !((ID>Partner,ID)&&Partner,NumExplod(12365))
trigger2 = Enemy(0),NumHelper(183)||Enemy(1),NumHelper(183)
trigger2 = (Enemy(0),Alive && P2Name="ROCKMAN_EXE")||(Enemy(1),Alive && P4Name="ROCKMAN_EXE")
trigger2 = (Enemy(0),var(35)=2 && P2Name="ROCKMAN_EXE")||(Enemy(1),var(35)=2 && P4Name="ROCKMAN_EXE")
anim=12366  + IfElse(fvar(29) > 200 , 100 , 0)
ID=12366
pos = 83,147
postype = Left
facing = 1
ontop = 0
scale=1,1
ownpal=1
bindtime=-1
sprpriority=505
removetime = -1
pausemovetime = 0
supermovetime = 0
removeongethit = 0
ignorehitpause=1



[State ];ﾁｯﾌﾟコードを表示
type = Explod
triggerall = roundstate >= 3
triggerall = MatchOver
triggerall = P2Name="ROCKMAN_EXE"||P4Name="ROCKMAN_EXE"
triggerall = Lose
triggerall = !NumExplod(12367)
trigger1 = NumEnemy < 2
trigger1 = Enemy,NumHelper(183)
trigger1 = Enemy,var(35)=2
trigger2 = Enemy,Teammode = Simul
trigger2 = !((ID>Partner,ID)&&Partner,NumExplod(12365))
trigger2 = Enemy(0),NumHelper(183)||Enemy(1),NumHelper(183)
trigger2 = (Enemy(0),Alive && P2Name="ROCKMAN_EXE")||(Enemy(1),Alive && P4Name="ROCKMAN_EXE")
trigger2 = (Enemy(0),var(35)=2 && P2Name="ROCKMAN_EXE")||(Enemy(1),var(35)=2 && P4Name="ROCKMAN_EXE")
anim=12367 + IfElse(fvar(29) > 200 , 100 , 0)
ID=12367
pos = 156,147
postype = Left
facing = 1
ontop = 0
scale=1,1
ownpal=1
bindtime=-1
sprpriority=505
removetime = -1
pausemovetime = 0
supermovetime = 0
removeongethit = 0
ignorehitpause=1


;---------------------


;---------------------
;Debug
[state -2]
type = DisplayToClipboard
trigger1 = 1
text = "fvar(1)++ = %f , The Tension = %d, var(31) = %d"
Params = fvar(1) , var(50),helper(17629),var(31)