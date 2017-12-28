[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン　　　　　　　　　〃
z = z      ;Ｚボタン　　　　　　　　　〃
a = a      ;Ａボタン　　　　　　　　　〃
b = b      ;Ｂボタン　　　　　　　　　〃
c = c      ;Ｃボタン　　　　　　　　　〃
s = s      ;スタートボタン　　　　　　〃

[Defaults]
command.time = 20  ;標準のコマンド入力受付時間。
                   ;各コマンドで省略している場合に有効。
                   ;このパラメータを消した場合、デフォルトは１フレームになる。
                   ;（　M.U.G.E.Nでの１フレーム　＝　１／６０秒　）

command.buffer.time = 1  ;標準のコマンド入力記憶時間。
                         ;入力した直後にコマンドを記憶し、
                         ;指を離してもコマンドが成功している状態を
                         ;ここで設定した時間の分維持する。
                         ;１〜３０フレームまでの間で設定可能。
                         ;デフォルトは１フレーム。


; [Command]         ：入力コマンドを１個定義する。
; name = "***"      ：コマンド名を決める。大文字と小文字も区別される。
; command = ###     ：実際に入力するキーを組み合わせる。詳細は後述。
; time = &&&        ：入力受付時間を設定（オプション）。
; buffer.time = @@@ ：入力記憶時間を設定（オプション）。
;
; 小ネタでも説明している通り、登録が可能な数は最大『１２８個』まで。
;
; 上記の「command = ###」の『###』に該当する部分で、
; 組み合わせるキーとボタンを設定しなければならない。
;
; ※設定したキーやボタンはM.U.G.E.Nのオプションモードにある
;  「キーコンフィグ」にて設定したキーなどに対応しています。
;
; ★方向キー★（全て必ず大文字で）
;
; 　B 　：「後方」にキーを入れる（ Backward ）
; 　D 　：「下方」にキーを入れる（ Downward ）
; 　F 　：「前方」にキーを入れる（ Forward ）
; 　U 　：「上方」にキーを入れる（ Upward ）
;
; 　DB　：「後ろ斜め下」にキーを入れる（「D」と「B」が同時に入力された事を認識）
; 　UB　：「後ろ斜め上」にキーを入れる（「U」と「B」が同時に入力された事を認識）
; 　DF　：「前斜め下」にキーを入れる（「D」と「F」が同時に入力された事を認識）
; 　UF　：「前斜め上」にキーを入れる（「U」と「F」が同時に入力された事を認識）
;
; ★ボタン★（全て必ず小文字で）
;
; 　a 　：「Ａボタン」を押す
; 　b 　：「Ｂボタン」を押す
; 　c 　：「Ｃボタン」を押す
; 　x 　：「Ｘボタン」を押す
; 　y 　：「Ｙボタン」を押す
; 　z 　：「Ｚボタン」を押す
; 　s 　：「スタートボタン」を押す
;
; ★記号★（入力効果を変化させる命令）
;
; 　/ 　：（スラッシュ）キーやボタンを「押しっぱなし」にしている事を認識する場合に追加する
;
; 　　（例）：　/b       = Ｂボタンを押したままにする
; 　　　　　　　/F       = 前キーを押したままにする
; 　　　　　　　/U,z     = 上キーを押したままＺボタンを入力する
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　~ 　：（チルダ）キーやボタンが「離された時」を認識する場合に追加する
;
; 　　（例）：　~x       = Ｘボタンを離す
; 　　　　　　　~DF      =「前斜め下」のキーを離す
; 　　　　　　　~DB,F,c  =「後ろ斜め下」を離した後に前キー・Ｃボタンの順番に入力する
;
; 　　　　　　※「ボタンを離すまでの時間（溜め時間）」も設定する事が出来る
;
; 　　　　　　　~30x     = Ｘボタンを押したままにして、３０フレーム以上経ったら離す
; 　　　　　　　~50B,F,a = 後ろキーを５０フレームまで溜めて前キー・Ａボタンの順番に入力する
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　$ 　：（ドル）方向キーの「複数の内どれかが入力されている事」を認識する場合に追加する
;
; 　　（例）：　$B       =「後方」「後ろ斜め下」「後ろ斜め上」のどれかが入力されている状態
; 　　　　　　　$UF      =「前」「上」「前斜め上」のどれかが入力されている状態
;
; 　　　　　　※この記号は「方向キー」でしか使えません。
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　+ 　：（プラス）ボタンを「同時押し」している事を認識する場合に追加する
;
; 　　（例）：　x+y      = ＸボタンとＹボタンを同時押しする
; 　　　　　　　a+b+c    = ＡボタンとＢボタンとＣボタンを同時押しする
;
; 　　　　　　※この記号は「ボタン」でしか使えません。
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　> 　：（グレーターザン）大なり（Win版で追加された記号）
; 　　　　　　　　　　　　「他のキーが入力されていない事を確認して、そのキーを押す」場合
;
; 　　（例）：　a,>~a    = Ａボタン以外が入力されていない状態でＡボタンを離す
; 　　　　　　　F,>~F,>F = 前キー以外が入力されていない状態で前キーを離し、
;　　　　　　　　　　　　　もう一度前キーを入力する
;
;-------------------------------------------------------------------------------
; ●これらの記号は全て組み合わせて使う事が出来る●
;
; 　　（例）：　~80$DB,DF,F,/a+y+c
; 　　　　　　　
; 　　　　　　「後方」「下」「後ろ斜め下」のどれかを８０フレームまで溜めて
; 　　　　　　「前斜め下」→「前」を入力した後、ＡとＹとＣを同時押ししたままにする

;===============================
;AI起動
[Command]
name = "AI0"
Command=a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
time = 0
buffer.time = 0
[Command]
name = "AI1"
Command=b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b
time = 0
buffer.time = 0
[Command]
name = "AI2"
Command=c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
time = 0
buffer.time = 0
[Command]
name = "AI3"
Command=x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
time = 0
buffer.time = 0
[Command]
name = "AI4"
Command=y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
time = 0
buffer.time = 0
[Command]
name = "AI5"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI6"
Command=s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
time = 0
buffer.time = 0
[Command]
name = "AI7"
Command=F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F
time = 0
buffer.time = 0
[Command]
name = "AI8"
Command=D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D
time = 0
buffer.time = 0
[Command]
name = "AI9"
Command=B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B
time = 0
buffer.time = 0
[Command]
name = "AI10"
Command=U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U
time = 0
buffer.time = 0
[Command]
name = "AI11"
Command=a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
time = 0
buffer.time = 0
[Command]
name = "AI12"
Command=c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
time = 0
buffer.time = 0
[Command]
name = "AI13"
Command=x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
time = 0
buffer.time = 0
[Command]
name = "AI14"
Command=y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
time = 0
buffer.time = 0
[Command]
name = "AI15"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI16"
Command=s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
time = 0
buffer.time = 0
[Command]
name = "AI17"
Command=a,B,c,x,y,z,s,B,D,F,U,a,b,c,x,y,z,s,s
time = 0
buffer.time = 0
[Command]
name = "AI18"
Command=a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
time = 0
buffer.time = 0
[Command]
name = "AI19"
Command=b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b
time = 0
buffer.time = 0
[Command]
name = "AI20"
Command=c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
time = 0
buffer.time = 0
[Command]
name = "AI21"
Command=x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
time = 0
buffer.time = 0
[Command]
name = "AI22"
Command=y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
time = 0
buffer.time = 0
[Command]
name = "AI23"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI24"
Command=s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
time = 0
buffer.time = 0
[Command]
name = "AI25"
Command=F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F
time = 0
buffer.time = 0
[Command]
name = "AI26"
Command=D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D
time = 0
buffer.time = 0
[Command]
name = "AI27"
Command=B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B
time = 0
buffer.time = 0
[Command]
name = "AI28"
Command=U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U
time = 0
buffer.time = 0
[Command]
name = "AI29"
Command=a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
time = 0
buffer.time = 0
[Command]
name = "AI30"
Command=c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
time = 0
buffer.time = 0
[Command]
name = "AI31"
Command=x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
time = 0
buffer.time = 0
[Command]
name = "AI32"
Command=y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
time = 0
buffer.time = 0
[Command]
name = "AI33"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI34"
Command=s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
time = 0
buffer.time = 0
[Command]
name = "AI35"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI36"
Command=z,z,z,z,z,z,a,a,a,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI37"
Command=z,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI38"
Command=z,z,z,z,z,a,a,a,z,z,z,z,z,a,a,a,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI39"
Command=z,z,z,z,z,a,a,a,z,z,z,z,z,z,a,a,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI40"
Command=z,z,z,z,a,a,a,z,z,z,z,a,z,z,a,a,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI41"
Command=z,z,z,a,z,z,z,z,z,z,z,z,z,a,a,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI42"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI43"
Command=z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,a,a,z
time = 0
buffer.time = 0
[Command]
name = "AI44"
Command=z,z,a,a,a,a,z,z,z,z,z,z,z,z,z,a,a,a,z
time = 0
buffer.time = 0
[Command]
name = "AI45"
Command=z,z,z,z,z,z,a,a,z,z,z,z,z,a,a,a,a,z,z
time = 0
buffer.time = 0
[Command]
name = "AI46"
Command=z,z,z,z,z,z,z,z,a,a,a,a,a,a,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI47"
Command=z,z,z,a,a,a,a,z,z,z,z,z,z,z,z,z,z,z,z
time = 0
buffer.time = 0
[Command]
name = "AI48"
Command=z,z,z,z,z,a,a,a,z,z,z,a,a,a,z,z,a,z,a
time = 0
buffer.time = 0
[Command]
name = "AI49"
Command=z,z,z,z,a,a,a,z,z,z,z,z,a,a,a,z,z,z,z
time = 0
buffer.time = 0

;------------------------------------------------------------------------------
;-| 超必殺技 |-----------------------------------------------------------------

;※名前が同じならば、違うコマンドでも同じステートの技を出す事が可能。

[Command]
name = "Battou_Katana"
command = ~$B , $D , $F , z
time = 45


[Command]
name = "Sayonara,Chansaw"
command = ~$D , DB , $B , $D , DB , $B , z
time = 60

[Command]
name = "We_Can_Be"
command = ~$B, F, F ,z
time = 30


[Command]
name = "TANK_mk1"
command = ~$F, D, U ,z
time = 30


[Command]
name = "OW_Y"
command = ~D , D , a , a , z
time = 45


;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------

[Command]
name = "HELPME"
command = ~D, DF, F, c

[Command]
name = "s_chansaw"
command = ~F , $D , $F ,  a
time = 30

[Command]
name = "Sniper_shot"
command = ~B, F , y

[Command]
name =  "KoumahouKakkoiiPose"
command = ~F, F ,c
time = 15

[Command]
name =  "KoumahouKakkoiiPose2"
command = ~B, B ,c
time = 15

[Command]
name =  "Tornado"
command = ~F, F ,a
time = 15

[Command]
name =  "Nkebo_Poseidon"
command = ~F, F ,b
time = 15

[Command]
name = "SummerSalt"
command = ~8$D , $U , b
time = 20

[Command]
name = "Zukkoke_Chansaw"
command = ~D , D , $F ,a
time = 20

;============
;投げ

[Command]
name = "SpiralDDT"
command = /$F , a
time = 1

;===================
;通常技
;===================

[command]
name = "Chansaw"
command = /$F , a 
time = 1

[command]
name = "SittingPickAxe"
command = /$DF , a
time = 1

[command]
name = "StrkPickaxe"
command = /$F , a
time = 1

;------------------------------
;=============モード変更や各種トリガーコントロール(3)=================
[Command]
name = "ExplosiveSwitch"
command = /$D , c

[Command]
name = "SoundUP"
command = x+a
time = 4

[Command]
name = "Hyper_Mode"
command = /b , y
time = 3

[Command]
name = "EndCharge"
command = ~c
time = 1

;------------------------------------------------------------------------------
;-| ボタン単発 (4)|---------------------------------------------------------------
;------------
;------------
;------------
;------------
[Command]
name = "prsfwd"   
command = /F
time = 2

[Command]
name = "prsback"  
command = /B
time = 2

[Command]
name = "prsup"   
command = /U
time = 2

[Command]
name = "prsdown"  
command = /D
time = 2

;------------------------------------------------------------------------------
;-| キー２回連続入力,リカバリー(8) |---------------------------------------------------------

[Command]
name = "recovery" ;必須コマンド名
command = a
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = b
buffer.time = 1
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = c
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = x
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = y
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = z
time = 1

[Command]
name = "FF"       ;必須コマンド名
command = F, F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B, B
time = 10


;------------------------------------------------------------------------------
;-| 方向キー＋ボタン (15)|---------------------------------------------------------

[Command]
name="a"
command=a
time=1
[Command]
name="b"
command=b
time=1
[Command]
name="c"
command=c
time=1
[Command]
name="x"
command=x
time=1
[Command]
name="y"
command=y
time=1
[Command]
name="z"
command=z
time=1
[Command]
name="start"
command=s
time=1
[command]
name="fwd"
command=F
time=1
[command]
name="back"
command=B
time=1
[command]
name="up"
command=U
time=1
[command]
name="down"
command=D
time=1
;-| 方向キー おしっぱ|

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1


;============================================================================== 第４部
; ステートエントリーパート（技などを出せるようにするための条件を設定）
;==============================================================================
;------------------------------------------------------------------------------
; コマンド名と入力するコマンドを設定しただけじゃ意味が無いので、ここから
;「実際に入力したコマンドでどの番号のステートをどういう条件で出せるか」
; を決めなければならない。
;
; ステートコントローラ「ChangeState」しか使わないけど、
; そんなに難しくないのでトリガーを覚えてたらすぐ出来る。
;
; ここさえ押さえておけば簡単なトリガー設定の流れは覚えられるかと。
;
; エントリーの順番にはある程度の法則があるけど、
; おまけフォルダの「小ネタ.txt」を参照。（波動拳が暴発ﾅﾝﾀﾗｶﾝﾀﾗ）
;
; ChangeStateなどステートコントローラの基本的な設置例は
; おまけフォルダの「テンプレート.txt」を参照。
;------------------------------------------------------------------------------
; ■準常時監視ステート（－１）■
; コマンドファイル（のステートエントリーパート）に必要な項目です。
; 絶対に消してはいけないので要注意。
;
; 通常の食らい状態以外の「P2StateNo」や「TargetState」等で制御された、
; 作成者が任意に指定した相手側の食らいステートに限り、
; 登録したステートコントローラが有効にはなりません。
;------------------------------------------------------------------------------

[Statedef -1] ;←この行は絶対に消さないでね。必須項目です。

;==============================================================================
; 超必殺技
;==============================================================================
;------------------------------------------------------------------------------



;------------------------------------------------------------------------------
; ここで↑にて実際に使っている「スマッシュカンフーアッパーのChangeState」を例に
; 見て行きましょ！m9っ｀Д´)
;
; まず特定のコマンドを入力したいならば、
; 必ず『呼び出すコマンドのトリガー』は設定しましょう。
; 特殊な条件でない限り、コマンドは通常「triggerall」の方で設定した方が良い。
;
;「triggerall」とは『有効になる状況を限定するための条件』を指定する。
; triggerallの条件が有効にならない限り、trigger1以降の条件も有効にはならない。
; 何個でも増やせる。ステート作成の基本テクニックの一つなので覚えておいてね。
; しかしtriggerallはtrigger1以降が無いと「単体では」使えないので注意。
;（trigger1以降を全てコメント化してM.U.G.E.Nでそのキャラを選んで試してみよう）
;
;
; ※『パワーゲージ』は「スーパーコンボゲージ」や「超必殺技ゲージ」などで
; 　呼ばれてる部分のゲージです。
; 　ゲージが「１０００ポイント」なら『レベル１』と同じ意味になります。
;
; 　まぁパッと見、M.U.G.E.Nのパワーゲージって仕組みが
; 　ストＺＥＲＯシリーズの「スーパーコンボレベルゲージ」まんまだよね（苦笑
;------------------------------------------------------------------------------

