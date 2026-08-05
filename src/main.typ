#import "academic-del/lib.typ": figura, relatorioFinalPIBIC, relatorioFinalPIBITI, sigla, tcc

#show: doc => relatorioFinalPIBIC(
  tituloProjeto: "Desenvolvimento de Antenas Fractais para Detecção de Descargas Parciais em Equipamentos de Alta Tensão",
  tituloPlanoDeTrabalho: "Miniaturização de Antena Monopolo Impressa Circular a partir da Aplicação de Geometrias Fractais",
  autor: "Bruno Cardoso Ferreira da Silva",
  voluntario: false,
  bolsa: "CNPq",
  sumario: true,
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  resumo: (
    texto: [
      #lorem(150).
    ],
    palavrasChave: ("Iniciação Científica", "PIBIC", "Relatório Final", "Typst", "ABNT"),
  ),
  doc,
)

// #show: doc => relatorioFinalPIBITI(
//   tituloProjeto: "Título do Projeto",
//   areaDoConhecimento: "Área do Conhecimento",
//   subAreaDoConhecimento: "Subarea do Conhecimento",
//   especialidadeDoConhecimento: "Especialidade do Conhecimento",
//   autor: "Fulano de Tal",
//   dataInicial: "janeiro de 2026",
//   dataFinal: "dezembro de 2026",
//   sumario: true,
//   resumo: none,
//   doc,
// )

// #show: doc => tcc(
//   curso: "Engenharia Elétrica",
//   autor: "Nome do Aluno",
//   titulo: "Título do Trabalho:",
//   subtitulo: "Subtítulo do trabalho", // Opcional (Remover se não houver)
//   instituicao: "Universidade Federal de Sergipe",
//   local: "São Cristóvão",
//   data: "2026",
//   orientador: "Nome do Orientador, D. Sc.",
//   coorientador: "Nome do Coorientador", // Opcional (Remover se não houver)
//   submissao: [Trabalho de Conclusão de Curso submetido à Coordenação de Graduação em Engenharia Elétrica da Universidade Federal de Sergipe como parte dos requisitos necessários para a obtenção do grau de Bacharel em Ciências no Domínio da Engenharia Elétrica.],
//   banca: (
//     (
//       nome: "Professor Avaliador 1",
//       instituicao: "Universidade Federal de Sergipe",
//       funcao: "Avaliador",
//     ),
//     (
//       nome: "Professor Avaliador 2",
//       instituicao: "Universidade Federal de Sergipe",
//       funcao: "Avaliador",
//     ),
//     (
//       nome: "Professor Orientador",
//       instituicao: "Universidade Federal de Sergipe",
//       funcao: "Orientador",
//     ),
//   ),
//   dedicatoria: [
//     Dedico este trabalho a todos que acreditaram que "é só escrever umas páginas". Espero que agora entendam que havia um pouco mais envolvido.
//   ],
//   agradecimentos: [
//     Agradeço a todas as pessoas que contribuíram, direta ou indiretamente, para a realização deste trabalho. Aos professores, colegas, amigos e familiares, pelo incentivo e pela paciência durante esta jornada.

//     Agradeço também aos desenvolvedores de ferramentas livres, aos autores dos livros e artigos consultados e a todos que responderam dúvidas em fóruns da internet anos antes de eu sequer formulá-las.

//     Por fim, agradeço a mente brilhante que inventou o comando "Ctrl + Z", comando este que sempre esteve presente nos momentos de desespero.
//   ],
//   epigrafe: (
//     texto: [Todo grande projeto começa com uma página em branco e a esperança de que tudo dê certo.],
//     autor: [Alguém disse isso, certeza],
//   ),
//   resumo: (
//     texto: [
//       Resumo
//     ],
//     palavrasChave: ("Palavras", "Chave"),
//   ),
//   abstract: (
//     texto: [
//       Abstract
//     ],
//     keywords: ("Key", "Words"),
//   ),
//   sumario: true,
//   listaFiguras: true,
//   listaTabelas: true,
//   listaSiglas: true,
//   listaSimbolos: true,
//   simbolos: (
//     "S": "Símbolo",
//   ), // Opcional (Remover se não houver)
//   doc,
// )

= Introdução

#lorem(100)

#quote(block: true)[
  #lorem(50)
]

#lorem(100)

#lorem(100)



//========================
// ELEMENTOS PÓS-TEXTUAIS
// =======================

#set heading(numbering: none)
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")


= Glossário <sec-glossario>
Glossário
