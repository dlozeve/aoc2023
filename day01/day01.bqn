≢i←•FLines"input"
# Part 1
•Show +´+´¨10‿1⊸×¨'0'-˜(⊑∾⊑∘⌽)¨(∊⟜('0'+↕10)⊸/)¨i

# Part 2
digits←⟨"1","one","2","two","3","three","4","four","5","five","6","six","7","seven","8","eight","9","nine"⟩
ExtractNums←{
  table←⍷⟜𝕩¨digits
  pres←⊑¨1⊸∊¨table
  pos←⊑¨⊐⟜1¨table
  (⍋pres/pos)⊏pres/⥊⍉2‿9⥊1+↕9
}
•Show +´+´¨10‿1⊸×¨(⊑∾⊑∘⌽)¨ExtractNums¨i
# Doesn't work because of things like "oneight" which should give ⟨1⟩ instead of ⟨1,8⟩

t←•FLines"test"
•Show +´+´¨10‿1⊸×¨(⊑∾⊑∘⌽)¨ExtractNums¨t
