#import "@preview/phonokit:0.5.12": *
#phonokit-init(font: "Noto Sans")
#set page(width: auto, height: auto, margin: 0.5em)
#set text(size: 30pt)
// #feat-matrix("t")
// #feat-matrix("d")
// #feat-matrix("R")

#tableau(
input: ipa("/Enpi:A \\*r /"),
candidates: (
  ipa("[Enpi:A \\*r ]"),
  ipa("[En@pi:A \\*r ]"),
  ipa("[Empi:A \\*r ]"),
  ipa("[ENpi:A \\*r ]" ),
  ipa("[Epi:A \\*r ]")
),
constraints: ("Max", "Dep", "Agree(Pl)", "Ident"),
violations: (
  ("", "", "*!", ""),
  ("", "*!", "", ""),
  ("", "", "", "*"),
  ("", "", "*!", "*"),   
  ("*!", "", "", "")    
),
winner: 2,
shade: true,
dashed-lines: (0,)
)