;=========================;AI;================================

[State -1, ヘルプミー！(Helper 呼び出し) AI 1]
type = ChangeState
value = 401 + (random % 2)
triggerall =  Alive
triggerall = var(55) = 1 && roundstate = 2
triggerall = power > 500
triggerall = isHelper != 1
triggerall = p2bodydist X = [-10,300]
triggerall = enemy,pos Y = [-20,20]
triggerall = random < 3
trigger1 = ctrl
trigger1 = statetype = S
trigger1 = NumHelper(1401) = 0 ;ＩＤナンバー「1401」のヘルパーが画面中に１個も出てない時

[State -1, We Can BE AI 2]
type = ChangeState
value = 3655
triggerall =  Alive
triggerall = var(55) = 1 && roundstate = 2 && ctrl = 1
triggerall = fvar(29) > 50 && power > 2000
triggerall = isHelper != 1
triggerall = !(statetype = A) 
trigger1 = p2bodydist X = [-10,40]
trigger1 = p2bodydist Y = [0,40]
trigger1 = random < 25 && enemy,movetype = H
trigger1 = power < 2500

[State -1, 結月、抜刀。 AI 3]
type = ChangeState
value = 3500
triggerall =  Alive
triggerall = var(55) = 1 
triggerall = power > 999
triggerall = isHelper != 1
triggerall = ctrl = 1
triggerall = !(statetype = A) 
triggerall = (p2bodydist X = [-80,80]) && (p2bodydist Y = [0,20])
trigger1 = fvar(29) <= 200  && (random % 20 = 1 && power < 2400)
trigger2 = fvar(29) <= 300 && (random % 40 = 1 && power < 2600)
trigger3 = fvar(29) >= 300 && (random % 100 = 1 && power < 2800)


