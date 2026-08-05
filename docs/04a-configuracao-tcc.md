# 4a. Configuração — Parâmetros da Função `tcc()`

A função `tcc()` é o coração do template para Trabalhos de Conclusão de Curso (TCC). Ela recebe todas as informações do seu trabalho e gera automaticamente todos os elementos pré-textuais (capa, folha de rosto, folha de aprovação, resumo, listas, sumário, etc.).

---

## Importação

```typst
#import "academic-del/lib.typ": figura, sigla, tcc
```

---

## Uso Básico

```typst
#show: doc => tcc(
  // parâmetros aqui...
  doc,
)
```

> [!IMPORTANT]
> O parâmetro `doc` (sem vírgula no final) **sempre** deve ser o último argumento. Ele representa o corpo do documento que vem após a chamada `#show`.

---

## Referência Completa de Parâmetros

### Identificação do Trabalho

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `curso` | `string` | Sim | Nome do curso de graduação |
| `autor` | `string` | Sim | Nome completo do autor |
| `titulo` | `string` | Sim | Título do trabalho |
| `subtitulo` | `string` ou `none` | Não | Subtítulo (omita se não houver) |
| `instituicao` | `string` | Sim | Nome da instituição |
| `local` | `string` | Sim | Cidade onde o trabalho foi defendido |
| `data` | `string` | Sim | Ano de defesa |

**Exemplo:**
```typst
curso: "Engenharia Elétrica",
autor: "João da Silva",
titulo: "Sistema de Monitoramento de Energia:",
subtitulo: "Uma Abordagem com IoT",
instituicao: "Universidade Federal de Sergipe",
local: "São Cristóvão",
data: "2026",
```

---

### Orientação

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `orientador` | `string` | Sim | Nome e titulação do orientador |
| `coorientador` | `string` ou `none` | Não | Nome e titulação do coorientador |

**Exemplo:**
```typst
orientador: "Prof. Dr. Maria Oliveira",
coorientador: "Prof. Dr. Carlos Santos",  // Remover se não houver
```

---

### Texto de Submissão

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `submissao` | `content` ou `none` | Não | Texto descritivo da submissão (aparece na folha de rosto e aprovação) |

Se `none`, o template gera automaticamente um texto padrão baseado nos campos `curso` e `instituicao`.

**Exemplo personalizado:**
```typst
submissao: [Trabalho de Conclusão de Curso submetido à Coordenação de
Graduação em Engenharia Elétrica da Universidade Federal de Sergipe como
parte dos requisitos necessários para a obtenção do grau de Bacharel em
Ciências no Domínio da Engenharia Elétrica.],
```

---

### Banca Examinadora

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `banca` | `array de dicionários` | Sim | Lista de membros da banca |

Cada membro da banca é um dicionário com três campos:

| Campo | Descrição |
|---|---|
| `nome` | Nome e titulação do membro |
| `instituicao` | Instituição do membro |
| `funcao` | Papel na banca (`"Avaliador"`, `"Orientador"`, etc.) |

**Exemplo:**
```typst
banca: (
  (nome: "Prof. Dr. Avaliador Um",    instituicao: "UFS", funcao: "Avaliador"),
  (nome: "Prof. Dr. Avaliadora Dois", instituicao: "UFS", funcao: "Avaliadora"),
  (nome: "Prof. Dr. Maria Oliveira",  instituicao: "UFS", funcao: "Orientadora"),
),
```

---

### Elementos Pré-textuais Opcionais

#### Dedicatória

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `dedicatoria` | `content` ou `none` | `none` | Texto da dedicatória (alinhado à direita, em itálico) |

```typst
dedicatoria: [
  Dedico este trabalho à minha família, pelo apoio incondicional.
],
```

#### Agradecimentos

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `agradecimentos` | `content` ou `none` | `none` | Texto dos agradecimentos |

```typst
agradecimentos: [
  Agradeço à minha orientadora Prof. Dra. Maria Oliveira pela orientação e paciência.
  Agradeço também ao CNPq pelo apoio financeiro.
],
```

#### Epígrafe

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `epigrafe` | `dicionário` ou `content` ou `none` | `none` | Citação ou frase de reflexão |

Aceita dois formatos:

```typst
// Formato com autor (recomendado)
epigrafe: (
  texto: [A imaginação é mais importante que o conhecimento.],
  autor: [Albert Einstein],
),

// Formato livre (content)
epigrafe: [
  "A persistência é o caminho do êxito."
  — Charles Chaplin
],
```

---

