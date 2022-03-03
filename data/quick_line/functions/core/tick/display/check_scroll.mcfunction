#> quick_line:core/tick/display/check_scroll
#
# スクロールしているか確認する
#
# @output
#   storage quick_line:temp
#       out.Success : boolean
#           スクロールしたか否か
#       out.Scroll : string ("left", "right")
#           スクロール方向
#
# @within function quick_line:core/tick/display/check_update

#>
# @private
    #declare score_holder $SelectedSlot
    #declare score_holder $LastSelectedSlot

# OhMyDat
    function #oh_my_dat:please

# 現在選択中のスロット、最後に選択したスロット を取得
    execute store result score @s QuickLine run data get entity @s SelectedItemSlot
    execute store result score $LastSelectedSlot QuickLine run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].QuickLine.LastSelectedSlot

# スクロール方向を計算
    scoreboard players operation $SelectedSlot QuickLine = @s QuickLine
    scoreboard players operation $SelectedSlot QuickLine -= $LastSelectedSlot QuickLine

# 返り値を設定
    data modify storage quick_line:temp out.Success set value true
    execute if score $SelectedSlot QuickLine matches 0 run data modify storage quick_line:temp out.Success set value false
    execute unless score $SelectedSlot QuickLine matches 0..4 unless score $SelectedSlot QuickLine matches -8..-5 run data modify storage quick_line:temp out.Scroll set value "left"
    execute unless score $SelectedSlot QuickLine matches 5..8 unless score $SelectedSlot QuickLine matches -4..0 run data modify storage quick_line:temp out.Scroll set value "right"

# 最後に選択したスロットを取得
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].QuickLine.LastSelectedSlot int 1.0 run scoreboard players get @s QuickLine

# リセット
    scoreboard players reset $SelectedSlot QuickLine
    scoreboard players reset $LastSelectedSlot QuickLine