[State -1, 結月、抜刀,カウンター。 AI 4]
type = ChangeState
value = 3501
triggerall =  Alive
triggerall = var(55) = 1
triggerall = power > 1500
triggerall = isHelper != 1
triggerall = Pos Y < -5 && pos Y >= 0
triggerall = enemy,movetype = A
triggerall = movetype = H  || stateno = [120,155]
triggerall = (p2bodydist X = [-80,80]) && (p2bodydist Y = [0,20])
trigger1 = fvar(29) <= 200  && (random % 10 = 1 && power < 2400)
trigger2 = fvar(29) <= 300 && (random % 20 = 1 && power < 2600)
trigger3 = fvar(29) >= 300 && (random % 60 = 1 && power < 2800) 

[state -1, サヨナラチェーンソー AI 5]
type = changeState
value = 3650
triggerall =  Alive
triggerall = var(55) = 1 
triggerall = (fVar(29) >= 299 && power > 2999) || ( fVar(29) > 260 && power > 2999 && var(54) = [1,3] )
triggerall = isHelper != 1
triggerall = random % 4 = 1
trigger1 = statetype = S 
trigger1 = ctrl = 1
trigger1 = ABS(P2bodydist X) < 40 &&  ABS(P2bodydist Y) < 40

[State -1, tank MK1 AI]
type = ChangeState
value = 3505
triggerall =  Alive
triggerall = var(55) = 1
triggerall = power > 2999
triggerall = isHelper != 1
triggerall = ctrl = 1
triggerall = statetype != C
trigger1 = (p2bodydist X = [-120,120])
trigger1 = ( random > 750 && life < 250) || ( random > 900 && life < 500 ) || ( random > 980 )




