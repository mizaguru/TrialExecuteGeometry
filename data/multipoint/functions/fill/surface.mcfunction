#
# 多実行点fill
# ※A,Bタグを持つエンティティを対角とする直方体の表面をfill
# 

# x,y,z座標すべてにおいてAタグを持つエンティティを正の方向とする
# x
execute store result score $max _ run data get entity @e[tag=A,limit=1] Pos[0] 1000
execute store result score $min _ run data get entity @e[tag=B,limit=1] Pos[0] 1000
execute if score $max _ < $min _ run scoreboard players operation $max _ >< $min _
execute store result entity @e[tag=A,limit=1] Pos[0] double 0.001 run scoreboard players get $max _ 
execute store result entity @e[tag=B,limit=1] Pos[0] double 0.001 run scoreboard players get $min _ 
# y
execute store result score $max _ run data get entity @e[tag=A,limit=1] Pos[1] 1000
execute store result score $min _ run data get entity @e[tag=B,limit=1] Pos[1] 1000
execute if score $max _ < $min _ run scoreboard players operation $max _ >< $min _
execute store result entity @e[tag=A,limit=1] Pos[1] double 0.001 run scoreboard players get $max _ 
execute store result entity @e[tag=B,limit=1] Pos[1] double 0.001 run scoreboard players get $min _ 
# z
execute store result score $max _ run data get entity @e[tag=A,limit=1] Pos[2] 1000
execute store result score $min _ run data get entity @e[tag=B,limit=1] Pos[2] 1000
execute if score $max _ < $min _ run scoreboard players operation $max _ >< $min _
execute store result entity @e[tag=A,limit=1] Pos[2] double 0.001 run scoreboard players get $max _ 
execute store result entity @e[tag=B,limit=1] Pos[2] double 0.001 run scoreboard players get $min _ 

