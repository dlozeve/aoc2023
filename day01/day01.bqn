≢i←•FLines"input"
# Part 1
•Show +´+´¨10‿1⊸×¨'0'-˜(⊑∾⊑∘⌽)¨(∊⟜('0'+↕10)⊸/)¨i

# Part 2
ExtractNums←{
  n𝕊"": n;
  n𝕊s:
    digit←+´⟨
      {"one": 1; "two": 2; "six": 6; 0}3↑s,
      {"four": 4; "five": 5; "nine": 9; 0}4↑s,
      {"three": 3; "seven": 7; "eight": 8; 0}5↑s,
      {"1": 1; "2": 2; "3": 3; "4": 4; "5": 5; "6": 6; "7": 7; "8": 8; "9": 9; 0}1↑s,
    ⟩
    ((digit=0)⊑⟨n∾digit,n⟩) 𝕊 1↓s
}
•Show +´+´¨10‿1⊸×¨(⊑∾⊑∘⌽)¨⟨⟩⊸ExtractNums¨i
