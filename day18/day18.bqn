⟨Split⟩←•Import"../bqn-libs/strings.bqn"
ds‿ls‿cs←<˘⍉>" "⊸Split¨•FLines"input"

Area←{𝕊d‿l:
  p←+`l×d⊏⟨0‿1,1‿0,0‿¯1,¯1‿0⟩
  a←|2÷˜-´+˝(⌽˘1⊸⌽)⊸×>p
  ⌈a+1+(+´l)÷2
}

•Show Area⟨"RDLU"⊐∾ds,•ParseFloat¨ls⟩

Hex2Num←{16⊸×⊸+˜´⌽(∾"0a"+⟜↕¨10‿6)⊐𝕩}
•Show Area <˘⍉Hex2Num¨>5⊸(↓⋈↑)¨2⊸↓¨¯1⊸↓¨cs
