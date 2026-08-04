// =============================================================================
// ELEMENTOS PRÉ-TEXTUAIS — Páginas opcionais reutilizáveis (ABNT NBR 14724)
// Independentes do tipo de documento; podem ser usadas em TCC, artigo, etc.
// =============================================================================


// 4. DEDICATÓRIA (ABNT NBR 14724)
// Parâmetros:
//   corpo — conteúdo da dedicatória (content)
#let dedicatoria(corpo) = page(numbering: none)[
  #v(1fr)
  #align(right)[
    #block(width: 60%)[
      #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
      #set text(style: "italic")
      #corpo
    ]
  ]
]

// 5. AGRADECIMENTOS (ABNT NBR 14724)
// Parâmetros:
//   corpo — conteúdo dos agradecimentos (content)
#let agradecimentos(corpo) = page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 1em)[AGRADECIMENTOS]
  ]
  #v(15mm)
  #set par(leading: 0.65em, justify: true, first-line-indent: 12.5mm)
  #corpo
]

// 6. EPÍGRAFE (ABNT NBR 14724)
// Parâmetros:
//   corpo — content simples, ou dicionário com campos `texto` e `autor`
#let epigrafe(corpo) = page(numbering: none)[
  #v(1fr)
  #align(right)[
    #block(width: 60%)[
      #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
      #if type(corpo) == dictionary [
        #text(style: "italic")[" #corpo.texto "]
        #v(3mm)
        #align(right)[#corpo.autor]
      ] else [
        #corpo
      ]
    ]
  ]
]

// 7 / 8. RESUMO / ABSTRACT — página genérica de resumo (ABNT NBR 6028)
// Pode ser usada para qualquer idioma (pt, en, es, fr, …).
//
// Parâmetros:
//   titulo        — título em caixa alta (ex: "RESUMO", "ABSTRACT", "RESUMEN")
//   corpo         — texto do resumo (content)
//   tituloPalavras — rótulo do campo de palavras-chave (ex: "Palavras-chave:", "Keywords:")
//   palavrasChave  — array de strings com as palavras-chave; none para omitir
#let resumo(
  titulo: "RESUMO",
  corpo,
  tituloPalavras: "Palavras-chave",
  palavrasChave: none,
) = page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 12pt)[#titulo]
  ]
  #v(15mm)
  #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
  #corpo
  #if palavrasChave != none [
    #v(10mm)
    *#tituloPalavras:* #palavrasChave.join("; ").
  ]
]
