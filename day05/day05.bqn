⟨Split⟩←•Import"../bqn-libs/strings.bqn"

≢input←(@+10‿10)Split•FChars"input"
≢seeds←•ParseFloat¨" "Split 1⊑": "Split⊑input
≢ms←•ParseFloat¨¨¨" "⊸Split¨¨(0<≠)¨⊸/¨1⊸↓¨(@+10)⊸Split¨ 1↓input

Map←{𝕊rs:
  F←{𝕊x: {𝕊d‿s‿l: (s≤x)∧x<s+l}¨rs}
  V←{𝕊x: {𝕊d‿s‿l: d+x-s}¨rs}
  {⊑((F𝕩)/V𝕩)∾𝕩}
}

seed2loc←{𝕨∘𝕩}´⌽Map¨ms
•Show ⌊´Seed2Loc¨seeds
