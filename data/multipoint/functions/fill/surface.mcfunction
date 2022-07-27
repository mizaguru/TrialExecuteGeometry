#
# 多実行点fill
# ※A,Bタグを持つエンティティを対角とする直方体の表面をfill
# 

# 実行用のAEC
execute as @e[tag=A,limit=1] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["AB","A"]}
execute as @e[tag=B,limit=1] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["AB","B"]}

# x,y,z座標すべてにおいてAタグを持つエンティティを正の方向とする
# x
execute store result score $max _ run data get entity @e[type=area_effect_cloud,tag=A,limit=1] Pos[0] 1000
execute store result score $min _ run data get entity @e[type=area_effect_cloud,tag=B,limit=1] Pos[0] 1000
execute if score $max _ < $min _ run scoreboard players operation $max _ >< $min _
execute store result entity @e[type=area_effect_cloud,tag=A,limit=1] Pos[0] double 0.001 run scoreboard players get $max _ 
execute store result entity @e[type=area_effect_cloud,tag=B,limit=1] Pos[0] double 0.001 run scoreboard players get $min _ 
# y
execute store result score $max _ run data get entity @e[type=area_effect_cloud,tag=A,limit=1] Pos[1] 1000
execute store result score $min _ run data get entity @e[type=area_effect_cloud,tag=B,limit=1] Pos[1] 1000
execute if score $max _ < $min _ run scoreboard players operation $max _ >< $min _
execute store result entity @e[type=area_effect_cloud,tag=A,limit=1] Pos[1] double 0.001 run scoreboard players get $max _ 
execute store result entity @e[type=area_effect_cloud,tag=B,limit=1] Pos[1] double 0.001 run scoreboard players get $min _ 
# z
execute store result score $max _ run data get entity @e[type=area_effect_cloud,tag=A,limit=1] Pos[2] 1000
execute store result score $min _ run data get entity @e[type=area_effect_cloud,tag=B,limit=1] Pos[2] 1000
execute if score $max _ < $min _ run scoreboard players operation $max _ >< $min _
execute store result entity @e[type=area_effect_cloud,tag=A,limit=1] Pos[2] double 0.001 run scoreboard players get $max _ 
execute store result entity @e[type=area_effect_cloud,tag=B,limit=1] Pos[2] double 0.001 run scoreboard players get $min _ 

# 補助軸設置
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[090f,000f],Tags:["axis","x","+"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[-90f,000f],Tags:["axis","x","-"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[000f,090f],Tags:["axis","y","+"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[000f,-90f],Tags:["axis","y","-"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[180f,000f],Tags:["axis","z","+"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[000f,000f],Tags:["axis","z","-"]}

# 多実行点fill
# Aを含む3面
execute as @e[type=area_effect_cloud,tag=B,limit=1] at @s align xyz if entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~64 ~ ~ rotated as @e[tag=x,limit=2] positioned ^ ^ ^32 rotated as @e[tag=x,limit=2] positioned ^ ^ ^16 rotated as @e[tag=x,limit=2] positioned ^ ^ ^8 rotated as @e[tag=x,limit=2] positioned ^ ^ ^4 rotated as @e[tag=x,limit=2] positioned ^ ^ ^2 rotated as @e[tag=x,limit=2] positioned ^ ^ ^1 rotated as @e[tag=x,limit=2] positioned ^ ^ ^0.5 align xyz if entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~ ~ ~64 rotated as @e[tag=z,limit=2] positioned ^ ^ ^32 rotated as @e[tag=z,limit=2] positioned ^ ^ ^16 rotated as @e[tag=z,limit=2] positioned ^ ^ ^8 rotated as @e[tag=z,limit=2] positioned ^ ^ ^4 rotated as @e[tag=z,limit=2] positioned ^ ^ ^2 rotated as @e[tag=z,limit=2] positioned ^ ^ ^1 rotated as @e[tag=z,limit=2] positioned ^ ^ ^0.5 align xyz if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~64 ~ rotated as @e[tag=y,limit=2] positioned ^ ^ ^32 rotated as @e[tag=y,limit=2] positioned ^ ^ ^16 rotated as @e[tag=y,limit=2] positioned ^ ^ ^8 rotated as @e[tag=y,limit=2] positioned ^ ^ ^4 rotated as @e[tag=y,limit=2] positioned ^ ^ ^2 rotated as @e[tag=y,limit=2] positioned ^ ^ ^1 rotated as @e[tag=y,limit=2] positioned ^ ^ ^0.5 align xyz if entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~1 ~1 ~1 unless entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~-1 ~-1 ~-1 run setblock ~ ~ ~ stone
# Bを含む3面
execute as @e[type=area_effect_cloud,tag=B,limit=1] at @s align xyz if entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~64 ~ ~ rotated as @e[tag=x,limit=2] positioned ^ ^ ^32 rotated as @e[tag=x,limit=2] positioned ^ ^ ^16 rotated as @e[tag=x,limit=2] positioned ^ ^ ^8 rotated as @e[tag=x,limit=2] positioned ^ ^ ^4 rotated as @e[tag=x,limit=2] positioned ^ ^ ^2 rotated as @e[tag=x,limit=2] positioned ^ ^ ^1 rotated as @e[tag=x,limit=2] positioned ^ ^ ^0.5 align xyz if entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~ ~ ~64 rotated as @e[tag=z,limit=2] positioned ^ ^ ^32 rotated as @e[tag=z,limit=2] positioned ^ ^ ^16 rotated as @e[tag=z,limit=2] positioned ^ ^ ^8 rotated as @e[tag=z,limit=2] positioned ^ ^ ^4 rotated as @e[tag=z,limit=2] positioned ^ ^ ^2 rotated as @e[tag=z,limit=2] positioned ^ ^ ^1 rotated as @e[tag=z,limit=2] positioned ^ ^ ^0.5 align xyz if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~64 ~ rotated as @e[tag=y,limit=2] positioned ^ ^ ^32 rotated as @e[tag=y,limit=2] positioned ^ ^ ^16 rotated as @e[tag=y,limit=2] positioned ^ ^ ^8 rotated as @e[tag=y,limit=2] positioned ^ ^ ^4 rotated as @e[tag=y,limit=2] positioned ^ ^ ^2 rotated as @e[tag=y,limit=2] positioned ^ ^ ^1 rotated as @e[tag=y,limit=2] positioned ^ ^ ^0.5 align xyz if entity @e[type=area_effect_cloud,tag=A,dx=100,dy=100,dz=100] positioned ~-1 ~-1 ~-1 unless entity @e[type=area_effect_cloud,tag=B,dx=-100,dy=-100,dz=-100] positioned ~1 ~1 ~1 run setblock ~ ~ ~ stone

# 実行用のAEC解放
kill @e[tag=AB,limit=2]

# 補助軸解放
kill @e[tag=axis]
