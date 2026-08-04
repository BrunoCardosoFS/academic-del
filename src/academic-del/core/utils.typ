// =============================================================================
// UTILITÁRIOS ABNT — Funções auxiliares reutilizáveis
// Podem ser usadas em qualquer tipo de documento (TCC, artigo, relatório, etc.)
// =============================================================================

#import "format.typ": defaultFigureGap


// Estado global para acumular siglas registradas no corpo do texto
#let _siglasState = state("academic-siglas-state", (:))

// Registra e exibe uma sigla no texto (ABNT NBR 14724).
// Uso:
//   #sigla("ABNT", "Associação Brasileira de Normas Técnicas")  → exibe "Associação... (ABNT)"
//   #sigla("ABNT")                                              → exibe apenas "ABNT"
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


// Insere uma figura com indicação automática de fonte (ABNT NBR 14724).
// Parâmetros:
//   body    — conteúdo da figura (imagem, tabela, etc.)
//   caption — legenda (acima da figura, conforme ABNT)
//   fonte   — texto da fonte; none → "Fonte: Autoria própria."
//             strings que já comecem com "Fonte:" são usadas literalmente
//   gap     — espaçamento entre o corpo e a fonte
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
