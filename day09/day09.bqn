⟨Split⟩←•Import"../bqn-libs/strings.bqn"

input←>•ParseFloat¨¨" "⊸Split¨•FLines"input"
Deltas←1⊸(↓--⊸↓)
diffs←0‿¯1⊸⊏¨Deltas⍟(↕≠)˘input
•Show +´⥊1⊸⊑¨diffs
•Show +´⊑˘-˜`⌾⌽˘⊑¨diffs
