m‿n←≢grid←'0'-˜>•FLines"input"

dirs←∾⟜-⋈⟜⌽0‿1
Inbounds←∧´(0‿0⊸≤∧<⟜m‿n)
Step←{a‿b𝕊q‿v‿dists:
  u←2↑⊑q
  d←{𝕊0‿0‿0: 9‿9 ; (2⊑𝕩)⊑dirs}⊑q
  ns←(Inbounds¨⊑∘⌽¨)⊸/ u⊸+¨¨∾{𝕩⊸×¨¨(↑⟜(1+↕b)¨a+↕1+b-a)}¨dirs
  ns↩((|d)⊸≢¨|-⟜u¨⊑¨ns)/ns
  ns↩ns∾¨¨⊑¨(dirs⊐<)¨u⊸-˜¨⊑¨ns
  ns↩(¬(⊑∘⌽¨ns)⊑v)/ns
  newdists←dists ⌊ (((⊑q)⊑dists)++´¨⊑⟜grid¨2⊸↑¨¨ns)⌾((⊑∘⌽¨ns)⊸⊑)dists
  changedns←((⊑⟜newdists<⊑⟜dists)¨⊑∘⌽¨ns) / ns
  newq←(⍋⊑⟜newdists)⊸⊏ (⊑∘⌽¨changedns)∾1↓q
  newv←1⌾((⊑q)⊸⊑)v
  newq‿newv‿newdists
}
Target←⌊´ ((n-1)⊸⊏ (m-1)⊸⊏) #(m‿n-1)⊑⌊˝⎉1

q←⟨0‿0‿0⟩
v←m‿n‿4⥊0
ub←1e4
dists←0˙¨⌾((0‿0⊸∾¨↕4)⊸⊑) m‿n‿4⥊ub
·‿·‿d1←1‿3 Step•_while_{ub=Target 2⊑𝕩} q‿v‿dists
•Show Target d1

·‿·‿d2←4‿10 Step•_while_{ub=Target 2⊑𝕩} q‿v‿dists
•Show Target d2
