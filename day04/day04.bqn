⟨Split⟩←•Import"../bqn-libs/strings.bqn"

ParseCard←{⌽•ParseFloat¨¨ (0<≠)¨⊸/¨ " "⊸Split¨ " | "Split ⊑⌽": "Split 𝕩}
n←≢cards←ParseCard¨•FLines"input"

MatchingNums←≠(∊/⊣)´
Score←⌊2⋆¯1+MatchingNums
•Show +´Score¨cards

copies←n∾MatchingNums¨cards
•Show +´⌈´ (⥊⟜0¨↕1+n)∾¨ {(1↓𝕨)+𝕩×⊑𝕨}` (⌽↕1+n)↑¨ ⥊⟜1¨copies
