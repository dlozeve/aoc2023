grid←>•FLines"input"

⟨PBM⟩←•Import"../../bqn-graphics/pnm.bqn"
Mat←{1˙¨⌾(𝕩⊸⊑)(≢grid)⥊0}

Sim←{
  Step←{𝕨𝕊i‿v‿nv:
    {𝕊1: ("img/out"∾(1↓•Fmt 1e4+i)∾".pnm")•file.Chars PBM ¬Mat ⍷⊑¨v ; 0}𝕨
    nexts←{∧´(0⊸≤∧<⟜(≢grid))⊑𝕩}¨⊸/∾{𝕊p‿d:
      {
	𝕊'.'‿·: ⟨⟨p+d,d⟩⟩ ;
	𝕊'/'‿·: ⟨⟨p-⌽d,-⌽d⟩⟩ ;
	𝕊'\'‿·: ⟨⟨p+⌽d,⌽d⟩⟩ ;
	𝕊'|'‿1: ⟨⟨p+d,d⟩⟩ ;
	𝕊'|'‿0: ⟨⟨p+1‿0,1‿0⟩,⟨p-1‿0,-1‿0⟩⟩ ;
	𝕊'-'‿0: ⟨⟨p+d,d⟩⟩ ;
	𝕊'-'‿1: ⟨⟨p+0‿1,0‿1⟩,⟨p-0‿1,-0‿1⟩⟩
      }⟨p⊑grid,|⊑d⟩
    }¨nv
    ⟨i+1,nv∾v,(¬nexts∊v)/nexts⟩
  }
  ⍷⊑¨1⊑𝕨Step•_while_{0≠≠2⊑𝕩} 0‿⟨⟩‿⟨𝕩⟩
}

•Show ≠ 1 Sim⟨0‿0,0‿1⟩

m‿n←≢grid
starts←(⋈⟜1‿0¨0⊸∾¨↕m)∾(⋈⟜¯1‿0¨(m-1)⊸∾¨↕m)∾(⋈⟜0‿1¨∾⟜0¨↕n)∾(⋈⟜¯1‿0¨∾⟜(n-1)¨↕n)
•Show ⌈´≠¨Sim¨starts
