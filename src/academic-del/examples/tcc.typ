// =============================================================================
// TEMPLATE DE TCC - UNIVERSIDADE FEDERAL DE SERGIPE (UFS)
// Copyright (c) 2026. Bruno Cardoso. Licença: MIT
//
// ISENÇÃO DE RESPONSABILIDADE / DISCLAIMER:
// Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo.
// Cabe ao usuário final a conferência do documento gerado com as exigências
// de sua respectiva instituição.
// =============================================================================

#import "../lib.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Nome do Aluno",
  titulo: "Título do Trabalho:",
  subtitulo: "Subtítulo do trabalho",
  instituicao: "Universidade Federal de Sergipe",
  local: "São Cristóvão",
  data: "2026",
  orientador: "Nome do Orientador, D. Sc.",
  coorientador: "Nome do Coorientador",
  submissao: [Trabalho de Conclusão de Curso submetido à Coordenação de Graduação em Engenharia Elétrica da Universidade Federal de Sergipe como parte dos requisitos necessários para a obtenção do grau de Bacharel em Ciências no Domínio da Engenharia Elétrica.],
  banca: (
    (
      nome: "Professor Avaliador",
      instituicao: "Universidade Federal de Sergipe",
      funcao: "Avaliador",
    ),
    (
      nome: "Professor Avaliador",
      instituicao: "Universidade Federal de Sergipe",
      funcao: "Avaliador",
    ),
    (
      nome: "Nome do Orientador, D. Sc.",
      instituicao: "Universidade Federal de Sergipe",
      funcao: "Orientador",
    ),
  ),
  dedicatoria: [
    Dedico este trabalho a todos que acreditaram que "é só escrever umas páginas". Espero que agora entendam que havia um pouco mais envolvido.
  ],
  agradecimentos: [
    Agradeço a todas as pessoas que contribuíram, direta ou indiretamente, para a realização deste trabalho. Aos professores, colegas, amigos e familiares, pelo incentivo e pela paciência durante esta jornada.

    Agradeço também aos desenvolvedores de ferramentas livres, aos autores dos livros e artigos consultados e a todos que responderam dúvidas em fóruns da internet anos antes de eu sequer formulá-las.

    Por fim, agradeço a mente brilhante que inventou o comando "Ctrl + Z", comando este que sempre esteve presente nos momentos de desespero.
  ],
  epigrafe: (
    texto: [Todo grande projeto começa com uma página em branco e a esperança de que tudo dê certo.],
    autor: [Alguém disse isso, certeza],
  ),
  resumo: (
    texto: [
      O resumo sintetiza de forma objetiva e concisa os elementos essenciais do trabalho acadêmico. Em um único parágrafo contínuo, deve apresentar o contexto e a justificativa da pesquisa, a delimitação do problema investigado, os objetivos estabelecidos, a metodologia empregada e os principais resultados e conclusões alcançados. Recomenda-se a utilização de linguagem clara, em terceira pessoa e na voz ativa, evitando-se o uso de abreviaturas não consolidadas, equações ou citações diretas. A extensão recomendada para trabalhos acadêmicos varia entre 150 e 500 palavras, seguida da relação de palavras-chave que representem adequadamente o conteúdo do documento, conforme as orientações da #sigla("ABNT", "Associação Brasileira de Normas Técnicas") NBR 6028 @abnt6028.
    ],
    palavrasChave: ("Modelo", "Trabalho", "TCC", "Relatório", "Typst", "ABNT"),
  ),
  abstract: (
    texto: [
      The abstract consists of a faithful translation of the Portuguese summary into a foreign language (usually English), maintaining the same structural features and conciseness. It presents the background, research problem, objectives, methodology, main findings, and conclusions of the study. The text must be followed by a list of keywords in the chosen language. Proofreading by a proficient native or qualified translator is highly recommended to ensure proper technical terminology and academic style.
    ],
    keywords: ("Model", "Paperwork", "TCC", "Report", "Typst"),
  ),
  sumario: true,
  listaFiguras: true,
  listaTabelas: true,
  listaSiglas: true,
  listaSimbolos: true,
  simbolos: (
    "d_ab": "Distância entre os pontos A e B",
    "O(n)": "Ordem de complexidade de um algoritmo",
  ),
  doc,
)

= Introdução
A introdução constitui a seção inicial da parte textual do documento, tendo por finalidade apresentar o tema, contextualizar o problema de pesquisa, explicitar a justificativa e os objetivos e delinear a estrutura do trabalho. Este arquivo funciona simultaneamente como modelo de formatação e como manual prático de utilização das funcionalidades do Typst e do template do #sigla("DEL", "Departamento de Engenharia Elétrica") da #sigla("UFS", "Universidade Federal de Sergipe").

