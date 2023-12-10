n‿m←≢grid←>•FLines"input"

Dirs←⊑"|-LJ7F"⊸=/⟨⟨¯1‿0,1‿0⟩,⟨0‿¯1,0‿1⟩,⟨¯1‿0,0‿1⟩,⟨¯1‿0,0‿¯1⟩,⟨0‿¯1,1‿0⟩,⟨0‿1,1‿0⟩⟩˙
Advance←{
  'S'=(⊑𝕩)⊑grid ? 𝕩 ;
  nextpos←(⊑𝕩)+⊑(-´⌽2↑𝕩)⊸≢¨⊸/Dirs(⊑𝕩)⊑grid
  ⟨nextpos⟩∾𝕩
}

spos←m(⌊∘÷˜∾|)/⥊grid='S'
start←⟨spos+0‿1,spos⟩ # works for my input
path←⌽Advance⍟(n×m)start
•Show ⌊2÷˜1-˜≠path

pathmask←1⊸+⌾(path⊸⊑) n‿m⥊0
cleangrid←'.'˙¨⌾((¬pathmask)⊸(/○⥊))grid
inmask←⍉(↕m){∨´2|+´¨∊⟜"JL|"¨𝕨(↑⋈↓)𝕩}⌜<˘cleangrid
•Show +´⥊inmask∧¬pathmask
