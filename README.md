# Template de TCC em Typst — Universidade Federal de Sergipe (UFS)

Este repositório contém um modelo de Trabalho de Conclusão de Curso (TCC) em **Typst**, configurado e estilizado segundo as normas da ABNT (Associação Brasileira de Normas Técnicas) e adaptado para as diretrizes da Universidade Federal de Sergipe (UFS).

---

## Isenção de Responsabilidade

Este modelo é fornecido **"COMO ESTÁ" ("AS IS")**, sem garantias de qualquer tipo, expressas ou implícitas. Embora tenha sido desenvolvido para atender às normas da ABNT e diretrizes da UFS, cabe ao usuário final a conferência do documento gerado com as exigências específicas de sua respectiva banca e coordenação de curso.

---

## Estrutura dos Trabalhos Acadêmicos (ABNT NBR 14724)

Conforme a ABNT NBR 14724, o documento acadêmico é dividido em três partes principais:

- **Elementos Pré-textuais**: Capa, folha de rosto, folha de aprovação, dedicatória, agradecimentos, epígrafe, resumo, *abstract*, sumário e listas explicativas (figuras, tabelas, siglas e símbolos).
- **Elementos Textuais**: Introdução, desenvolvimento (fundamentação teórica, metodologia, análise de resultados) e conclusão.
- **Elementos Pós-textuais**: Referências (obrigatórias), glossário, apêndices e anexos.

---

## Configuração e Uso do Template

O template é inicializado no topo do arquivo principal (ex.: `main.typ`) importando as funções do módulo `modelo/config.typ` e utilizando o comando `#show: doc => tcc(...)`:

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

= Introdução
O texto da introdução começa aqui...
```

---

## Recursos e Sintaxe no Typst

### 1. Paginação (ABNT NBR 14724)
As páginas são contadas sequencialmente a partir da folha de rosto, mas a exibição visível do número da página (no canto superior direito) inicia-se apenas na primeira página da Introdução. O template gerencia esse controle de numeração automaticamente.

### 2. Formatação de Texto e Seções
- **Negrito**: `*texto em negrito*`
- **Itálico**: `_texto em itálico_`
- **Títulos de Seções** (ABNT NBR 6024):
  ```typst
  = Seção Primária (Capítulo)
  == Seção Secundária
  === Seção Terciária
  ==== Seção Quaternária
  ```

### 3. Listas
- **Marcadores**:
  ```typst
  - Item de primeiro nível
    - Subitem de segundo nível
  ```
- **Numeradas**:
  ```typst
  + Primeiro item numerado
  + Segundo item numerado
  ```

### 4. Figuras (ABNT NBR 14724)
As figuras devem possuir legenda na parte superior e indicação de fonte na parte inferior. O template fornece a função `#figura`:

```typst
#figura(
  image("caminho/para/imagem.png", width: 80%),
  caption: [Descrição da figura.],
  fonte: [Fonte da figura], // Se omitido, insere "Fonte: Autoria própria."
) <fig-exemplo>
```
Para referenciar no texto: `@fig-exemplo`.

### 5. Tabelas (Padrão IBGE / ABNT NBR 14724)
As tabelas devem priorizar um visual limpo sem linhas verticais nas extremidades. Utilize a função `#figura` combinada com `table`:

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
  caption: [Exemplo de tabela.],
) <tab-exemplo>
```
Para referenciar no texto: `@tab-exemplo`.

### 6. Equações Matemáticas
- **Em Bloco** (numeradas e alinhadas):
  ```typst
  $ R = rho dot l / A $ <eq-resistencia>
  ```
  Referenciar no texto: `@eq-resistencia`.
- **Inline** (no corpo do texto): `$E = m c^2$`

### 7. Gerenciamento de Siglas
O template gera automaticamente a *Lista de Abreviaturas e Siglas*.
- **Primeira ocorrência** (registra a sigla e exibe no formato `Nome por Extenso (SIGLA)`):
  ```typst
  #sigla("UFS", "Universidade Federal de Sergipe")
  ```
- **Ocorrências posteriores**:
  ```typst
  #sigla("UFS")
  ```

### 8. Citações e Bibliografia (ABNT NBR 10520 e NBR 6023)
- **Citação Indireta**: `Segundo as orientações da NBR 14724 @abnt14724...`
- **Citação com Página**: `Conforme destacado por autor @abnt10520 [p. 5]...`
- **Citação Direta Longa** (mais de 3 linhas):
  ```typst
  #quote(block: true)[
    Texto da citação direta longa com recuo regulamentar de 4 cm e fonte reduzida.
  ]
  ```
- **Inclusão da Bibliografia**:
  ```typst
  #bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
  ```

### 9. Elementos Pós-Textuais (ABNT NBR 6024 e NBR 14724)
Conforme a ABNT NBR 6024, os títulos dos elementos pós-textuais **não devem receber numeração progressiva**. Desative a numeração de títulos antes da bibliografia e seções pós-textuais:

```typst
// Desativa a numeração automática de capítulos para os elementos pós-textuais
#set heading(numbering: none)

// Bibliografia
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")

// Glossário (Opcional)
= Glossário

// Apêndices (Textos elaborados pelo próprio autor)
= APÊNDICE A – Roteiro dos Experimentos

// Anexos (Documentos produzidos por terceiros)
= ANEXO A – Folha de Dados do Componente
```

---

## Créditos e Licença

- **Autor do Template**: Bruno Cardoso
- **Licença do Projeto**: [MIT License](LICENSE)
- **Fonte Utilizada**: **Arimo** (Copyright Steve Matteson / Google — licenciada sob SIL Open Font License 1.1 / Apache 2.0).
