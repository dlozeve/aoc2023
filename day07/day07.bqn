input←(5⊸↑⋈6⊸↓)¨•FLines"input"
hands←(('0'+↕10)∾"TJQKA")⊸⊐¨⊑¨input
bids←•ParseFloat¨1⊸⊑¨input

types←⟨1‿1‿1‿1‿1,2‿1‿1‿1,2‿2‿1,3‿1‿1,3‿2,4‿1,⟨5⟩⟩
Ranks←{(⍋types⊐{∨/⁼⊐𝕩}¨∧𝕩)⊏⍋𝕩}
Winnings←{+´(1+↕≠𝕨)×¨𝕩⊏𝕨}
•Show bids Winnings Ranks hands

>hands2←("J"∾('1'+↕9)∾"TQKA")⊸⊐¨⊑¨input
HandType←{
  𝕊(0‿0‿0‿0‿0): ⟨5⟩;
  js←0=𝕩
  (+´js)⊸+⌾⊑ ∨/⁼⊐(¬js)/𝕩
}
Ranks2←{(⍋types⊐HandType¨∧𝕩)⊏⍋𝕩}
•Show bids Winnings Ranks2 hands2
