// =============================================================================
// TEMPLATE DE Relatórios PIBITI - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
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
#import "../core/listas.typ": sumario as pag-sumario
#import "../core/pretextuais.typ": resumo as pag-resumo
)


#let relatorioFinalPIBITI(
  tituloProjeto: "",
  areaDoConhecimento: "",
  subAreaDoConhecimento: "",
  especialidadeDoConhecimento: "",
  autor: "",
  // voluntario: false,
  dataInicial: "janeiro de 2026",
  dataFinal: "dezembro de 2026",
  sumario: true,
  resumo: none,
  fonte: "Arimo",
  body,
) = aplicar-estilos-abnt(fonte: fonte, {
  // Configuração inicial das folhas pré-textuais (sem numeração impressa)
  set page(numbering: none)

  // A CAPA (Padrão UFS)
  page(numbering: none)[
    #set par(
      leading: 0.65em,
      justify: false,
      first-line-indent: 0mm,
    )
    #align(center + horizon)[

      #stack(
        dir: ltr,
        spacing: 2.0cm,
        image("../assets/images/Brasao.svg", height: 30mm),
        image("../assets/images/posgrap.png", height: 20mm),
        image("../assets/images/agitte.png", height: 30mm),
      )


      #v(2mm)
      #text(size: 1.5em)[
        UNIVERSIDADE FEDERAL DE SERGIPE \
        PRÓ-REITORIA DE PÓS GRADUAÇÃO E PESQUISA \
        AGÊNCIA DE INOVAÇÃO E TRANSFERÊNCIA DE TECNOLOGIA
      ] \

      #v(1fr)
      #text(size: 1.16em)[
        #upper("Programa Institucional de Iniciação em Desenvolvimento Tecnológico e Inovação - PIBITI")
      ] \

      #v(1fr)

      #text(size: 1.5em, weight: "bold")[#upper(tituloProjeto)]

      #v(1fr)

      #text(size: 1.16em)[
        #set par(leading: 0.65em)
        Área do conhecimento: #areaDoConhecimento \
        Subárea do conhecimento: #subAreaDoConhecimento \
        Especialidade do conhecimento: #especialidadeDoConhecimento
      ]
      // #text(size: 1.45em, weight: "bold")[#upper(tituloPlanoDeTrabalho)]\

      // #v(1fr)
      // #text(size: 1.5em)[#autor]

      #v(3fr)
      #text(size: 1.16em)[
        Relatório final \
        Período da bolsa: de #dataInicial até #dataFinal
      ]
      #pagebreak()
    ]
  ]

  // Resumo
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

  // SUMÁRIO (NBR 6027)
  if sumario { pag-sumario() }

  // Numeração de páginas no canto superior direito a partir do corpo do texto (NBR 14724)
  set page(numbering: "1", number-align: top + right)

  // Imprime o corpo do documento
  body
})


#let relatorioParcialPIBITI(
  tituloProjeto: "",
  tituloPlanoDeTrabalho: "",
  autor: "",
  voluntario: false,
  fonte: "Arimo",
  body,
) = aplicar-estilos-abnt(fonte: fonte, {
  // TODO

  // Imprime o corpo do documento
  body
})
