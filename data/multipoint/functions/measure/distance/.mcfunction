#
# 多実行点による距離の測定 
# ※A,Bタグを持つエンティティ間の距離を測定
# 

# 初期化
scoreboard players set $distance _ 0

# 2点にマーカー設置
execute as @e[limit=1,tag=A] at @s run summon minecraft:marker ~ ~ ~ {Tags:["measure_distance","A"]}
execute as @e[limit=1,tag=measure_distance,tag=A] at @s at @e[limit=1,tag=B,sort=nearest] run summon minecraft:marker ~ ~ ~ {Tags:["measure_distance"]}

# 2点のマーカーを互いに反対向き
execute as @e[tag=measure_distance] at @s facing entity @e[limit=1,tag=measure_distance,sort=furthest] feet positioned ^ ^ ^0.1 facing entity @s feet positioned as @s run tp @s ~ ~ ~ ~ ~

# AからB方向へ0.001間隔の実行点を設置
# A-B間の半分を取得
# 各実行点で+2することで、距離を取得
execute as @e[limit=1,tag=measure_distance,tag=A] at @s facing entity @e[limit=1,tag=measure_distance,sort=furthest] feet positioned ^ ^ ^65.536 rotated as @e[tag=measure_distance] positioned ^ ^ ^32.768 rotated as @e[tag=measure_distance] positioned ^ ^ ^16.384 rotated as @e[tag=measure_distance] positioned ^ ^ ^8.192 rotated as @e[tag=measure_distance] positioned ^ ^ ^4.096 rotated as @e[tag=measure_distance] positioned ^ ^ ^2.048 rotated as @e[tag=measure_distance] positioned ^ ^ ^1.024 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.512 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.256 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.128 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.064 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.032 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.016 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.008 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.004 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.002 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.001 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.0005 rotated as @e[tag=measure_distance] positioned ^ ^ ^0.00025 rotated as @e[limit=1,tag=measure_distance,sort=nearest] positioned ^ ^ ^64 if entity @e[limit=1,tag=measure_distance,tag=A,distance=..64] positioned ^ ^ ^-64 run scoreboard players add $distance _ 1

# マーカーの解放
kill @e[limit=2,tag=measure_distance]

# 結果出力
tellraw @p [{"text":"測定値: "},{"score":{"name":"$distance","objective":"_"}}]