[State -1, OWY AI 6]
type = ChangeState
value = 3600
triggerall =  Alive
triggerall = var(55) = 1 
triggerall = Var(58) = 1
triggerall = power > 2999
triggerall = random > 999
triggerall = isHelper != 1
trigger1 = ctrl = 1
trigger1 = statetype = S 
trigger2 = statetype = C
trigger3 = stateno = [0,900]



;------

[State -1, スナイピング AI 7]
type = ChangeState
value = 301
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist Y) > 10
triggerall = Abs(P2Dist X) > 60 && random % 10 = 1 || Abs(P2Dist X) > 20 && random % 30 = 1
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = var(50) > 2

[State -1, ポセイドン式ヌケボー AI 8]
type = ChangeState
value = 220
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) > 150
triggerall = Abs(P2Dist Y) < 40
triggerall = random % 20 = 1
trigger1 = statetype = S || statetype = A
trigger1 = ctrl

[state -1, トルネード AI 9]
type = Changestate
value = 350
triggerall =  Alive
triggerall = var(55) = 1
triggerall = stateno != 235
triggerall = var(50) > 3 && var(54) = 1 || var(50) > 7 && var(54) = 0
triggerall = Ifelse(Prevstateno = 235 , time > 12 , 1)
triggerall = statetype != A
triggerall = Abs(P2Dist X) = [0,100]
triggerall = var(52) > 5  
triggerall = random % 2 = 0
trigger1 = ctrl
trigger2 = stateno = 350
trigger2 = time > 49
trigger2 = enemy,movetype = H

[State -1, 昇竜チェンソー(地) AI 10]
type = ChangeState
value = 235
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) < 40
triggerall = Abs(P2Dist Y) < 20
triggerall = random % 30 = 1
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl
trigger3 = stateno = 204 
trigger3 = time > 10 

