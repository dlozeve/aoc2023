m‿n←≢input←>•FLines"input"
s←m(⌊∘÷˜∾|)/⥊input='S'
grid←1˙⌾(s⊸⊑)input='.'
dirs←∾⟜-⋈⟜⌽↕2

•Show ≠{⍷(⊑⟜grid¨)⊸/⥊𝕩+⌜dirs}⍟64⟨s⟩

≠ps←{(m‿n⊸|⊑grid˙)¨⊸/⍷⥊𝕩+⌜dirs}⍟((⌊m÷2)+m×↕3)⟨s⟩

# Lagrange polynomial interpolation, arbitrary nodes and values
Lagrange←{x𝕊y:
  d←≠x
  w←÷×˝1˙¨⌾((∾˜¨↕d)⊸⊑)-⌜˜x
  {+´y×w××´¨𝕩⊸-¨/⟜x¨¬⌽⌽⟜(d↑1)¨1+↕d}
}
f←(↕≠ps) Lagrange ≠¨ps
•Show F (26501365-65)÷m

# Lagrange polynomial interpolation with nodes at 0‿1‿2 and values at 𝕩
LagrangeCoeffs←{⌽+˝[[1,-3,2],[1,-2,0],[1,-1,0]]×[0.5,¯1,0.5]×𝕩}
•Show (LagrangeCoeffs ≠¨ps)(+´×⟜(⋆⟜↕⟜3))(26501365-65)÷m
