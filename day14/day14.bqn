input←>•FLines"input"

Slide←{
  sinds←¯1∾/'#'=𝕩
  inds←∾(≠↑sinds˙)⊸+1+↕¨≠¨⊔1-˜+˝sinds<⌜/'O'=𝕩
  'O'˙¨⌾(inds⊸⊏) '#'˙¨⌾((1↓sinds)⊸⊏) (≠𝕩)⥊'.'
}
Load←+´((⌽1+(↕≠))×(+´˘'O'⊸=))
•Show Load Slide˘⌾⍉ input

Cycle←{Slide˘⌾(⌽˘) Slide˘⌾(⍉⌽) Slide˘ Slide˘⌾⍉ 𝕩}
c←{(<Cycle⊑𝕩)∾𝕩}•_while_{¬⊑(<⊑𝕩)∊1↓𝕩} ⟨input⟩
a‿m←-˜`/⌽((<⊑)≡¨⊢)c
•Show Load ((m×⌈a÷m)+m|1e9)⊑⌽c

