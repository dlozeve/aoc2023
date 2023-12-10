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

# First method, using the parity of the number of vertical pipes crossed on each side
# Only takes into account the ones connecting above, because "FJ" is equivalent to a single "|"
pathmask←1⊸+⌾(path⊸⊑) n‿m⥊0
cleangrid←'.'˙¨⌾((¬pathmask)⊸(/○⥊))grid
inmask←(¬pathmask)∧⍉(↕m){∨´2|+´¨∊⟜"JL|"¨𝕨(↑⋈↓)𝕩}⌜<˘cleangrid
•Show +´⥊inmask

# Second method for part 2, using Pick's theorem and the shoelace formula
# https://en.wikipedia.org/wiki/Pick%27s_theorem
# https://en.wikipedia.org/wiki/Shoelace_formula#Shoelace_formula
# Area inside the polygon, using the shoelace formula (determinant)
a←|2÷˜-´+˝(⌽˘1⊸⌽)⊸×>path
# Number of points in the boundary = length of the path
b←≠path
# Pick's formula to compute the number of points inside the polygon
•Show ⌈a+1-b÷2

## Display the path in the terminal as Unicode box drawing characters
# ReplaceChars←⊑(=⟜"|-FJL7.S"/"┃━┏┛┗┓ █"˙)
# •Out ⥊∾⟜(@+10)˘ReplaceChars¨cleangrid

## Generate an image of the path and its interior
# ⟨PBM,PPM⟩←•Import"../../bqn-graphics/pnm.bqn"
# pixels←3‿3⊸⥊¨⟨
#   9⥊0‿1‿0,
#   0‿0‿0‿1‿1‿1‿0‿0‿0,
#   0‿0‿0‿0‿1‿1‿0‿1‿0,
#   0‿1‿0‿1‿1‿0‿0‿0‿0,
#   0‿1‿0‿0‿1‿1‿0‿0‿0,
#   0‿0‿0‿1‿1‿0‿0‿1‿0,
#   9⥊0,
#   9⥊1,
#   9⥊1,
# ⟩
# ReplaceCharsPixels←⊑(=⟜"|-FJL7.SI"/pixels˙)
# •Out PBM ¬∾˝∾˘´˘ReplaceCharsPixels¨ 'I'˙¨⌾(inmask⊸(/○⥊)) cleangrid

## With color representing the distance from the start
# ⟨Inferno⟩←•Import"../../bqn-graphics/colormaps.bqn"
# pixgrid←ReplaceCharsPixels¨cleangrid
# coloroffset←1500
# colors←⌊255×Inferno¨(coloroffset+2÷˜≠path)÷˜+´path{𝕩⊸+⌾(𝕨⊸⊑)n‿m⥊0}¨coloroffset+⌊˝(⌽≍⊢)↕≠path
# •Out PPM >∾˝∾˘´˘colors{𝕨⊸×¨𝕩}¨pixgrid
