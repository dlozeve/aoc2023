n‿m←≢input←'#'=>•FLines"input"
pos←∾¨´m(⌊∘÷˜⋈|)/⥊input

dists←(+´∘|∘-)⌜˜pos

emptyRows←/(¬∨´˘)input
emptyCols←/(¬∨´˘)⌾⍉input
nempty←{x1‿y1𝕊x2‿y2:
  a←|-´emptyCols⍋y2‿y1
  b←|-´emptyRows⍋x2‿x1
  a+b
}⌜˜pos

•Show 2÷˜+´⥊dists+nempty
•Show 2÷˜+´⥊dists+999999×nempty
