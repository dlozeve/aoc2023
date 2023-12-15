⟨Split⟩←•Import"../bqn-libs/strings.bqn"
≠input←","Split⊑•FLines"input"

H←(⊑⌽)0(256|17×+)`-⟜@

•Show +´H¨input

Parse←{
  ⊑'='∊𝕩 ? •ParseFloat⌾(1⊸⊑)'='Split𝕩 ;
  ⊑'-'∊𝕩 ? 1↑'-'Split𝕩
}

Replace←{t‿n𝕊𝕩:
  ⊑(<t)∊⊑¨𝕩 ? i←⊑/((<t)≡¨⊑¨)𝕩 ⋄ t‿n˙⌾(i⊸⊑)𝕩 ;
  𝕩∾⟨𝕨⟩
}

Run←{
  boxes←256⥊⟨⟨⟩⟩
  Step←{
    𝕊⟨t⟩: boxes (((<t)≢¨⊑¨)⊸/)⌾((H t)⊸⊑)↩ ;
    𝕊t‿n: boxes (t‿n⊸Replace)⌾((H t)⊸⊑)↩
  }
  Step¨𝕩
  boxes
}

Pow←+´(1+(↕≠))⊸×
•Show Pow Pow¨ 1⊸⊑¨¨ Run Parse¨ input