# 補助軸設置
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[090f,000f],Tags:["axis","x","+"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[-90f,000f],Tags:["axis","x","-"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[000f,090f],Tags:["axis","y","+"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[000f,-90f],Tags:["axis","y","-"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[180f,000f],Tags:["axis","z","+"]}
summon minecraft:marker ~ ~ ~ {NoGravity:1b,Rotation:[000f,000f],Tags:["axis","z","-"]}

# AB同時指定用のタグを付与
tag @e[tag=A,limit=1] add AB
tag @e[tag=B,limit=1] add AB

# 多実行点fill
# xy平面
execute as @e[tag=B,limit=1] at @s if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~63 ~ ~ rotated as @e[tag=x,limit=2] positioned ^ ^ ^32 rotated as @e[tag=x,limit=2] positioned ^ ^ ^16 rotated as @e[tag=x,limit=2] positioned ^ ^ ^8 rotated as @e[tag=x,limit=2] positioned ^ ^ ^4 rotated as @e[tag=x,limit=2] positioned ^ ^ ^2 rotated as @e[tag=x,limit=2] positioned ^ ^ ^1 rotated as @e[tag=x,limit=2] positioned ^ ^ ^0.5 if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~ ~63 rotated as @e[tag=z,limit=2] positioned ^ ^ ^32 rotated as @e[tag=z,limit=2] positioned ^ ^ ^16 rotated as @e[tag=z,limit=2] positioned ^ ^ ^8 rotated as @e[tag=z,limit=2] positioned ^ ^ ^4 rotated as @e[tag=z,limit=2] positioned ^ ^ ^2 rotated as @e[tag=z,limit=2] positioned ^ ^ ^1 rotated as @e[tag=z,limit=2] positioned ^ ^ ^0.5 if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~64 ~ rotated as @e[tag=y,limit=2] positioned ^ ^ ^32 rotated as @e[tag=y,limit=2] positioned ^ ^ ^16 rotated as @e[tag=y,limit=2] positioned ^ ^ ^8 rotated as @e[tag=y,limit=2] positioned ^ ^ ^4 rotated as @e[tag=y,limit=2] positioned ^ ^ ^2 rotated as @e[tag=y,limit=2] positioned ^ ^ ^1 rotated as @e[tag=y,limit=2] positioned ^ ^ ^0.5 positioned ~ ~1 ~ if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~-1 ~ positioned ~-100 ~-100 ~ if entity @e[tag=AB,dx=200,dy=200] positioned ~100 ~100 ~ run setblock ~ ~ ~ stone
# yz平面
execute as @e[tag=B,limit=1] at @s if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~63 ~ ~ rotated as @e[tag=x,limit=2] positioned ^ ^ ^32 rotated as @e[tag=x,limit=2] positioned ^ ^ ^16 rotated as @e[tag=x,limit=2] positioned ^ ^ ^8 rotated as @e[tag=x,limit=2] positioned ^ ^ ^4 rotated as @e[tag=x,limit=2] positioned ^ ^ ^2 rotated as @e[tag=x,limit=2] positioned ^ ^ ^1 rotated as @e[tag=x,limit=2] positioned ^ ^ ^0.5 if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~ ~63 rotated as @e[tag=z,limit=2] positioned ^ ^ ^32 rotated as @e[tag=z,limit=2] positioned ^ ^ ^16 rotated as @e[tag=z,limit=2] positioned ^ ^ ^8 rotated as @e[tag=z,limit=2] positioned ^ ^ ^4 rotated as @e[tag=z,limit=2] positioned ^ ^ ^2 rotated as @e[tag=z,limit=2] positioned ^ ^ ^1 rotated as @e[tag=z,limit=2] positioned ^ ^ ^0.5 if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~64 ~ rotated as @e[tag=y,limit=2] positioned ^ ^ ^32 rotated as @e[tag=y,limit=2] positioned ^ ^ ^16 rotated as @e[tag=y,limit=2] positioned ^ ^ ^8 rotated as @e[tag=y,limit=2] positioned ^ ^ ^4 rotated as @e[tag=y,limit=2] positioned ^ ^ ^2 rotated as @e[tag=y,limit=2] positioned ^ ^ ^1 rotated as @e[tag=y,limit=2] positioned ^ ^ ^0.5 positioned ~ ~1 ~ if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~-1 ~ positioned ~ ~-100 ~-100 if entity @e[tag=AB,dy=200,dz=200] positioned ~ ~100 ~100 run setblock ~ ~ ~ stone
# xz平面
execute as @e[tag=B,limit=1] at @s if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~63 ~ ~ rotated as @e[tag=x,limit=2] positioned ^ ^ ^32 rotated as @e[tag=x,limit=2] positioned ^ ^ ^16 rotated as @e[tag=x,limit=2] positioned ^ ^ ^8 rotated as @e[tag=x,limit=2] positioned ^ ^ ^4 rotated as @e[tag=x,limit=2] positioned ^ ^ ^2 rotated as @e[tag=x,limit=2] positioned ^ ^ ^1 rotated as @e[tag=x,limit=2] positioned ^ ^ ^0.5 if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~ ~63 rotated as @e[tag=z,limit=2] positioned ^ ^ ^32 rotated as @e[tag=z,limit=2] positioned ^ ^ ^16 rotated as @e[tag=z,limit=2] positioned ^ ^ ^8 rotated as @e[tag=z,limit=2] positioned ^ ^ ^4 rotated as @e[tag=z,limit=2] positioned ^ ^ ^2 rotated as @e[tag=z,limit=2] positioned ^ ^ ^1 rotated as @e[tag=z,limit=2] positioned ^ ^ ^0.5 if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~64 ~ rotated as @e[tag=y,limit=2] positioned ^ ^ ^32 rotated as @e[tag=y,limit=2] positioned ^ ^ ^16 rotated as @e[tag=y,limit=2] positioned ^ ^ ^8 rotated as @e[tag=y,limit=2] positioned ^ ^ ^4 rotated as @e[tag=y,limit=2] positioned ^ ^ ^2 rotated as @e[tag=y,limit=2] positioned ^ ^ ^1 rotated as @e[tag=y,limit=2] positioned ^ ^ ^0.5 positioned ~ ~-1 ~ if entity @e[tag=A,dx=100,dy=100,dz=100] positioned ~ ~1 ~ positioned ~-100 ~1 ~-100 if entity @e[tag=AB,dx=200,dz=200] positioned ~ ~-2 ~ if entity @e[tag=AB,dx=200,dz=200] positioned ~100 ~1 ~100 run setblock ~ ~ ~ stone

# AB同時指定用のタグをはく奪
tag @e[tag=AB,limit=2] remove AB

# 補助軸解放
kill @e[tag=axis]
