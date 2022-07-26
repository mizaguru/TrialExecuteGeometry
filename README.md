# TrialExecuteGeometry
executeコマンド(主にexecute幾何学)でいろんなことを試した結果の残滓。
実用的なものから(処理負荷的に)現実的ではないものまでアウトプットしてみるテスト

## 実行点の増幅
### 距離の測定
A,B間をN等分したN箇所でスコアボードに+1すれば距離が求められるという考え方。
実装の都合上、A,B間を2000等分し、その半分の1000ヶ所でスコアボードに+1している。

### 対称移動
角度と距離は等価というexecute幾何学を利用。
線対称したい軸へ100mで到達できる角度を取得し、100進んで180度回転、-100進むと対称移動できる。

### fill
x,y,z軸方向に実行点を倍々で増やすことで、直方体を作ることができる。
大きさの制御はdx,dy,dzで行っているが、事前準備としてx,y,z座標すべてにおいてAタグを持つエンティティを正の方向へ移動させる必要がある。
(この部分はdataコマンドとscoreboardを利用)
さらに、条件を狭めることで表面や枠のfillが可能となる。(A,Bタグが同平面上にいるならば表面、xyz軸上にいるならば枠)