[State -1, 昇竜チェンソー(空) AI 11]
type = ChangeState
value = 236
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) < 40
triggerall = Abs(P2Dist Y) < 20
triggerall = random % 30 = 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ズッコケチェーンソー AI 12]
type = Changestate
value = 215
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) > 40 && Abs(P2Dist X) < 200
triggerall = random % 30 = 1
triggerall = Enemy,Pos Y > -40
trigger1 = statetype = S
trigger1 = ctrl

[state -1 , サマーソルトキック AI 13]
type = changestate
value = 352
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) < 20
triggerall = Abs(P2Dist Y) > 10 && Abs(P2Dist Y) < 50
triggerall = vel Y  < 0
trigger1 = statetype = A
trigger1 = ctrl

[state -1, スパイラッDDT AI 14]
type = changestate
value = 410
triggerall =  Alive
triggerall = var(55) = 1
trigger1 = abs(P2Dist X) < 60
trigger1 = P2Dist Y < 90
trigger1 = statetype = A
trigger1 = ctrl

[state -1, サウンドアップ AI 15]
type = changestate
value = 420
triggerall =  Alive
triggerall = var(55) = 1 && Life > 0
triggerall = isHelper != 1
triggerall = var(50) > 11
trigger1 = ctrl = 1
trigger1 = statetype != C
trigger1 = (random % 750 = 0) || (Life < 200 && random % 50 = 0)
trigger2 = ( stateno = [5000,5110] ) || ( StateNo = [120,140])
trigger2 = (random % 250 = 0) || (Life < 200 && random % 50 = 0)

[state -1,OverD AI 16(Getting Hit)]
type = Changestate
value = 700
triggerall =  Alive
triggerall = var(55) = 1 && Life > 0
triggerall = isHelper != 1
triggerall = fvar(29) > 100 
triggerall = var(54) = 0
triggerall = (( StateNo = [5000,5110] ) || ( StateNo = [120,140] )) 
triggerall = fvar(29) > 100
trigger1 = fvar(29) <= 200  && (random % 250 = 1 && power < 2400)
trigger2 = fvar(29) <= 300 && (random % 500 = 1 && power < 2600)
trigger3 = fvar(29) >= 300 && (random % 800 = 1 && power < 2800)

[state -1,OverD AI 16(Controlable)]
type = Changestate
value = 700
triggerall =  Alive
triggerall = var(55) = 1 && Life > 0
triggerall = isHelper != 1
triggerall = fvar(29) > 100 
triggerall = var(54) = 0
triggerall = ctrl = 1
triggerall = fvar(29) > 200 
trigger1 = fvar(29) < 300 && (random % 750 = 1 && power < 2800)
trigger2 = fvar(29) = 300

[state -1, 光魔法　かっこいいポーズ AIO]
type = changestate
value = 300
triggerall =  Alive
triggerall = var(55) = 1  && Life > 0
triggerall = Abs(vel X) > 0 
trigger1 = ctrl
trigger1 = Abs (P2Dist X) > 50 && ( random % 50 = 0 ) 
  
;派生通常攻撃
;==================================

[State -1, チェンソー AI 17] ; 6a
type = ChangeState
value = 204
triggerall =  Alive
triggerall = var(55) = 1 
triggerall = Abs(P2Dist X) < 30
triggerall = Abs(P2Dist Y) < 20 
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 204
trigger2 = time > 23
trigger3 = stateno = 203
trigger3 = time > 9
trigger4 = stateno = 201
trigger4 = time > 4


[State -1, つるはしストライク AI 18] ;9a
type = ChangeState
value = 250
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Enemy,Pos Y < 0
triggerall = Abs(P2Dist X) < 70 && Abs(P2BodyDist Y) < 40 
triggerall = random % 20 = 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 251
trigger2 = time > 2
trigger3 = stateno = 253
trigger3 = time > 3
trigger4 = stateno = 250
trigger4 = time > 8


;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------


[State -1, チョップ AI 20] ; A
type = ChangeState
value = 201
triggerall =  Alive
triggerall = var(55) = 1
triggerall = (P2BodyDist X) = [25,30] 
triggerall = Abs(P2BodyDist Y) < 40 
triggerall = random % 5 = 0 || (stateno = 201 && random % 20 != 0)
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 201
trigger2 = time > 5

[State -1, ヤクザキック AI 21] ; b
type = ChangeState
value = 203
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) < 15 
triggerall = random % 20 = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 203
trigger2 = time > 10
trigger3 = stateno = 201
trigger3 = time > 4


[state -1, パンを投げる AI 22] ; Y
type = Changestate
value = 280
triggerall =  Alive
triggerall = var(55) = 1
triggerall = isHelper != 1
triggerall = Abs(P2Dist X) < 95 && Abs(P2Dist X) > 25  
triggerall = random % 50 = 0
trigger1 = Ctrl
trigger1 = statetype = S
trigger2 = stateno = [201,204]
trigger2 = time > 16

;=====

[State -1, ヒップストライク AI 23] ; 空A
type = ChangeState
value = 253
triggerall =  Alive
triggerall = Abs(P2Dist X) < 95 && Abs(P2Dist X) < 25  
triggerall = Pos Y < -30
triggerall = random % 50 = 0
triggerall = var(55) = 1
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ライダーキック AI 24] ; 空B
type = ChangeState
value = 251
triggerall =  Alive
triggerall = Abs(P2Dist X) < 200 
triggerall = Pos Y < -20
triggerall = random % 10 = 0
triggerall = var(55) = 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 220
trigger2 = time > 5 
trigger3 = stateno = 253
trigger3 = time > 3
trigger4 = Stateno = 352
trigger4 = time > 10


