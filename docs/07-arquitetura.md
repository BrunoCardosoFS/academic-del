# 7. Arquitetura Interna do Template

Esta seção documenta a estrutura de arquivos e o funcionamento interno do **academic-del**, voltada para quem deseja entender ou contribuir com o template.

---

## Visão Geral

O template foi estruturado de forma modular: cada responsabilidade é isolada em seu próprio arquivo, favorecendo a reutilização e a manutenção.

```
academic-del/
├── lib.typ                  ← Ponto de entrada público (re-exporta tcc, relatorioFinal, relatorioFinalPIBIC, relatorioFinalPIBITI, figura, sigla)
├── assets/
│   ├── fonts/               ← Arquivos de fontes tipográficas (Arimo)
│   └── images/              ← Logotipos e brasões institucionais (Brasao.svg, posgrap.png, agitte.png)
├── models/
│   ├── tcc.typ              ← Função principal tcc() — orquestra os pré-textuais de TCC
│   ├── pibic.typ            ← Função principal relatorioFinalPIBIC() (alias: relatorioFinal) — PIBIC/PICVOL
│   └── pibiti.typ           ← Função principal relatorioFinalPIBITI() — PIBITI
└── core/
    ├── format.typ           ← Estilos ABNT globais (margens, fonte, seções, equações)
    ├── utils.typ            ← Funções públicas: figura() e sigla()
    ├── listas.typ           ← Sumário e listas (figuras, tabelas, siglas, símbolos)
    └── pretextuais.typ      ← Elementos opcionais: dedicatória, agradecimentos, epígrafe, resumo
```

---

## Descrição dos Módulos

### `lib.typ` — Ponto de Entrada Público

```
Versão: 0.0.3
Licença: MIT
```

Este arquivo é o único que o usuário importa. Ele re-exporta as funções utilitárias do `core/utils.typ` e as funções principais de cada modelo em `models/`:

```typst
// lib.typ
#import "core/utils.typ": *
#import "models/tcc.typ": *
#import "models/pibiti.typ": relatorioFinalPIBITI
#import "models/pibic.typ": relatorioFinalPIBIC
#import "models/pibic.typ": relatorioFinalPIBIC as relatorioFinal // Retrocompatibilidade
```

**Propósito:** Isolar o usuário da estrutura interna de pastas. Mesmo que os módulos internos sejam reorganizados, o import `"academic-del/lib.typ"` permanece estável.

---

### `models/tcc.typ` — Função Principal TCC

Contém a função `tcc()` que:

1. Chama `aplicar-estilos-abnt()` para configurar o documento.
2. Gera os elementos pré-textuais na ordem correta:
   - Capa (página personalizada UFS)
   - Folha de Rosto (ABNT NBR 14724)
   - Folha de Aprovação (ABNT NBR 14724)
   - Dedicatória (opcional)
   - Agradecimentos (opcional)
   - Epígrafe (opcional)
   - Resumo (ABNT NBR 6028)
   - Abstract (ABNT NBR 14724)
   - Lista de Ilustrações
   - Lista de Tabelas
   - Lista de Abreviaturas e Siglas
   - Lista de Símbolos
   - Sumário (ABNT NBR 6027)
3. Ativa a numeração de páginas.
4. Renderiza o `body` (corpo do documento).

---

### `models/pibic.typ` — Função PIBIC / PICVOL

Contém a função `relatorioFinalPIBIC()` (disponível também via alias `relatorioFinal()`) que:

1. Chama `aplicar-estilos-abnt()` para aplicar a formatação ABNT.
2. Gera a capa institucional padronizada da UFS (POSGRAP/COPES) com logos e dados do projeto/plano de trabalho.
3. Renderiza a folha de Resumo (ABNT NBR 6028) e o Sumário (ABNT NBR 6027).
4. Ativa a numeração de páginas no canto superior direito a partir da Introdução.
5. Renderiza o `body` (corpo do relatório).

---

### `models/pibiti.typ` — Função PIBITI

Contém a função `relatorioFinalPIBITI()` que:

1. Chama `aplicar-estilos-abnt()` para aplicar a formatação ABNT.
2. Gera a capa institucional padronizada da UFS (POSGRAP/AGITTE) com logos institucionais (Brasão UFS, POSGRAP e AGITTE) e dados de área, subárea e especialidade do conhecimento.
3. Renderiza a folha de Resumo (ABNT NBR 6028) e o Sumário (ABNT NBR 6027).
4. Ativa a numeração de páginas no canto superior direito a partir da Introdução.
5. Renderiza o `body` (corpo do relatório).

---

### `core/format.typ` — Estilos ABNT

Contém a função `aplicar-estilos-abnt(fonte, body)` que configura as **regras globais de estilo** do documento:

