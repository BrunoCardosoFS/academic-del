// =============================================================================
// TEMPLATE DE RELATÓRIO FINAL PIBIC - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
// Copyright (c) 2026. Bruno Cardoso. Licença: MIT
//
// ISENÇÃO DE RESPONSABILIDADE / DISCLAIMER:
// Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo.
// Cabe ao usuário final a conferência do documento gerado com as exigências
// de sua respectiva instituição.
// =============================================================================

#import "../lib.typ": figura, relatorioFinal, sigla

#show: doc => relatorioFinal(
  tituloProjeto: "Título do Projeto de Pesquisa",
  tituloPlanoDeTrabalho: "Título do Plano de Trabalho",
  autor: "Nome do Autor",
  voluntario: false,
  sumario: true,
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  resumo: (
    texto: [
      O resumo sintetiza de forma objetiva e concisa os elementos essenciais do relatório de iniciação científica. Em um único parágrafo contínuo, apresenta o contexto do projeto de pesquisa, o problema investigado, os objetivos do plano de trabalho, a metodologia empregada durante o período da bolsa e os principais resultados obtidos. A extensão recomendada para resumos acadêmicos varia entre 150 e 500 palavras, seguida da relação de palavras-chave representativas do trabalho, conforme orientações da #sigla("ABNT", "Associação Brasileira de Normas Técnicas") NBR 6028 @abnt6028.
    ],
    palavrasChave: ("Iniciação Científica", "PIBIC", "Relatório Final", "Typst", "ABNT"),
  ),
  doc,
)



= Introdução
A introdução constitui a seção inicial da parte textual do relatório final de Iniciação Científica (PIBIC/PICVOL), tendo por finalidade apresentar o tema da pesquisa, contextualizar o problema investigado, explicitar a justificativa e os objetivos do plano de trabalho e delinear a estrutura do relatório. Este arquivo funciona simultaneamente como modelo de formatação e como manual prático de utilização das funcionalidades do Typst e do template do #sigla("DEL", "Departamento de Engenharia Elétrica") da #sigla("UFS", "Universidade Federal de Sergipe").

== Créditos e Isenção de Responsabilidade
Este template foi desenvolvido por *Bruno Cardoso* e disponibilizado sob licença MIT.

*Isenção de Responsabilidade:* Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo, expressas ou implícitas. Embora tenha sido desenvolvido com o objetivo de atender às normas da #sigla("ABNT") e às diretrizes da #sigla("UFS"), os autores e distribuidores não se responsabilizam por eventuais inconsistências, alterações normativas futuras ou exigências específicas de bancas e coordenações de curso. Cabe ao usuário final a conferência do documento gerado com as exigências de sua respectiva instituição.

== Estrutura do Relatório Final
Em relatórios de Iniciação Científica estruturados segundo as diretrizes da POSGRAP/COPES e a #sigla("ABNT") NBR 14724 @abnt14724, o trabalho divide-se em três partes principais:

- *Elementos pré-textuais*: antecedem o texto propriamente dito e incluem a capa padronizada (contendo cabeçalho institucional da UFS/POSGRAP/COPES, identificação do programa PIBIC/PICVOL, títulos do projeto e do plano de trabalho e período da bolsa), o resumo com palavras-chave e o sumário.
- *Elementos textuais*: compreendem a introdução (contextualização e objetivos), o desenvolvimento (fundamentação teórica, metodologia e análise de resultados) e a conclusão.
- *Elementos pós-textuais*: sucedem a conclusão e reúnem as referências (obrigatórias), além de eventuais apêndices, anexos e glossário.

== Configuração do Template
O template é inicializado no topo do arquivo através da função `#show: doc => relatorioFinal(...)`. Basta preencher os parâmetros com as informações do seu projeto de pesquisa e plano de trabalho. Abaixo apresenta-se a estrutura simplificada de configuração:

```typst
#import "../lib.typ": figura, relatorioFinal, sigla

#show: doc => relatorioFinal(
  tituloProjeto: "Título do Projeto de Pesquisa",
  tituloPlanoDeTrabalho: "Título do Plano de Trabalho",
  autor: "Nome do Autor",
  voluntario: false, // Setar 'true' caso seja voluntário (PICVOL)
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  sumario: true,
  resumo: (
    texto: [ Resumo em português (150 a 500 palavras)... ],
    palavrasChave: ("Iniciação Científica", "PIBIC", "Typst"),
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

Para criar uma lista com marcadores, utilize o hífen `-` no início da linha (com recuo para subníveis):

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
      #align(center + horizon)[Demonstração de Figura]
    ]
  ],
  caption: [Exemplo de figura utilizando a função `#figura`.],
) <fig-exemplo>

Para referenciar a figura no texto, utilize `@` seguido do rótulo definido ao final do bloco (por exemplo, `@fig-exemplo`). Toda figura deve ser citada no texto antes de sua aparição.

== Tabelas
As tabelas devem seguir a padronização do #sigla("IBGE", "Instituto Brasileiro de Geografia e Estatística") e da #sigla("ABNT") NBR 14724 @abnt14724, priorizando um visual limpo sem linhas verticais nas extremidades. Para incluir tabelas com indicação de fonte, utiliza-se a função `#figura` envolvendo o elemento `table`:

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
    [Fator de Potência], [0,95], [–],
    table.hline(),
  ),
  caption: [Exemplo de tabela.],
) <tab-exemplo>
```

A @tab-exemplo ilustra o resultado dessa formatação no documento.

#figura(
  table(
    columns: (auto, auto, auto, auto),
    stroke: none,
    table.hline(),
    table.cell(rowspan: 2, align: horizon + center)[*Métrica*],
    table.cell(colspan: 3, align: center)[*Configuração do Ensaio*],
    table.hline(start: 1, stroke: 0.5pt),
    [*Cenário A*], [*Cenário B*], [*Cenário C*],
    table.hline(stroke: 0.5pt),
    [Tensão Nominal (V)], [220,0], [380,0], [440,0],
    [Corrente Máxima (A)], [12,5], [25,0], [30,2],
    [Fator de Potência], [0,92], [0,95], [0,98],
    [Rendimento (%)], [88,4], [91,2], [94,5],
    table.hline(),
  ),
  caption: [Exemplo de formatação de tabela],
) <tab-exemplo>

== Equações Matemáticas
Equações em bloco (alinhadas ao centro e numeradas) são criadas delimitando a expressão por cifrões com espaço interno. Para rotular e citar a equação, adiciona-se `<eq-rotulo>` ao final:

```typst
$ R = rho dot l / A $ <eq-resistencia>
```

O código acima gera a seguinte equação numerada:

$ R = rho dot l / A $ <eq-resistencia>

em que $R$ representa a resistência elétrica ($Omega$), $rho$ a resistividade ($Omega m$), $l$ o comprimento ($m$) e $A$ a área ($m^2$), conforme visto na @eq-resistencia.

Para equações no corpo do texto (*inline*), utilize cifrões sem espaços internos, como em `$E = m c^2$` (que resulta em $E = m c^2$).

== Gerenciamento de Siglas
O template possui um sistema dinâmico para registrar e organizar siglas. Ao utilizar a função `#sigla`, a abreviação é formatada no texto e inserida automaticamente na *Lista de Abreviaturas e Siglas*.

- Na primeira ocorrência, passe a sigla curta e a definição por extenso para registrá-la e exibi-la no formato por extenso seguido da sigla entre parênteses:
```typst
#sigla("UFS", "Universidade Federal de Sergipe")
```
_Resultado no texto:_ #sigla("UFS", "Universidade Federal de Sergipe")

- Nas ocorrências posteriores, você pode informar apenas a sigla curta:
```typst
#sigla("UFS")
```
_Resultado no texto:_ #sigla("UFS")


== Citações e Bibliografia
As citações devem respeitar a #sigla("ABNT") NBR 10520 @abnt10520 e as referências a #sigla("ABNT") NBR 6023 @abnt6023.

=== Citações no Texto
As referências cadastradas no arquivo `.bib` podem ser citadas diretamente utilizando o caractere `@`:

- *Citação indireta (no corpo do texto):*
```typst
Segundo as orientações da NBR 14724 @abnt14724...
```
- *Citação com indicação de página ou trecho:*
```typst
Conforme destacado por autor @abnt10520 [p. 5]...
```
- *Citação direta longa (mais de 3 linhas):*
Para citações diretas longas, utiliza-se a função `#quote(block: true)` para aplicar o recuo regulamentar de 4 cm e fonte reduzida:

```typst
#quote(block: true)[
  A adoção de modelos formais de documentação em ambientes acadêmicos visa padronizar a difusão do conhecimento científico e assegurar a integridade da comunicação acadêmica.
]
```

=== Inclusão da Bibliografia
As referências são mantidas em um arquivo formato BibTeX (como `referencias.bib`). A inclusão da lista de referências no documento é feita via comando `#bibliography`:

```typst
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
```


== Elementos Pós-Textuais
Os elementos pós-textuais complementam o trabalho acadêmico e incluem as *Referências*, o *Glossário*, os *Apêndices* (textos elaborados pelo próprio autor) e os *Anexos* (documentos produzidos por terceiros).

=== A Regra da Numeração dos Títulos Pós-Textuais
De acordo com a #sigla("ABNT") NBR 6024 @abnt6024 e a NBR 14724 @abnt14724, os títulos dos elementos pós-textuais *não devem receber a numeração progressiva* dos capítulos textuais (ou seja, não se deve numerar como `4. REFERÊNCIAS` ou `5. APÊNDICE A`).

Para atender a essa norma no Typst, insere-se a seguinte instrução logo antes da bibliografia e dos elementos pós-textuais:

```typst
#set heading(numbering: none)
```

Essa instrução remove a numeração automática dos títulos declarados a partir daquele ponto. Assim, os elementos pós-textuais são estruturados da seguinte forma no código:

```typst
// Desativa a numeração automática de capítulos para os pós-textuais
#set heading(numbering: none)

// Inclusão da Bibliografia
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")

// Glossário (Opcional)
= Glossário

// Apêndices (Elaborados pelo autor)
= APÊNDICE A – Roteiro dos Experimentos

// Anexos (Documentos de terceiros)
= ANEXO A – Folha de Dados do Componente
```


= Conclusão
Este manual apresentou as principais diretrizes para elaboração do Relatório Final de Iniciação Científica (PIBIC/PICVOL) em Typst no padrão do departamento. A utilização deste modelo garante a padronização normativa exigida pela #sigla("UFS"), pela POSGRAP/COPES e pela #sigla("ABNT"), permitindo que o bolsista foque essencialmente na qualidade do conteúdo científico.


// =============================================================================
// ELEMENTOS PÓS-TEXTUAIS
// Conforme a ABNT NBR 6024, os elementos pós-textuais NÃO recebem numeração
// numérica progressiva (ex: não devem ter "4. REFERÊNCIAS" nem "5. APÊNDICE A").
// A instrução abaixo desativa a numeração de títulos para todas as seções seguintes.
// =============================================================================

#set heading(numbering: none)

#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")


= Glossário <sec-glossario>

O glossário é um elemento pós-textual opcional que reúne termos técnicos, jargões ou expressões específicas empregadas ao longo do trabalho, acompanhados de suas respectivas conceituações. Os verbetes devem ser ordenados alfabeticamente @abnt14724.


= APÊNDICE A – O que é um Apêndice?
O apêndice reúne textos ou documentos elaborados pelo próprio autor com o intuito de complementar sua argumentação e enriquecer a fundamentação do trabalho, sem comprometer a continuidade do texto principal @abnt14724.


= ANEXO A – O que é um Anexo?
O anexo compreende documentos ou materiais de autoria de terceiros incorporados ao trabalho para fins de comprovação, ilustração ou fundamentação complementar. Diferencia-se do apêndice pelo fato de não ter sido produzido pelo autor da pesquisa @abnt14724.


= ANEXO B – Unidades de Medida
O texto contido neste anexo traz informações sobre as unidades legais de medida no Brasil @inmetro2013.