[State -1, ショットガン AI 25] ; 空Y
type = ChangeState
value = 256
triggerall =  Alive
triggerall = Abs(P2Dist X) < 300 
triggerall = Pos Y < -30
triggerall = random % 20 = 0
triggerall = var(55) = 1
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [251,253]
trigger2 = time > 3

;=====

[State -1, かがみチョップ AI 26] ;2A
type = ChangeState
value = 270
triggerall =  Alive
triggerall = (P2BodyDist X) = [0 , 15]  
triggerall = Abs(P2BodyDist Y) < 40 
triggerall = random  % 3 = 1 || (stateno = 270  && random % 20) 
triggerall = var(55) = 1
trigger1 = statetype != A
trigger1 = ctrl || stateno = 218
trigger2 = stateno = 270
trigger2 = time > 12

[State -1, スピーカー突き出し AI 27]  ;2B
type = changeState 
value = 271
triggerall =  Alive
triggerall = Abs(P2Dist X) = [0, 50]
triggerall = var(55) = 1
triggerall = NumHelper(1271) < 1
trigger1 = statetype != A
trigger1 = ctrl || stateno = 218
trigger3 = stateno = 270 
trigger3 = time > 2

[State -1, クレイモア置き AI 28] ;2Y
type = ChangeState
value = 240
triggerall =  Alive
triggerall = Abs(P2Dist X) = [50 , 400]
triggerall = random % 50 = 1
triggerall = var(55) = 1
triggerall = NumHelper(241) < 3
triggerall = statetype != A
triggerall = var(10) = 0
triggerall = ctrl || stateno = 218
trigger1 = ifelse(PrevstateNo = 240 , ifelse( NumHelper(241) <  3 , time > 30 , 0) , 1 )
trigger2 = stateNo = [270,272]
trigger2 = time > 5

[State -1, かがみつるはし AI 19]  ;3a
type = ChangeState
value = 272
triggerall =  Alive
triggerall = var(55) = 1
triggerall = Abs(P2Dist X) < 40 && Abs(P2Dist Y) < 30 
triggerall = random % 10 = 0
trigger1 = statetype != A
trigger1 = ctrl || stateno = 218
trigger2 = stateno = 272
trigger2 = time > 14
trigger3 = stateno = 271
trigger3 = time > 2
trigger4 = stateno = 270
trigger4 = time > 2

[state -1, チャージ AI 29'']
type = Changestate
value = 290
triggerall =  Alive
triggerall = var(55) = 1
triggerall = statetype != A
triggerall = power < powermax
triggerall = isHelper != 1
triggerall = Prevstateno != 290
triggerall = ctrl = 1
trigger1 = ( abs(p2bodydist X) > 20)
trigger1 = Enemy,Statetype = L

;------
[state -1 歩く AI 29]
type = ChangeState
value = 20
triggerall =  Alive
triggerall = Stateno != 20
triggerall = var(55) = 1
triggerall = ctrl
triggerall = Enemy,StateType = A
triggerall = ( p2bodydist X = [10,30])
triggerall = power < 1000
trigger1 = !(statetype = A)
 
[State -1, 走る AI 30]
type = ChangeState
value = 100
triggerall =  Alive
triggerall = Stateno != 101
triggerall = Stateno != 20
triggerall = var(55) = 1
triggerall = ctrl
triggerall = !( p2bodydist X = [0,90])||( p2bodydist X = [90,250])
triggerall = power < 1000
trigger1 = !(statetype = A)

[State -1, バックステップ AI 31]
type = ChangeState 
value = 115
triggerall =  Alive
triggerall = var(55) = 1
triggerall = !( Abs(p2bodydist X = [50,900)))
triggerall = random % 30 = 0
triggerall = Enemy,HitDefAttr = SCA , NA , SA , HA , NT , ST, HT
trigger1 = statetype = S
trigger1 = stateno = !(115)
trigger1 = ctrl

[State -1, しゃがみ AI 32]
type = ChangeState 
value = 10
triggerall =  Alive
triggerall = var(55) = 1
triggerall = random % 30 = 0
triggerall = Abs(p2bodydist X) = [0,50]
triggerall = Enemy,HitDefAttr = SCA , NA , SA , HA , NT , ST, HT
trigger1 = statetype = S
trigger1 = stateno = !(115)
trigger1 = ctrl

[State -1, ジャンプ AI 33]
type = ChangeState 
value = 40 + ifelse(StateType = A,5,0) 
triggerall =  Alive
triggerall = var(55) = 1
triggerall = !(Abs(p2bodydist X) = [0,50])
triggerall = Abs(p2bodydist Y) < 30 || Enemy,Pos Y < -120  
trigger1 = statetype = S
trigger1 = stateno = !(115)
trigger1 = ctrl


[state -1, ジャンプ AI用変数設定 (1)]
type = varset
triggerall =  Alive
trigger1 = Abs(p2bodydist X) > 50
trigger1 = random % 30 = 0
var(1) = 1

[state -1, ジャンプ AI用変数設定 (0)]
type = varset
triggerall =  Alive
trigger1 = random % 30 = 0
trigger1 = Enemy,HitDefAttr = SCA , NP , SP , HP
var(1) = 0

