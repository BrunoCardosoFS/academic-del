// =============================================================================
// TEMPLATE DE RELATÓRIO FINAL PIBITI - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
// Copyright (c) 2026. Bruno Cardoso. Licença: MIT
//
// ISENÇÃO DE RESPONSABILIDADE / DISCLAIMER:
// Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo.
// Cabe ao usuário final a conferência do documento gerado com as exigências
// de sua respectiva instituição.
// =============================================================================

#import "../lib.typ": figura, relatorioFinalPIBITI, sigla

#show: doc => relatorioFinalPIBITI(
  tituloProjeto: "Desenvolvimento de Plataforma de Monitoramento Inteligente",
  areaDoConhecimento: "Engenharias",
  subAreaDoConhecimento: "Engenharia Elétrica",
  especialidadeDoConhecimento: "Medição, Controle, Correção e Proteção de Sistemas Elétricos de Potência",
  autor: "Nome do Autor",
  sumario: true,
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  resumo: (
    texto: [
      O resumo sintetiza de forma objetiva e concisa os elementos essenciais do relatório de Iniciação em Desenvolvimento Tecnológico e Inovação (PIBITI). Em um único parágrafo contínuo, apresenta o contexto da pesquisa tecnológica, o problema abordado, a solução proposta, a metodologia de desenvolvimento, os protótipos/inovações gerados e os principais resultados de testes e validação. A extensão recomendada para resumos acadêmicos varia entre 150 e 500 palavras, seguida da relação de palavras-chave representativas do trabalho, conforme orientações da #sigla("ABNT", "Associação Brasileira de Normas Técnicas") NBR 6028 @abnt6028.
    ],
    palavrasChave: ("Inovação Tecnológica", "PIBITI", "Relatório Final", "Typst", "ABNT"),
  ),
  doc,
)



= Introdução
A introdução constitui a seção inicial da parte textual do relatório final de Iniciação em Desenvolvimento Tecnológico e Inovação (PIBITI), tendo por finalidade apresentar o tema da pesquisa aplicada, contextualizar a demanda tecnológica investigada, explicitar a justificativa e os objetivos do projeto de inovação e delinear a estrutura do relatório. Este arquivo funciona simultaneamente como modelo de formatação e como manual prático de utilização das funcionalidades do Typst e do template do #sigla("DEL", "Departamento de Engenharia Elétrica") da #sigla("UFS", "Universidade Federal de Sergipe").

== Créditos e Isenção de Responsabilidade
Este template foi desenvolvido por *Bruno Cardoso* e disponibilizado sob licença MIT.

*Isenção de Responsabilidade:* Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo, expressas ou implícitas. Embora tenha sido desenvolvido com o objetivo de atender às normas da #sigla("ABNT") e às diretrizes da #sigla("UFS"), os autores e distribuidores não se responsabilizam por eventuais inconsistências, alterações normativas futuras ou exigências específicas de bancas e coordenações de curso. Cabe ao usuário final a conferência do documento gerado com as exigências de sua respectiva instituição.

== Estrutura do Relatório Final PIBITI
Em relatórios PIBITI estruturados segundo as diretrizes da POSGRAP/AGITTE e a #sigla("ABNT") NBR 14724 @abnt14724, o trabalho divide-se em três partes principais:

- *Elementos pré-textuais*: antecedem o texto propriamente dito e incluem a capa padronizada (contendo cabeçalho institucional UFS/POSGRAP/AGITTE, identificação do programa PIBITI, área, subárea e especialidade do conhecimento, título do projeto e período da bolsa), o resumo com palavras-chave e o sumário.
- *Elementos textuais*: compreendem a introdução (contextualização e objetivos), o desenvolvimento (fundamentação teórica, arquitetura da solução, prototipagem e testes) e a conclusão.
- *Elementos pós-textuais*: sucedem a conclusão e reúnem as referências (obrigatórias), além de eventuais apêndices, anexos e glossário.

== Configuração do Template
O template é inicializado no topo do arquivo através da função `#show: doc => relatorioFinalPIBITI(...)`. Basta preencher os parâmetros com as informações do seu projeto. Abaixo apresenta-se a estrutura simplificada de configuração:

```typst
#import "../lib.typ": figura, relatorioFinalPIBITI, sigla

#show: doc => relatorioFinalPIBITI(
  tituloProjeto: "Título do Projeto de Inovação",
  areaDoConhecimento: "Engenharias",
  subAreaDoConhecimento: "Engenharia Elétrica",
  especialidadeDoConhecimento: "Automação Eletrônica",
  autor: "Nome do Bolsista",
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  sumario: true,
  resumo: (
    texto: [ Resumo do projeto tecnológico... ],
    palavrasChave: ("Inovação", "PIBITI", "Typst"),
  ),
  doc,
)
```

== Paginação
Segundo as diretrizes institucionais e a #sigla("ABNT") NBR 14724 @abnt14724, a numeração de páginas em algarismos arábicos (no canto superior direito) inicia-se na primeira página do texto principal (Introdução). O template gerencia esse controle de numeração automaticamente.


= Desenvolvimento
Neste capítulo são apresentadas as orientações detalhadas e exemplos de código para a estruturação de elementos do texto, tais como figuras, tabelas, equações, siglas, listas, citações bibliográficas e elementos pós-textuais.

== Formatação de Texto e Seções
No Typst, a marcação de texto é simples e intuitiva:
- Para destacar texto em *negrito*, utilize asteriscos: `*texto*`.
- Para destacar em _itálico_, utilize underlines: `_texto_`.
- Títulos de seções utilizam o caractere `=` no início da linha. O número de símbolos indica o nível hierárquico, conforme a #sigla("ABNT") NBR 6024 @abnt6024:

