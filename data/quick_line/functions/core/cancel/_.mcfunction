#> quick_line:core/cancel/_
# @within function quick_line:api/cancel

# タイトルを削除
    title @s clear

# タグを削除
    tag @s remove QuickLine.Player

# 表示されるデータを削除する (OhMyDat)
    function #oh_my_dat:please
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].QuickLine.Display
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].QuickLine.Id