[state -1, ジャンプ AI用変数設定 (-1)]
type = varset
triggerall =  Alive
trigger1 = random % 30 = 0
trigger1 = Enemy,HitDefAttr = SCA , NA , SA , HA , NT , ST, HT
var(1) = -1



;=============================================================

;==============================================================================
; ヒサツ技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, ヘルプミー！(Helper 呼び出し)]
type = ChangeState
value = 402 + (random % 2)
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "HELPME"
triggerall = power > 500
triggerall = isHelper != 1
trigger1 = ctrl
trigger1 = statetype = S
trigger1 = NumHelper(1401) = 0 ;ＩＤナンバー「1401」のヘルパーが画面中に１個も出てない時


[State -1, We Can  BE]
type = ChangeState
value = 3655
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "We_Can_Be"
triggerall = fvar(29) > 50
triggerall = power > 2000
triggerall = isHelper != 1
trigger1 = ctrl = 1
trigger1 = statetype = S 
trigger2 = statetype = C

[State -1, 結月、抜刀,カウンター。]
type = ChangeState
value = 3501
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Battou_Katana"
triggerall = power > 1500
triggerall = isHelper != 1
triggerall = Pos Y > -5
trigger1 = ctrl = 1
trigger1 = movetype = H 
trigger2 = stateno = [120,155]

[State -1, 結月、抜刀。]
type = ChangeState
value = 3500
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Battou_Katana"
triggerall = power > 999
triggerall = isHelper != 1
trigger1 = ctrl = 1
trigger1 = statetype = S 

[State -1, tank MK1]
type = ChangeState
value = 3505
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "TANK_mk1"
triggerall = power > 2999
triggerall = isHelper != 1
trigger1 = ctrl = 1
trigger1 = statetype = A 

[state -1, サヨナラチェーンソー]
type = changeState
value = 3650
triggerall = var(55) != [1,2]
triggerall = command = "Sayonara,Chansaw"
triggerall = (fVar(29) >= 300 && power > 2999) || ( fVar(29) >= 260 && power > 2999 && var(54) = [1,3] )
triggerall = isHelper != 1
trigger1 = statetype = S 
trigger1 = ctrl = 1

[State -1, OWY]
type = ChangeState
value = 3600
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "OW_Y"
triggerall = Var(58) = 1
triggerall = power > 2999
triggerall = isHelper != 1
trigger1 = ctrl = 1
trigger1 = statetype = S 
trigger2 = statetype = C
trigger3 = stateno = [0,900]

;------------------------------------------------------------------------------

[state -1, チャージ]
type = Changestate
value = 290
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = statetype != A
triggerall = power < powermax
triggerall = command = "c"
triggerall = isHelper != 1
trigger1 = ctrl = 1


;------------------------------------------------------------------------------
;ワッザ

[state -1, 光魔法　かっこいいポーズ]
type = changestate
value = 300
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = Abs(vel X) > 1 
triggerall = command = "KoumahouKakkoiiPose" || command = "KoumahouKakkoiiPose2"
trigger1 = statetype != C
trigger1 = ctrl

[State -1, スナイピング]
type = ChangeState
value = 301
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Sniper_shot"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = var(50) > 2

[State -1, ポセイドン式ヌケボー]
type = ChangeState
value = 220
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Nkebo_Poseidon"
trigger1 = statetype = S || statetype = A
trigger1 = ctrl

[state -1, トルネード]
type = Changestate
value = 350
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Tornado" 
triggerall = stateno != 235
triggerall = var(50) > 3 && var(54) = 1 || var(50) > 7 && var(54) = 0
triggerall = Ifelse(Prevstateno = 235 , time > 12 , 1)
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 350
trigger2 = time > 49

[State -1, 昇竜チェンソー]
type = ChangeState
value = 235
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "s_chansaw"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl
trigger3 = stateno = 204 
trigger3 = time > 10 

[State -1, 昇竜チェンソー]
type = ChangeState
value = 236
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "s_chansaw"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, 昇竜チェンソー]
type = Changestate
value = 215
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Zukkoke_Chansaw"
trigger1 = statetype = S
trigger1 = ctrl

[state -1 , サマーソルトキック]
type = changestate
value = 352
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "SummerSalt"
triggerall = vel Y  < 0
trigger1 = statetype = A
trigger1 = ctrl

[state -1, スパイラッDDT]
type = changestate
value = 410
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "SpiralDDT"
trigger1 = P2Dist X < 60
trigger1 = P2Dist Y < 90
trigger1 = statetype = A
trigger1 = ctrl

[state -1, サウンドアップ]
type = changestate
value = 420
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "SoundUP"
triggerall = isHelper != 1
triggerall = var(50) > 11
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = [5000,5210]
trigger2 = 1

[state -1, MAX OD ,OD Mode , Burst]
type = Changestate
value = 700
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Hyper_Mode"
triggerall = isHelper != 1
triggerall = fvar(29) > 100
triggerall = var(54) = 0
trigger1 = ctrl = 1
trigger2 = ( stateno = [5000,5110] ) || ( StateNo = [120,140] )


;派生通常攻撃
;==================================





;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, チェンソー] ; 6a
type = ChangeState
value = 204
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "Chansaw"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 204
trigger2 = time > 23
trigger3 = stateno = 203
trigger3 = time > 9
trigger4 = stateno = 201
trigger4 = time > 4


[State -1, チョップ] ; A
type = ChangeState
value = 201
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 201
trigger2 = time > 5

