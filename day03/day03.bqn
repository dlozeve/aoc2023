digits←'0'+↕10
n‿m←≢input←>•FLines"input"

sympos←⍉>m(⌊∘÷˜⋈|)/⥊¬input∊digits∾'.'
digpos←(0≠≠)¨⊸/ <˘¨{+`1⊸<|+´˘+`⁼𝕩}⊸⊔ ⍉>m(⌊∘÷˜⋈|)/⥊input∊digits
near←{∨´⥊1⊸=⌈´¨|¨(<˘sympos)-⌜𝕩}¨digpos
nums←•ParseFloat¨⊑⟜input¨digpos
•Show +´near/nums

gearpos←<˘⍉>m(⌊∘÷˜⋈|)/⥊input='*'
nearnums←{(1=⌈´¨⌊´¨|¨¨𝕩⊸-¨¨digpos)/nums}¨gearpos
•Show +´×´¨(2=≠)¨⊸/nearnums
