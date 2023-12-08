⟨Split⟩←•Import"../bqn-libs/strings.bqn"

lf←@+10
strinst‿strnet←(lf‿lf)Split •FChars"input"
inst←"LR"⊐strinst
net←{3⊸↑¨↓⟜𝕩¨0‿7‿12}¨lf Split ¯1↓strnet
els←⊑¨net
map←els⊐>1‿2⊸⊏¨net

start‿end←els⊐"AAA"‿"ZZZ"
n←30000
•Show 1+⊑(start{𝕩⊑𝕨⊏map}`n⥊inst)⊐end

starts‿ends←/¨(¯1⊸⊑¨els)⊸=¨"AZ"
•Show •math.LCM´{1+⊑/(𝕩{𝕩⊑𝕨⊏map}`n⥊inst)∊ends}¨starts

