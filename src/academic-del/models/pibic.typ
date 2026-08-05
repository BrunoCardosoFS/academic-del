// =============================================================================
// TEMPLATE DE Relatórios PIBIC - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
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


#let relatorioFinalPIBIC(
  tituloProjeto: "",
  tituloPlanoDeTrabalho: "",
  autor: "",
  voluntario: false,
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
      leading: 1.2em,
      justify: false,
      first-line-indent: 0mm,
    )
    #align(center + horizon)[
      #image("../assets/images/Brasao.svg", width: 25mm)
      #v(2mm)
      #text(size: 1.45em)[
        UNIVERSIDADE FEDERAL DE SERGIPE \
        PRÓ-REITORIA DE PÓS GRADUAÇÃO E PESQUISA \
        COORDENAÇÃO DE PESQUISA
      ] \


      #v(1fr)
      #text(size: 1.2em)[
        #if (voluntario) {
          upper("PROGRAMA DE INICIAÇÃO CIENTÍFICA VOLUNTÁRIA - PICVOL")
        } else {
          upper("PROGRAMA INSTITUCIONAL DE BOLSAS DE INICIAÇÃO CIENTÍFICA - PIBIC")
        }
      ] \
      #v(1fr)

      #text(size: 1.45em, weight: "bold")[#upper(tituloProjeto)]\
      #v(5mm)
      #text(size: 1.45em, weight: "bold")[#upper(tituloPlanoDeTrabalho)]\

      // #v(1fr)
      // #text(size: 1.5em)[#autor]

      #v(3fr)
      Relatório final \
      Período da bolsa: de #dataInicial até #dataFinal
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


#let relatorioParcialPIBIC(
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
