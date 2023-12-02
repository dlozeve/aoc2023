⟨Split⟩←•Import"../bqn-libs/strings.bqn"

≢i←•FLines"input"
ParseGame←{
  g‿rs←":"Split 𝕩
  gid←•ParseFloat 1⊑" "Split g
  rs↩" "⊸Split¨¨1↓¨¨","⊸Split¨";"Split rs
  rs↩(+´{
    𝕊n‿"red":   ⟨•ParseFloat n,0,0⟩;
    𝕊n‿"green": ⟨0,•ParseFloat n,0⟩;
    𝕊n‿"blue":  ⟨0,0,•ParseFloat n⟩
  }¨)¨rs
  gid‿rs
}
≢gs←ParseGame¨i

•Show +´(∧´¨∧´¨12‿13‿14⊸≥¨¨1⊸⊑¨gs)/⊑¨gs

•Show +´×´¨⌈´¨1⊸⊑¨gs
