⟨Split⟩←•Import"../bqn-libs/strings.bqn"

input←(0<≠)¨⊸/¨" "⊸Split¨10↓¨•FLines"input"

Times←{𝕊t‿d:
  a‿b←2÷˜+t(-∾+)√(t×t)-4×d
  a‿b↩⟨⌈a,⌊b⟩
  a+↩d=a×t-a
  b-↩d=b×t-b
  a‿b
}

input1←⍉>•ParseFloat¨¨input
•Show ×´1+|-´˘Times˘input1

input2←•ParseFloat¨∾¨input
•Show 1+|-´Times input2