```typst
= Seção Primária (Capítulo)
== Seção Secundária
=== Seção Terciária
==== Seção Quaternária
```

== Listas
No Typst, é simples criar tanto listas não ordenadas (com marcadores) quanto listas ordenadas (numeradas).

Para criar uma lista com marcadores, utilize o hífen `-` no início da linha:

```typst
- Item de primeiro nível
  - Subitem de segundo nível
    - Subitem de terceiro nível
```

Para listas numeradas, utilize o sinal de mais `+` no início de cada linha. O Typst incrementa a numeração automaticamente:

```typst
+ Primeiro item numerado
+ Segundo item numerado
```

== Figuras
As figuras devem possuir legenda na parte superior e indicação de fonte na parte inferior, conforme exigido pela #sigla("ABNT") NBR 14724 @abnt14724. O template disponibiliza a função `#figura` para simplificar esse processo:

```typst
#figura(
  image("caminho/para/imagem.png", width: 80%),
  caption: [Descrição da figura.],
  fonte: [Fonte da figura],
) <fig-exemplo>
```

Se o parâmetro `fonte` for omitido, o template insere automaticamente `"Fonte: Autoria própria."`. A @fig-exemplo demonstra a aplicação da função `#figura`.

#figura(
  [
    #rect(width: 50%, height: 30mm, fill: rgb("f4f4f6"), stroke: 1pt + rgb("cccccc"))[
      #align(center + horizon)[Demonstração de Prototipagem Tecnológica]
    ]
  ],
  caption: [Exemplo de figura utilizando a função `#figura`.],
) <fig-exemplo>

Para referenciar a figura no texto, utilize `@` seguido do rótulo definido ao final do bloco (por exemplo, `@fig-exemplo`).

== Tabelas
As tabelas devem seguir a padronização do #sigla("IBGE", "Instituto Brasileiro de Geografia e Estatística") e da #sigla("ABNT") NBR 14724 @abnt14724, priorizando um visual limpo sem linhas verticais nas extremidades:

```typst
#figura(
  table(
    columns: (auto, auto, auto),
    stroke: none,
    table.hline(),
    [*Parâmetro*], [*Valor Medido*], [*Unidade*],
    table.hline(stroke: 0.5pt),
    [Tensão], [220,0], [V],
    [Corrente], [12,5], [A],
    table.hline(),
  ),
  caption: [Exemplo de tabela de resultados.],
) <tab-exemplo>
```

A @tab-exemplo ilustra o resultado dessa formatação no documento.

#figura(
  table(
    columns: (auto, auto, auto, auto),
    stroke: none,
    table.hline(),
    table.cell(rowspan: 2, align: horizon + center)[*Métrica de Desempenho*],
    table.cell(colspan: 3, align: center)[*Protótipo / Versão*],
    table.hline(start: 1, stroke: 0.5pt),
    [*v1.0*], [*v2.0*], [*v3.0 (Final)*],
    table.hline(stroke: 0.5pt),
    [Latência de Resposta (ms)], [150,0], [45,0], [12,5],
    [Consumo Elétrico (mW)], [850,0], [320,0], [110,0],
    [Taxa de Erro (%)], [4,2], [1,1], [0,05],
    table.hline(),
  ),
  caption: [Exemplo de formatação de tabela de testes],
) <tab-exemplo>

== Equações Matemáticas
Equações em bloco (alinhadas ao centro e numeradas) são criadas delimitando a expressão por cifrões com espaço interno:

```typst
$ R = rho dot l / A $ <eq-resistencia>
```

$ R = rho dot l / A $ <eq-resistencia>

em que $R$ representa a resistência elétrica ($Omega$), $rho$ a resistividade ($Omega m$), $l$ o comprimento ($m$) e $A$ a área ($m^2$), conforme visto na @eq-resistencia.

== Gerenciamento de Siglas
O template possui um sistema dinâmico para registrar e organizar siglas. Ao utilizar a função `#sigla`, a abreviação é formatada no texto e inserida automaticamente na *Lista de Abreviaturas e Siglas*.

```typst
#sigla("UFS", "Universidade Federal de Sergipe")
```
_Resultado no texto:_ #sigla("UFS", "Universidade Federal de Sergipe")

== Citações e Bibliografia
As citações devem respeitar a #sigla("ABNT") NBR 10520 @abnt10520 e as referências a #sigla("ABNT") NBR 6023 @abnt6023.

```typst
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
```

== Elementos Pós-Textuais
De acordo com a #sigla("ABNT") NBR 6024 @abnt6024, os títulos dos elementos pós-textuais *não devem receber numeração progressiva*. Insere-se a seguinte instrução antes da bibliografia:

```typst
#set heading(numbering: none)
```


= Conclusão
Este manual apresentou as principais diretrizes para elaboração do Relatório Final PIBITI em Typst no padrão do departamento. A utilização deste modelo garante a padronização normativa exigida pela #sigla("UFS"), pela AGITTE/POSGRAP e pela #sigla("ABNT").


// =============================================================================
// ELEMENTOS PÓS-TEXTUAIS
// =============================================================================

#set heading(numbering: none)

#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")


= Glossário <sec-glossario>
O glossário é um elemento pós-textual opcional que reúne termos técnicos, jargões ou expressões específicas empregadas ao longo do trabalho, acompanhados de suas respectivas conceituações @abnt14724.


= APÊNDICE A – Detalhes do Projeto de Circuito Impresso
O apêndice reúne esquemáticos, códigos e layouts elaborados pelo próprio autor com o intuito de complementar sua argumentação @abnt14724.


= ANEXO A – Datasheet do Componente
O anexo compreende documentos ou materiais de autoria de terceiros incorporados ao trabalho para fins de comprovação @abnt14724.
