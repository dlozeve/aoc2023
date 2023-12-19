⟨Split⟩←•Import"../bqn-libs/strings.bqn"
ws‿ps←0‿1↓¨(+`⟨⟩⊸≡¨)⊸⊔•FLines"input"
p←•ParseFloat¨¨2⊸↓¨¨","⊸Split¨¯1⊸↓¨1⊸↓¨ps
ids‿progs←{":"⊸Split¨¨","⊸Split¨¯1⊸↓¨𝕩}⌾(1⊸⊑)<˘⍉>"{"⊸Split¨ws

ParseProg←{𝕊t‿r: ⟨((⊑"<>"⊐1⊑t)⊑<‿>)⟜(•ParseFloat 2↓t)∘((⊑"xmas"⊐⊑⊑𝕩)⊸⊑),r⟩ ; 𝕩}
w←ParseProg¨¨progs
Apply←{n𝕊⟨⟨r⟩⟩: r ; f‿r←⊑𝕩 ⋄ (F 𝕨)⊑⟨𝕨𝕊(1↓𝕩),r⟩}
Sel←{𝕊"A": ⟨⟨"A"⟩⟩ ; 𝕊"R": ⟨⟨"R"⟩⟩ ;(⊑/𝕩⊸≡¨ids)⊑w}
Run←{𝕩(Apply⟜Sel¨)•_while_{¬∧´⊑¨∊⟜"AR"¨∾𝕩}(≠𝕩)⥊<"in"}
•Show +´∾('A'=∾Run p)/p

ls‿ns←<˘⍉>(⊑⋈((•ParseFloat 2⊸↓)+('>'=1⊸⊑)))¨∾¯1⊸↓¨⊑¨¨progs
b←1⊸∾¨∧¨⊑⟜ns¨¨⊔"xmas"⊐ls
db←1⊸↓¨+`⁼¨∾⟜4001¨b

c←0
{
  c+↩(×´𝕩⊑¨db)×"A"≡⊑Run⟨𝕩⊑¨b⟩
  i←+´∧`0=𝕩
  (i↑¯1+≠¨b)˙⌾(i⊸↑) -⟜1⌾(i⊸⊑) 𝕩
}•_while_{𝕩≢4⥊0}¯1+≠¨b
•Show c+("A"≡⊑Run⟨⊑¨b⟩)××´⊑¨db


