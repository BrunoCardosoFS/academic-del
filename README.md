# Template Acadêmico em Typst — DEL / UFS (TCC e PIBIC)

Este repositório contém um conjunto de modelos acadêmicos (Trabalhos de Conclusão de Curso — TCC e Relatórios Finais PIBIC/PICVOL) em **Typst**, configurado e estilizado segundo as normas da ABNT (Associação Brasileira de Normas Técnicas) e adaptado para as diretrizes do Departamento de Engenharia Elétrica da Universidade Federal de Sergipe (DEL/UFS).

---

## Isenção de Responsabilidade

Este modelo é fornecido **"COMO ESTÁ" ("AS IS")**, sem garantias de qualquer tipo, expressas ou implícitas. Embora tenha sido desenvolvido para atender às normas da ABNT e diretrizes da UFS, cabe ao usuário final a conferência do documento gerado com as exigências específicas de sua respectiva banca e coordenação de curso.

---

## 📚 Documentação

A documentação completa do template está disponível online:

👉 **[Acesse a Documentação](https://github.com/BrunoCardosoFS/academic-del/blob/main/docs/index.md)**

Ela cobre instalação, configuração, uso de elementos textuais e pós-textuais, arquitetura interna do template e o histórico de versões.

---

## 🛠️ Como Usar

Baixe a versão mais recente do modelo nas [Releases do GitHub](https://github.com/BrunoCardosoFS/academic-del/releases/latest).

Escolha a forma que melhor se adapta ao seu fluxo de trabalho:

### 1. Uso Local (Typst CLI / VS Code)
1. Faça o download do arquivo ZIP da versão mais recente nas [Releases](https://github.com/BrunoCardosoFS/academic-del/releases/latest).
2. Extraia o conteúdo em uma pasta de sua preferência.
3. Abra o projeto no seu editor (ex: VS Code com a extensão *Tinymist Typst*) e comece a editar o arquivo `main.typ`.

> [!IMPORTANT]
> Ao compilar via **Typst CLI**, informe o caminho das fontes com a flag `--font-path`:
> ```sh
> # Compilação do projeto (main.typ)
> typst compile main.typ --font-path ./academic-del/assets/fonts
>
> # Compilação em modo watch (atualização automática ao salvar)
> typst watch main.typ --font-path ./academic-del/assets/fonts
> ```
> Sem a flag `--font-path ./academic-del/assets/fonts`, o Typst não encontrará as fontes customizadas (**Arimo**) e a compilação falhará.

> [!IMPORTANT]
> **Nota para compilação dos arquivos de exemplos (`academic-del/examples/`):**
> Caso deseje compilar diretamente um arquivo de exemplo dentro da pasta do pacote (ex: `academic-del/examples/tcc.typ` ou `academic-del/examples/pibic.typ`), é necessário passar a flag `--root .` para que os imports sejam resolvidos a partir da raiz:
> ```sh
> typst compile --root . academic-del/examples/tcc.typ --font-path ./academic-del/assets/fonts
> ```

---

### 2. Uso na Web (Typst App — [typst.app](https://typst.app))
1. Faça o download e extraia o arquivo ZIP obtido nas [Releases](https://github.com/BrunoCardosoFS/academic-del/releases/latest).
2. Acesse o [typst.app](https://typst.app) e crie um novo projeto em branco (*Blank Project*).
3. Arraste todos os arquivos e pastas descompactados para a área de arquivos (*File Tree*) do Typst Web.
4. Abra o `main.typ` para iniciar a escrita.

---

### 3. Integração em um Projeto Typst Existente
Se você já possui um projeto em andamento e deseja apenas aplicar o modelo:
1. Baixe o arquivo ZIP nas [Releases](https://github.com/BrunoCardosoFS/academic-del/releases/latest) e copie apenas a pasta `academic-del` para a raiz do seu projeto.
2. No seu arquivo `.typ` principal, adicione o import no topo:

```typst
#import "academic-del/lib.typ": figura, relatorioFinal, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Seu Nome",
  titulo: "Título do Seu Trabalho",
  // ... demais configurações
)
```

---

## Configuração e Uso do Template

O template é inicializado no topo do arquivo principal (ex.: `main.typ`) importando as funções do módulo `academic-del/lib.typ` e utilizando a função `#show: doc => tcc(...)` (para TCC) ou `#show: doc => relatorioFinal(...)` (para PIBIC/PICVOL):

```typst
#import "academic-del/lib.typ": figura, relatorioFinal, sigla, tcc

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
  fonte: [Fonte da tabela], // Se omitido, insere "Fonte: Autoria própria."
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