== Créditos e Isenção de Responsabilidade
Este template foi desenvolvido por *Bruno Cardoso* e disponibilizado sob licença MIT.

*Isenção de Responsabilidade:* Este modelo é fornecido "COMO ESTÁ" ("AS IS"), sem garantias de qualquer tipo, expressas ou implícitas. Embora tenha sido desenvolvido com o objetivo de atender às normas da #sigla("ABNT") e às diretrizes da #sigla("UFS"), os autores e distribuidores não se responsabilizam por eventuais inconsistências, alterações normativas futuras ou exigências específicas de bancas e coordenações de curso. Cabe ao usuário final a conferência do documento gerado com as exigências de sua respectiva instituição.

== Estrutura dos Trabalhos Acadêmicos
Em documentos acadêmicos estruturados segundo a #sigla("ABNT") NBR 14724 @abnt14724, o trabalho divide-se em três partes principais:

- *Elementos pré-textuais*: antecedem o texto propriamente dito e incluem a capa, folha de rosto, folha de aprovação, dedicatória, agradecimentos, epígrafe, resumo, abstract, sumário e listas explicativas (figuras, tabelas, siglas e símbolos).
- *Elementos textuais*: compreendem a introdução, o desenvolvimento (dividido em fundamentação teórica, metodologia e análise de resultados) e a conclusão.
- *Elementos pós-textuais*: sucedem a conclusão e reúnem as referências (obrigatórias), além de eventuais apêndices, anexos e glossário.

== Configuração do Template
O template é inicializado no topo do arquivo através da função `#show: doc => tcc(...)`. Basta preencher os parâmetros com as informações do seu trabalho. Abaixo apresenta-se a estrutura simplificada de configuração:

```typst
#import "modelo/config.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Nome do Aluno",
  titulo: "Título do Trabalho",
  subtitulo: "Subtítulo do trabalho", // Opcional (remover se não houver)
  instituicao: "Universidade Federal de Sergipe",
  local: "São Cristóvão",
  data: "2026",
  orientador: "Nome do Orientador, D. Sc.",
  coorientador: "Nome do Coorientador", // Opcional (remover se não houver)
  submissao: [Trabalho de Conclusão de Curso submetido à Coordenação de Graduação em Engenharia Elétrica da Universidade Federal de Sergipe como parte dos requisitos necessários para a obtenção do grau de Bacharel em Ciências no Domínio da Engenharia Elétrica.],
  banca: (
    (nome: "Professor Avaliador 1", instituicao: "UFS", funcao: "Avaliador"),
    (nome: "Professor Avaliador 2", instituicao: "UFS", funcao: "Avaliador"),
    (nome: "Professor Orientador", instituicao: "UFS", funcao: "Orientador"),
  ),
  dedicatoria: [ Dedico este trabalho a... ],
  agradecimentos: [ Agradeço a todas as pessoas... ],
  epigrafe: (
    texto: [Todo grande projeto começa com uma página em branco...],
    autor: [Autor da frase],
  ),
  resumo: (
    texto: [ Resumo em português (150 a 500 palavras)... ],
    palavrasChave: ("Modelo", "TCC", "Typst", "ABNT"),
  ),
  abstract: (
    texto: [ English abstract translation... ],
    keywords: ("Model", "TCC", "Typst", "ABNT"),
  ),
  sumario: true,
  listaFiguras: true,
  listaTabelas: true,
  listaSiglas: true,
  listaSimbolos: true,
  simbolos: (
    "S": "Símbolo",
  ),
  doc,
)
```

== Paginação
Segundo a #sigla("ABNT") NBR 14724 @abnt14724, todas as folhas a partir da folha de rosto devem ser contadas sequencialmente, porém a exibição visível do número da página em algarismos arábicos (no canto superior direito) inicia-se apenas na primeira página da Introdução. O template gerencia esse controle de numeração automaticamente. Havendo anexos e apêndices, suas folhas continuam com a mesma numeração sequencial.


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
Este manual apresentou as principais diretrizes para elaboração de Trabalhos de Conclusão de Curso em Typst no padrão do departamento. A utilização deste modelo garante a padronização normativa exigida pela #sigla("UFS") e pela #sigla("ABNT"), permitindo que o autor foca-se essencialmente na qualidade do conteúdo científico.


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