### Resumo e Abstract

#### Resumo (em português)

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `resumo` | `dicionário` ou `content` ou `none` | `none` | Resumo do trabalho em português |

```typst
resumo: (
  texto: [
    Este trabalho apresenta... (entre 150 e 500 palavras, em um único parágrafo,
    sem abreviações não consolidadas).
  ],
  palavrasChave: ("IoT", "Energia Elétrica", "Monitoramento"),
),
```

#### Abstract (em inglês)

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `abstract` | `dicionário` ou `content` ou `none` | `none` | Resumo em inglês |

```typst
abstract: (
  texto: [
    This work presents...
  ],
  keywords: ("IoT", "Electrical Energy", "Monitoring"),
),
```

---

### Listas e Sumário

Todos os parâmetros a seguir são booleanos (`true` ou `false`):

| Parâmetro | Padrão | Descrição |
|---|---|---|
| `sumario` | `true` | Gera o Sumário (ABNT NBR 6027) |
| `listaFiguras` | `true` | Gera a Lista de Ilustrações |
| `listaTabelas` | `true` | Gera a Lista de Tabelas |
| `listaSiglas` | `true` | Gera a Lista de Abreviaturas e Siglas |
| `listaSimbolos` | `false` | Gera a Lista de Símbolos (só aparece se `simbolos` não estiver vazio) |

```typst
sumario: true,
listaFiguras: true,
listaTabelas: true,
listaSiglas: true,
listaSimbolos: true,
```

---

### Símbolos e Siglas Estáticas

#### Símbolos

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `simbolos` | `dicionário` | `(:)` | Mapa de símbolo → descrição |

```typst
simbolos: (
  "V": "Tensão elétrica (Volts)",
  "I": "Corrente elétrica (Ampères)",
  "P": "Potência elétrica (Watts)",
  "η": "Rendimento (adimensional)",
),
```

> [!NOTE]
> A lista de símbolos só é gerada se `listaSimbolos: true` **e** `simbolos` tiver ao menos um item.

#### Siglas Estáticas

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `siglas` | `dicionário` | `(:)` | Siglas adicionadas manualmente à lista (sem aparecer no texto) |

As siglas inseridas via `#sigla("ABNT", "...")` no corpo do texto são coletadas automaticamente. Use `siglas` apenas para adicionar siglas que aparecem em figuras, tabelas ou outros elementos não processados dinamicamente.

```typst
siglas: (
  "ABNT": "Associação Brasileira de Normas Técnicas",
),
```

---

### Tipografia

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `fonte` | `string` | `"Arimo"` | Família tipográfica principal |

A fonte padrão **Arimo** é compatível com **Arial**, fonte exigida pela ABNT. Altere apenas se tiver uma justificativa específica.

```typst
fonte: "Arimo",  // Padrão — não altere sem motivo
```

---

## Template TCC com Valores Mínimos

Para um TCC sem elementos opcionais (dedicatória, coorientador, etc.):

```typst
#import "academic-del/lib.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Nome do Aluno",
  titulo: "Título do Trabalho",
  instituicao: "Universidade Federal de Sergipe",
  local: "São Cristóvão",
  data: "2026",
  orientador: "Nome do Orientador, D. Sc.",
  banca: (
    (nome: "Avaliador 1", instituicao: "UFS", funcao: "Avaliador"),
    (nome: "Avaliador 2", instituicao: "UFS", funcao: "Avaliador"),
    (nome: "Nome do Orientador, D. Sc.", instituicao: "UFS", funcao: "Orientador"),
  ),
  resumo: (
    texto: [Resumo do trabalho...],
    palavrasChave: ("Palavra1", "Palavra2"),
  ),
  abstract: (
    texto: [Abstract of the work...],
    keywords: ("Word1", "Word2"),
  ),
  doc,
)

= Introdução
Texto da introdução...
```

---

## Arquivo de Exemplo Prático

Um modelo de TCC está disponível no arquivo `academic-del/examples/tcc.typ`. Você pode utilizá-lo como base para iniciar o seu documento.

> [!IMPORTANT]
> Caso deseje compilar o arquivo de exemplo diretamente via **Typst CLI**, informe a flag `--root .` para que os imports sejam resolvidas a partir da raiz:
> ```sh
> typst compile academic-del/examples/tcc.typ --root ./ --font-path ./academic-del/assets/fonts
> ```

---

[← Primeiros Passos](./03-primeiros-passos.md) | [Próximo: Configuração PIBIC →](./04b-configuracao-pibic.md)
