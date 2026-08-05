// =============================================================================
// ESTILOS ABNT — Regras de formatação reutilizáveis
// Fonte de verdade para set/show rules compartilhados entre tipos de documento.
// Version: 0.1.0
// -----------------------------------------------------------------------------
// Copyright (c) 2026. Bruno Cardoso.
// Licenca: MIT
// =============================================================================

#let defaultFigureGap = 0.65em
#let leadingSimples = 0.4em
#let leadingPadrao = 0.65em

// Aplica as regras de estilo ABNT ao documento.
// Pode ser usada por qualquer tipo de documento (TCC, artigo, relatório, etc.)
//
// Parâmetros:
//   fonte  — família tipográfica principal (padrão: "Arimo", compatível com Arial ABNT)
//   body   — conteúdo do documento
#let aplicar-estilos-abnt(
  fonte: "Arimo",
  body,
) = {
  // Configurações Globais de Página e Margens (ABNT NBR 14724)
  set page(
    paper: "a4",
    margin: (top: 30mm, left: 30mm, right: 20mm, bottom: 20mm),
  )

  set text(
    font: fonte,
    size: 12pt,
    lang: "pt",
    region: "BR",
  )

  // Configurações do Corpo do Texto (ABNT NBR 14724 & NBR 6024)
  set par(
    leading: leadingPadrao,
    justify: true,
    first-line-indent: (amount: 12.5mm, all: true),
  )

  // Formatação de Listas com Marcadores e Numeradas
  set list(
    indent: 12.5mm,
    body-indent: 0.5em,
    marker: ([•], [◦], [–]),
  )

  set enum(
    indent: 12.5mm,
    body-indent: 0.5em,
    numbering: "a)",
  )

  // Hierarquia tipográfica dos Títulos (ABNT NBR 6024)
  set heading(numbering: "1.1.1")

  show heading: it => {
    set text(size: 12pt)
    if it.level == 1 {
      pagebreak(weak: true)
      block(text(weight: "bold")[#upper(it)])
      v(1.5em)
    } else if it.level == 2 {
      v(1.2em)
      block(text(weight: "bold")[#it])
      v(1.2em)
    } else if it.level == 3 {
      v(1em)
      block(text(weight: "regular")[#it])
      v(1em)
    } else {
      v(1em)
      block(text(weight: "regular", style: "italic")[#it])
      v(1em)
    }
  }

  // Formatação de Equações Matemáticas (ABNT NBR 14724)
  set math.equation(numbering: "(1)")
  show math.equation: it => {
    show ",": math.class("normal", ",")
    it
  }

  show quote: it => block(
    pad(
      left: 4cm, // Recuo de 4cm da margem esquerda
      text(
        size: 0.85em, // Fonte menor que o texto padrão
        par(leading: leadingSimples, justify: true, it.body),
      ),
    ),
  )

  // Formatação de Figuras e Tabelas (Legenda superior, Fonte inferior)
  set figure(gap: defaultFigureGap)
  show figure: it => {
    block(width: 100%, breakable: false)[
      #set align(center)
      #if it.has("caption") {
        it.caption
        v(-1em)
        v(it.gap)
      }
      #it.body
    ]
  }

  show figure.caption: it => [
    #set text(size: 10pt)
    #it.supplement #it.counter.display() – #it.body
  ]

  // Formatação da Bibliografia (ABNT NBR 6023)
  show bibliography: it => {
    set par(justify: false, leading: 0.65em)
    set text(size: 12pt)
    it
  }

  body
}
