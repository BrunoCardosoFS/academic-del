// =============================================================================
// LISTAS E SUMÁRIO — Páginas pré-textuais reutilizáveis (ABNT NBR 14724)
// Independentes do tipo de documento; podem ser usadas em TCC, artigo, etc.
// =============================================================================


// 9. LISTA DE ILUSTRAÇÕES / FIGURAS (ABNT NBR 14724)
#let lista-figuras() = page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 12pt)[LISTA DE ILUSTRAÇÕES]
  ]
  #v(15mm)
  #outline(title: none, target: figure.where(kind: image))
]

// 10. LISTA DE TABELAS (ABNT NBR 14724)
#let lista-tabelas() = page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 12pt)[LISTA DE TABELAS]
  ]
  #v(15mm)
  #outline(title: none, target: figure.where(kind: table))
]

// 11. LISTA DE ABREVIATURAS E SIGLAS (ABNT NBR 14724)
// Parâmetros:
//   siglas        — dicionário estático passado pelo usuário
//   siglasState   — state() acumulado ao longo do corpo do texto
#let lista-siglas(siglas, siglasState) = page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 12pt)[LISTA DE ABREVIATURAS E SIGLAS]
  ]
  #v(15mm)
  #context {
    let dinamicas = siglasState.final()
    let todas = siglas
    if type(siglas) == dictionary {
      for (k, v) in dinamicas {
        todas.insert(k, v)
      }
    } else {
      todas = dinamicas
    }

    if todas.len() > 0 {
      let items = todas.pairs().sorted(key: it => it.at(0))
      grid(
        columns: (auto, 1fr),
        column-gutter: 20pt,
        row-gutter: 10pt,
        align: (left, left),
        ..items
          .map(((s, d)) => (
            text(weight: "bold")[#s],
            [#d],
          ))
          .flatten()
      )
    }
  }
]

// 12. LISTA DE SÍMBOLOS (Opcional)
// Parâmetros:
//   simbolos — dicionário de símbolos passado pelo usuário
#let lista-simbolos(simbolos) = page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 12pt)[LISTA DE SÍMBOLOS]
  ]
  #v(15mm)
  #let items = simbolos.pairs().sorted(key: it => it.at(0))
  #grid(
    columns: (auto, 1fr),
    column-gutter: 20pt,
    row-gutter: 10pt,
    align: (left, left),
    ..items
      .map(((s, d)) => (
        text(weight: "bold")[#s],
        [#d],
      ))
      .flatten()
  )
]

// 13. SUMÁRIO (ABNT NBR 6027)
#let sumario() = page(numbering: none)[
  #align(center)[
    #text(weight: "regular", size: 16pt)[SUMÁRIO]
  ]
  #v(15mm)
  #show outline.entry: it => {
    if it.level == 1 {
      v(12pt, weak: true)
      // strong(upper(it))
      it
    } else if it.level == 2 {
      pad(left: 1em)[#it]
    } else if it.level == 3 {
      pad(left: 2em)[#it]
    } else {
      pad(left: 3em)[#it]
    }
  }
  #outline(title: none, indent: 0pt)
]
