// =============================================================================
// TEMPLATE DE TCC - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
// Configuração e Estilização Typst conforme Normas ABNT
// Version: 0.1.0
// -----------------------------------------------------------------------------
// Copyright (c) 2026. Bruno Cardoso.
// Licenca: MIT
//
// ISENÇÃO DE RESPONSABILIDADE / DISCLAIMER:
// Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo,
// expressas ou implícitas. Embora tenha sido desenvolvido com o objetivo de
// atender às normas da ABNT e às diretrizes da Universidade Federal de Sergipe
// (UFS), os autores e distribuidores não se responsabilizam por eventuais
// inconsistências, alterações normativas futuras ou exigências específicas de
// bancas e coordenações de curso. Cabe ao usuário final a conferência do
// documento gerado com as exigências de sua respectiva instituição.
// =============================================================================


// Estado global para acumular siglas registradas no corpo do texto
#let _siglasState = state("pibic-siglas-state", (:))

// Função para registrar e exibir siglas ao longo do texto
#let sigla(curta, ..rest) = {
  let pos = rest.pos()
  let named = rest.named()
  let longa = if pos.len() > 0 { pos.at(0) } else { named.at("longa", default: none) }

  if longa != none {
    _siglasState.update(s => {
      s.insert(curta, longa)
      s
    })
    [#longa (#curta)]
  } else {
    [#curta]
  }
}

#let defaultFigureGap = 0.65em

// Função para inserir figuras com indicação automática de fonte (ABNT NBR 14724)
#let figura(body, caption: none, fonte: none, gap: defaultFigureGap, ..rest) = {
  let fonteText = if fonte == none {
    [Fonte: Autoria própria.]
  } else if type(fonte) == str and (fonte.starts-with("Fonte:") or fonte.starts-with("fonte:")) {
    [#fonte]
  } else {
    [Fonte: #fonte]
  }

  let fonteContent = text(size: 10pt)[#fonteText]

  figure(
    stack(dir: ttb, spacing: gap, body, fonteContent),
    caption: caption,
    gap: gap,
    ..rest,
  )
}

// Modelo de TCC Padrão UFS (ABNT NBR 14724)
#let tcc(
  curso: "Engenharia Elétrica",
  autor: "Nome do Aluno",
  titulo: "Título do Trabalho",
  subtitulo: none,
  instituicao: "Universidade Federal de Sergipe",
  local: "São Cristóvão",
  data: "2026",
  orientador: "Nome do Orientador, D. Sc.",
  coorientador: none,
  submissao: none,
  banca: (
    (nome: "Professor Avaliador", instituicao: "Universidade Federal de Sergipe", funcao: "Avaliador"),
    (
      nome: "Nome do Orientador, D. Sc.",
      instituicao: "Universidade Federal de Sergipe",
      funcao: "Orientador",
    ),
  ),
  dedicatoria: none,
  agradecimentos: none,
  epigrafe: none,
  resumo: none,
  abstract: none,
  sumario: true,
  listaFiguras: true,
  listaTabelas: true,
  listaSiglas: true,
  listaSimbolos: false,
  siglas: (:),
  simbolos: (:),
  body,
) = {
  // Configurações Globais de Página e Margens (ABNT NBR 14724)
  set page(
    paper: "a4",
    margin: (top: 30mm, left: 30mm, right: 20mm, bottom: 20mm),
  )

  set text(
    // font: "Arial",
    font: "Arimo",
    size: 12pt,
    lang: "pt",
    region: "BR",
  )

  // Configuração inicial das folhas pré-textuais (sem numeração impressa)
  set page(numbering: none)

  // Texto padrão de submissão da Folha de Rosto / Aprovação
  let textoSubmissao = if submissao != none {
    submissao
  } else [
    Trabalho de Conclusão de Curso submetido à Coordenação de Graduação em #curso da #instituicao como parte dos requisitos necessários para a obtenção do grau de Bacharel em Ciências no Domínio da #curso.
  ]

  // 1. A CAPA (Padrão UFS)
  page(numbering: none)[
    #set par(leading: 1.2em, justify: false, first-line-indent: 0mm)
    #align(center)[
      #image("./medias/images/Brasao.svg", width: 25mm)
      #v(2mm)
      #text(size: 1em)[
        UNIVERSIDADE FEDERAL DE SERGIPE \
        CENTRO DE CIÊNCIAS EXATAS E TECNOLOGIA \
        // DEPARTAMENTO DE ENGENHARIA ELÉTRICA \
        #upper([Curso de Graduação em #curso])
      ] \

      #v(2fr)

      #text(weight: "bold")[#upper(autor)]

      #v(2fr)
      // #text(size: 1.1em)[Trabalho de Conclusão de Curso] \
      // #v(2fr)

      #text(size: 1.2em, weight: "bold")[#upper(titulo)]
      #if subtitulo != none [
        \ #text(size: 1em, weight: "regular")[#subtitulo]
      ]

      #v(3fr)
      #[
        #set par(leading: 1em)
        #local \
        #data
      ]
    ]
  ]

  // 2. FOLHA DE ROSTO (ABNT NBR 14724)
  page(numbering: none)[
    #set par(leading: 1.2em, justify: false, first-line-indent: 0mm)
    #align(center)[
      #text(weight: "bold")[#upper(autor)]

      #v(1fr)
      #text(weight: "bold")[#upper(titulo)]
      #if subtitulo != none [
        \ #text(weight: "regular")[#subtitulo]
      ]

      #v(1fr)
      #grid(
        columns: (1fr, 1.1fr),
        [],
        align(left)[
          #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
          // #set text(size: 10pt)
          #textoSubmissao

          #v(8mm)
          *Orientador:* \
          #orientador
          #if coorientador != none [
            \ \ *Coorientador:* \
            #coorientador
          ]
        ],
      )

      #v(2fr)
      #[
        #set par(leading: 1em)
        #local \
        #data
      ]
    ]
  ]

  // 3. FOLHA DE APROVAÇÃO (ABNT NBR 14724)
  page(numbering: none)[
    #set par(leading: 1.2em, justify: false, first-line-indent: 0mm)
    #let campo(width) = box(
      width: width,
      height: 1em,
      stroke: (bottom: 0.5pt),
      inset: 0pt,
    )[]

    #align(center)[
      #text(weight: "bold")[#upper(autor)]

      #v(1fr)

      #text(weight: "bold")[#upper(titulo)]
      #if subtitulo != none [
        \ #text(weight: "regular")[#subtitulo]
      ]

      #v(1fr)

      #grid(
        columns: (1fr, 1.1fr),
        [],
        align(left)[
          #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
          #textoSubmissao \
          #v(5mm)
          // Nota: #campo(3cm)\
          // #v(3mm)
          Aprovado em: #campo(1.5cm) / #campo(1.5cm) / #campo(1.5cm)
        ],
      )

      #v(1fr)

      #for membro in banca [
        #v(15mm)
        #align(center)[
          #set par(leading: 0.65em)
          #line(length: 65%, stroke: 0.5pt)
          #v(-3mm)
          #text(size: 10pt)[
            *#membro.nome* \
            #membro.instituicao \
            #membro.funcao
          ]
        ]
      ]
    ]
  ]

  // 4. DEDICATÓRIA (Opcional)
  if dedicatoria != none {
    page(numbering: none)[
      #v(1fr)
      #align(right)[
        #block(width: 60%)[
          #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
          #set text(style: "italic")
          #dedicatoria
        ]
      ]
    ]
  }

  // 5. AGRADECIMENTOS (Opcional)
  if agradecimentos != none {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 1em)[AGRADECIMENTOS]
      ]
      #v(15mm)
      #set par(leading: 0.65em, justify: true, first-line-indent: 12.5mm)
      #agradecimentos
    ]
  }

  // 6. EPÍGRAFE (Opcional)
  if epigrafe != none {
    page(numbering: none)[
      #v(1fr)
      #align(right)[
        #block(width: 60%)[
          #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
          #if type(epigrafe) == dictionary [
            #text(style: "italic")[“#epigrafe.texto”]
            #v(3mm)
            #align(right)[#epigrafe.autor]
          ] else [
            #epigrafe
          ]
        ]
      ]
    ]
  }

  // 7. RESUMO (ABNT NBR 6028)
  if resumo != none {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 12pt)[RESUMO]
      ]
      #v(15mm)
      #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
      #if type(resumo) == dictionary [
        #resumo.texto
        #v(10mm)
        *Palavras-chave:* #resumo.palavrasChave.join("; ").
      ] else [
        #resumo
      ]
    ]
  }

  // 8. ABSTRACT (ABNT NBR 14724)
  if abstract != none {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 12pt)[ABSTRACT]
      ]
      #v(15mm)
      #set par(leading: 0.65em, justify: true, first-line-indent: 0pt)
      #if type(abstract) == dictionary [
        #abstract.texto
        #v(10mm)
        *Keywords:* #abstract.keywords.join("; ").
      ] else [
        #abstract
      ]
    ]
  }

  // 9. LISTA DE ILUSTRAÇÕES / FIGURAS (ABNT NBR 14724)
  if listaFiguras {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 12pt)[LISTA DE ILUSTRAÇÕES]
      ]
      #v(15mm)
      #outline(title: none, target: figure.where(kind: image))
    ]
  }

  // 10. LISTA DE TABELAS (ABNT NBR 14724)
  if listaTabelas {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 12pt)[LISTA DE TABELAS]
      ]
      #v(15mm)
      #outline(title: none, target: figure.where(kind: table))
    ]
  }

  // 11. LISTA DE ABREVIATURAS E SIGLAS (ABNT NBR 14724)
  if listaSiglas {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 12pt)[LISTA DE ABREVIATURAS E SIGLAS]
      ]
      #v(15mm)
      #context {
        let dinamicas = _siglasState.final()
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
  }

  // 12. LISTA DE SÍMBOLOS (Opcional)
  if listaSimbolos and simbolos.len() > 0 {
    page(numbering: none)[
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
  }

  // 13. SUMÁRIO (ABNT NBR 6027)
  if sumario {
    page(numbering: none)[
      #align(center)[
        #text(weight: "bold", size: 12pt)[SUMÁRIO]
      ]
      #v(15mm)
      #show outline.entry: it => {
        if it.level == 1 {
          v(12pt, weak: true)
          strong(upper(it))
        } else if it.level == 2 {
          strong(it)
        } else if it.level == 3 {
          text(weight: "regular")[#it]
        } else {
          text(weight: "regular", style: "italic")[#it]
        }
      }
      #outline(title: none, indent: 0pt)
    ]
  }

  // Configurações do Corpo do Texto (ABNT NBR 14724 & NBR 6024)
  set par(
    leading: 0.65em,
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

  // Numeração de páginas no canto superior direito a partir do corpo do texto (ABNT NBR 14724)
  set page(numbering: "1", number-align: top + right)

  // Imprime o corpo do documento
  body
}
