#
# y軸対称
# ※Aタグを持つエンティティのy軸方向を対称軸として、Bタグを持つエンティティを対称移動
# 

# 補助軸設置
execute as @e[limit=1,tag=B] at @s positioned ~ ~1 ~ run summon minecraft:marker ~ ~ ~ {NoGravity:1b,Tags:["axis_y","+"]}
execute as @e[limit=1,tag=B] at @s positioned ~ ~-1 ~ run summon minecraft:marker ~ ~ ~ {NoGravity:1b,Tags:["axis_y","-"]}
execute at @e[limit=1,tag=B] as @e[tag=axis_y,distance=..3,limit=2] at @s facing entity @e[tag=axis_y,limit=1,sort=furthest] feet run tp @s ~ ~ ~ ~ ~

# 移動前座標
tellraw @p [{"text":"移動前:"}, {"entity":"@e[limit=1,tag=B]","nbt":"Pos"}]

# y軸対称移動
execute as @e[limit=1,tag=B] at @e[limit=1,tag=A,sort=nearest] rotated as @e[tag=axis_y,limit=1,sort=nearest] facing ^ ^ ^-1 positioned ^ ^ ^64 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^32 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^16 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^8 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^4 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^2 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^1 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^0.5 if entity @s[distance=99..100] rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^0.5 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^0.25 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^0.125 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^0.0625 rotated as @e[limit=2,tag=axis_y] positioned ^ ^ ^0.03125 if entity @s[distance=99.93..100] facing entity @s feet positioned as @s positioned ^ ^ ^-100 rotated ~180 ~ positioned ^ ^ ^100 run tp @s ~ ~ ~ ~ ~

# 移動後座標
tellraw @p [{"text":"移動後:"}, {"entity":"@e[limit=1,tag=B]","nbt":"Pos"}]

# 補助軸解放
kill @e[tag=axis_y]
