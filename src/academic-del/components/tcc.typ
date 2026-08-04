// =============================================================================
// TEMPLATE DE TCC - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
// Configuração e Estilização Typst conforme Normas ABNT
// Versão: 0.0.2
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

#import "../core/format.typ": *
#import "../core/utils.typ": _siglasState, figura, sigla
#import "../core/listas.typ": lista-figuras, lista-siglas, lista-simbolos, lista-tabelas, sumario as pag-sumario
#import "../core/pretextuais.typ": (
  agradecimentos as pag-agradecimentos, dedicatoria as pag-dedicatoria, epigrafe as pag-epigrafe, resumo as pag-resumo,
)


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
  fonte: "Arimo",
  body,
) = aplicar-estilos-abnt(fonte: fonte, {
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
      #image("../medias/images/Brasao.svg", width: 25mm)
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
  if dedicatoria != none { pag-dedicatoria(dedicatoria) }

  // 5. AGRADECIMENTOS (Opcional)
  if agradecimentos != none { pag-agradecimentos(agradecimentos) }

  // 6. EPÍGRAFE (Opcional)
  if epigrafe != none { pag-epigrafe(epigrafe) }

  // 7. RESUMO (ABNT NBR 6028)
  if resumo != none {
    if type(resumo) == dictionary {
      pag-resumo(
        titulo: "RESUMO",
        resumo.texto,
        tituloPalavras: "Palavras-chave",
        palavrasChave: resumo.palavrasChave,
      )
    } else {
      pag-resumo(titulo: "RESUMO", resumo)
    }
  }

  // 8. ABSTRACT (ABNT NBR 14724)
  if abstract != none {
    if type(abstract) == dictionary {
      pag-resumo(
        titulo: "ABSTRACT",
        abstract.texto,
        tituloPalavras: "Keywords",
        palavrasChave: abstract.keywords,
      )
    } else {
      pag-resumo(titulo: "ABSTRACT", abstract)
    }
  }

  // 9. LISTA DE ILUSTRAÇÕES / FIGURAS (ABNT NBR 14724)
  if listaFiguras { lista-figuras() }

  // 10. LISTA DE TABELAS (ABNT NBR 14724)
  if listaTabelas { lista-tabelas() }

  // 11. LISTA DE ABREVIATURAS E SIGLAS (ABNT NBR 14724)
  if listaSiglas { lista-siglas(siglas, _siglasState) }

  // 12. LISTA DE SÍMBOLOS (Opcional)
  if listaSimbolos and simbolos.len() > 0 { lista-simbolos(simbolos) }

  // 13. SUMÁRIO (ABNT NBR 6027)
  if sumario { pag-sumario() }

  // Numeração de páginas no canto superior direito a partir do corpo do texto (ABNT NBR 14724)
  set page(numbering: "1", number-align: top + right)

  // Imprime o corpo do documento
  body
})