| Regra | Especificação |
|---|---|
| **Tamanho do papel** | A4 |
| **Margens** | Superior: 30 mm, Esquerda: 30 mm, Direita: 20 mm, Inferior: 20 mm |
| **Fonte** | Arimo, 12 pt |
| **Idioma** | Português (Brasil) |
| **Espaçamento do texto** | 0.65 em (≈ 1.5 linhas) |
| **Alinhamento** | Justificado |
| **Recuo de parágrafo** | 12,5 mm (primeira linha) |
| **Marcadores de lista** | `•`, `◦`, `–` |
| **Numeração de listas** | `a)`, `b)`, `c)` |
| **Numeração de seções** | `1.1.1` progressivo |
| **Equações** | Numeradas `(1)`, `(2)`, ... |
| **Cabeçalhos de figuras** | Legenda acima; fonte 10 pt abaixo |
| **Numeração de figuras** | `Figura 1 – Legenda` |
| **Estilo de bibliografias** | Parágrafo não-justificado, 12 pt |

**Variável exportada:**
- `defaultFigureGap` — espaçamento padrão entre corpo da figura e fonte (0.65 em)

---

### `core/utils.typ` — Funções Utilitárias

Contém as duas funções públicas do template:

#### `sigla(curta, longa?)` — Gerenciador de Siglas

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `curta` | `string` | Abreviatura (ex: `"UFS"`) |
| `longa` | `string` (opcional) | Forma por extenso |

**Comportamento:**
- Se `longa` for fornecida: registra no estado `_siglasState` e exibe `"Forma por Extenso (SIGLA)"`.
- Se `longa` for omitida: exibe apenas `"SIGLA"`.

**Estado global:** `_siglasState` é um `state()` do Typst que acumula todas as siglas registradas ao longo do corpo do texto. Esse estado é lido por `lista-siglas()` para gerar a lista final.

#### `figura(body, caption?, fonte?, gap?, ...rest)` — Figura com Fonte

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `body` | `content` | — | Conteúdo da figura |
| `caption` | `content` | `none` | Legenda |
| `fonte` | `content` ou `string` | `none` | Fonte (padrão: `"Fonte: Autoria própria."`) |
| `gap` | `length` | `defaultFigureGap` | Espaço entre corpo e fonte |

**Comportamento da `fonte`:**
1. `none` → `"Fonte: Autoria própria."`
2. String que começa com `"Fonte:"` ou `"fonte:"` → usada literalmente
3. Qualquer outro valor → prefixado com `"Fonte: "`

---

### `core/listas.typ` — Sumário e Listas

Contém funções que geram as páginas de listas pré-textuais:

| Função | Gera |
|---|---|
| `lista-figuras()` | Lista de Ilustrações (target: `figure.where(kind: image)`) |
| `lista-tabelas()` | Lista de Tabelas (target: `figure.where(kind: table)`) |
| `lista-siglas(siglas, siglasState)` | Lista de Abreviaturas e Siglas (merge de estáticas + dinâmicas, ordenadas alfabeticamente) |
| `lista-simbolos(simbolos)` | Lista de Símbolos (ordenada alfabeticamente) |
| `sumario()` | Sumário com hierarquia tipográfica por nível |

**Estilo do Sumário:**
- Nível 1: `MAIÚSCULAS`, **negrito**
- Nível 2: **Negrito**
- Nível 3: Regular
- Nível 4+: *Itálico*

---

### `core/pretextuais.typ` — Elementos Pré-textuais Opcionais

Contém funções que geram páginas individuais:

| Função | Elemento | Formatação |
|---|---|---|
| `dedicatoria(corpo)` | Dedicatória | Texto alinhado à direita, 60% da largura, itálico |
| `agradecimentos(corpo)` | Agradecimentos | Título centralizado em negrito; parágrafo com recuo 12,5 mm |
| `epigrafe(corpo)` | Epígrafe | Texto alinhado à direita, 60% da largura; suporta `{texto, autor}` ou `content` livre |
| `resumo(titulo, corpo, tituloPalavras?, palavrasChave?)` | Resumo / Abstract | Título centralizado em negrito; sem recuo de parágrafo; palavras-chave separadas por `;` |

---

## Fluxo de Dados

```
Usuário escreve main.typ
    │
    ▼
#import "academic-del/lib.typ": tcc, figura, sigla
    │
    ├─► lib.typ re-exporta de components/tcc.typ
    │
    ▼
#show: doc => tcc(params..., doc)
    │
    ├─► aplicar-estilos-abnt() [format.typ]
    │       └── Configura page, text, par, list, heading, math, figure, bibliography
    │
    ├─► Gera páginas pré-textuais [tcc.typ]
    │       ├── Capa, Rosto, Aprovação (inline em tcc.typ)
    │       ├── dedicatoria, agradecimentos, epigrafe [pretextuais.typ]
    │       ├── resumo, abstract [pretextuais.typ]
    │       ├── lista-figuras, lista-tabelas [listas.typ]
    │       ├── lista-siglas(_siglasState) [listas.typ + utils.typ]
    │       ├── lista-simbolos [listas.typ]
    │       └── sumario [listas.typ]
    │
    ├─► Ativa numeração de páginas
    │
    └─► Renderiza body (corpo do documento)
            │
            ├── #sigla() → atualiza _siglasState [utils.typ]
            └── #figura() → cria figure com fonte [utils.typ]
```

---

## Versão Atual

**v0.0.3** — Suporte ao modelo PIBITI e reorganização de modelos e assets

Para o histórico completo de mudanças, consulte o [Changelog](./08-changelog.md).

---

[← Elementos Pós-Textuais](./06-elementos-pos-textuais.md) | [Próximo: Changelog →](./08-changelog.md)