[State -1, ヤクザキック] ; b
type = ChangeState
value = 203
triggerall = var(55) != 1 && (var(55) != 2) 
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 203
trigger2 = time > 10
trigger3 = stateno = 201
trigger3 = time > 4

[state -1, パンを投げる] ; Y
type = Changestate
value = 280
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "y"
triggerall = isHelper != 1
trigger1 = Ctrl
trigger1 = statetype = S
trigger2 = stateno = [201,204]
trigger2 = time > 16

;=====

[State -1, つるはしストライク] ;9a
type = ChangeState
value = 250
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "StrkPickaxe"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 251
trigger2 = time > 2
trigger3 = stateno = 253
trigger3 = time > 3
trigger4 = stateno = 250
trigger4 = time > 8

[State -1, ヒップストライク] ; 空A
type = ChangeState
value = 253
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ライダーキック] ; 空B
type = ChangeState
value = 251
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 220
trigger2 = time > 5 
trigger3 = stateno = 253
trigger3 = time > 3
trigger4 = Stateno = 352
trigger4 = time > 10


[State -1, ショットガン] ; 空Y
type = ChangeState
value = 256
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [251,253]
trigger2 = time > 3


;=====

[State -1, かがみつるはし]  ;3a
type = ChangeState
value = 272
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "SittingPickAxe"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 272
trigger2 = time > 14
trigger3 = stateno = 271
trigger3 = time > 2
trigger4 = stateno = 270
trigger4 = time > 2

[State -1, かがみチョップ] ;2A
type = ChangeState
value = 270
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "a"
trigger1 = statetype = C
trigger1 = ctrl || stateno = 218
trigger2 = stateno = 270
trigger2 = time > 8

[State -1, スピーカー突き出し]  ;2B
type = changeState
value = 271
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "b"
triggerall = NumHelper(1271) < 1
trigger1 = statetype = C
trigger1 = ctrl || stateno = 218
trigger3 = stateno = 270
trigger3 = time > 2

[State -1, クレイモア置き] ;2Y
type = ChangeState
value = 240
triggerall = var(55) != 1 && (var(55) != 2)
triggerall = command = "y"
triggerall = NumHelper(241) < 3
triggerall = statetype = C
triggerall = var(10) = 0
triggerall = ctrl || stateno = 218
trigger1 = ifelse(PrevstateNo = 240 , ifelse( NumHelper(241) <  3 , time > 30 , 0) , 1 )
trigger2 = stateNo = [270,272]
trigger2 = time > 5


; 移動関連
;------------------------------------------------------------------------------

[State -1, 走る]
type = ChangeState
value = 100
triggerall = var(55) != 1 && (var(55) != 2)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, バックステップ]
type = ChangeState
value = 105
triggerall = var(55) != 1 && (var(55) != 2)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===================================

[State -1, Left]
Type = Helper
Trigger1 = !NumHelper(6105+id)&&!IsHelper&&RoundState<3&&Alive
HelperType = Normal
Name = "Left_Edge"
ID = 6105+id
pos = 160,524288
PosType = left
facing = 1
StateNo = 6100
KeyCtrl = 0
Ownpal = 0
supermovetime=524288
pausemovetime=524288
persistent = 0
IgnoreHitPause = 1

[State -1, Right]
Type = Helper
Trigger1 = !NumHelper(6100+id)&&!IsHelper&&RoundState<3&&Alive
HelperType = Normal
Name = "Right_Edge"
ID = 6100+id
pos= 160,524288
PosType = left
StateNo = 6100
facing = -1
KeyCtrl = 0
Ownpal = 0
supermovetime=524288
pausemovetime=524288
persistent = 0
IgnoreHitPause = 1

[State -3]
type=ChangeState
trigger1 = ishelper
trigger1 = (ishelper(6100+root,id)||ishelper(6105+root,id))&&stateno!=6100
value=6100

;--------------------------------------------------

;画面恥を認識するヘルパー
[Statedef 6100]
Type = A
Ctrl = 0
Anim = 00
Velset = -5,0
Movetype = I
Physics = N
Sprpriority = 1

[State 6100]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 6100]
type = NotHitBy
value = SCA
trigger1 = 1

;[State a]
;type = PlaySnd
;trigger1 = 1
;value = 2,1

[State 6100]
type = PlayerPush
trigger1 = 1
value = 0

[State 6100]
type = SprPriority
trigger1 = 1
value = -5

[State 6100]
type=selfstate
trigger1=!ishelper
value=0

[state 6100]
Type = Projectile
Trigger1 = Time = 0
ProjID = ifelse(ishelper(6100+root,ID),6100,6105)
Projanim = 0
Projremovetime = -1
Velocity = -5,0
projhits = 524288
projmisstime = 524288
projpriority = 524288
projsprpriority = -524288
Projedgebound = 524288
projstagebound = const(size.ground.front)
Offset = 0,524288
supermovetime = 524288
pausemovetime = 524288

[state 6100]
type = velset
Trigger1 = !Root,NumProjID(ifelse(ishelper(6100+root,ID),6100,6105)) && time
x = 0
y = 0

[State 6100]
type = DisplayToClipboard
Trigger1 = root,var(59) = -1
Trigger1 = ishelper
text = "ROOT X=%f P2X=%f"
params = rootdist X,p2Bodydist X
ignorehitpause = 1

[State 6100]
Type = DestroySelf
Trigger1 = ishelper && (RoundState > 3 || Root,Life <= 0)
