# 5. Elementos Textuais

Esta seção documenta todos os recursos disponíveis para uso no corpo do seu trabalho (introdução, desenvolvimento e conclusão).

---

## Formatação Básica de Texto

| Efeito | Sintaxe | Resultado |
|---|---|---|
| **Negrito** | `*texto em negrito*` | **texto em negrito** |
| *Itálico* | `_texto em itálico_` | *texto em itálico* |
| `Código inline` | `` `código` `` | `código` |

---

## Seções e Capítulos

O Typst usa o caractere `=` para títulos. O número de `=` indica o nível hierárquico conforme a ABNT NBR 6024:

```typst
= Seção Primária (Capítulo)
== Seção Secundária
=== Seção Terciária
==== Seção Quaternária
```

O template numera automaticamente todos os títulos textuais no formato `1`, `1.1`, `1.1.1`, etc. Os capítulos de nível 1 sempre começam em uma nova página.

**Formatação aplicada pelo template:**

| Nível | Formatação |
|---|---|
| 1 (Capítulo) | MAIÚSCULAS, **negrito**, nova página |
| 2 | **Negrito** normal |
| 3 | Regular (sem negrito) |
| 4 | Regular, *itálico* |

---

## Listas

### Lista com Marcadores

```typst
- Item de primeiro nível
  - Subitem de segundo nível
    - Subitem de terceiro nível
```

Marcadores padrão ABNT: `•`, `◦`, `–`

### Lista Numerada

```typst
+ Primeiro item
+ Segundo item
+ Terceiro item
```

O Typst usa letras (`a)`, `b)`, `c)`) por padrão conforme o template ABNT.

---

## Figuras

O template fornece a função `#figura()` que insere a legenda acima e a fonte abaixo, conforme exigido pela ABNT NBR 14724.

### Sintaxe

```typst
#figura(
  CONTEÚDO,
  caption: [Legenda da figura.],
  fonte: [Indicação da fonte],   // Opcional
) <rotulo-da-figura>
```

### Parâmetros

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| (1º posicional) | `content` | Sim | O conteúdo da figura (imagem, diagrama, etc.) |
| `caption` | `content` | Sim | Legenda exibida acima da figura |
| `fonte` | `content` ou `string` | Não | Fonte exibida abaixo. Se omitido: `"Fonte: Autoria própria."` |
| `gap` | `length` | Não | Espaçamento entre figura e fonte |

> [!NOTE]
> Se `fonte` iniciar com `"Fonte:"` ou `"fonte:"`, o texto é usado literalmente. Caso contrário, `"Fonte: "` é prefixado automaticamente.

### Exemplos

**Imagem simples (fonte própria):**
```typst
#figura(
  image("figuras/circuito.png", width: 80%),
  caption: [Circuito elétrico do protótipo.],
) <fig-circuito>
```

**Imagem com fonte de terceiros:**
```typst
#figura(
  image("figuras/grafico.png", width: 70%),
  caption: [Consumo de energia por setor.],
  fonte: [ANEEL (2024).],
) <fig-consumo>
```

**String iniciando com "Fonte:" (uso literal):**
```typst
#figura(
  image("figuras/mapa.png", width: 90%),
  caption: [Mapa de cobertura da rede.],
  fonte: "Fonte: Adaptado de IBGE (2023).",
) <fig-mapa>
```

### Referenciando Figuras no Texto

Use `@rotulo` para referenciar:

```typst
A @fig-circuito ilustra o diagrama de blocos do sistema.
```

> [!IMPORTANT]
> Toda figura deve ser citada no texto **antes** de sua aparição no documento.

---

## Tabelas

As tabelas seguem o padrão do IBGE e da ABNT NBR 14724: sem linhas verticais nas extremidades, com linhas horizontais separando o cabeçalho e o rodapé. Use `#figura` combinado com `table`:

### Tabela Simples

```typst
#figura(
  table(
    columns: (auto, auto, auto),
    stroke: none,
    table.hline(),
    [*Parâmetro*], [*Valor*], [*Unidade*],
    table.hline(stroke: 0.5pt),
    [Tensão], [220,0], [V],
    [Corrente], [12,5], [A],
    [Potência], [2.750,0], [W],
    table.hline(),
  ),
  caption: [Parâmetros elétricos medidos.],
) <tab-parametros>
```

### Tabela com Células Mescladas

```typst
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
    [Rendimento (%)], [88,4], [91,2], [94,5],
    table.hline(),
  ),
  caption: [Resultados por cenário de ensaio.],
) <tab-resultados>
```

---

## Equações Matemáticas

### Equação em Bloco (Numerada)

Equações em bloco são delimitadas por `$` com espaço interno:

```typst
$ R = rho dot l / A $ <eq-resistencia>
```

Para referenciar: `@eq-resistencia`

**Exemplos de sintaxe matemática:**

| Fórmula | Código Typst |
|---|---|
| $R = ρ · l/A$ | `R = rho dot l / A` |
| $E = mc²$ | `E = m c^2` |
| $\sqrt{a^2 + b^2}$ | `sqrt(a^2 + b^2)` |
| $\frac{1}{2}$ | `1/2` |
| $\sum_{i=1}^{n} x_i$ | `sum_(i=1)^n x_i` |
| $\int_0^L f(x)dx$ | `integral_0^L f(x) dif x` |

**Legenda da equação no texto:**
```typst
$ R = rho dot l / A $ <eq-resistencia>

em que $R$ é a resistência elétrica ($Omega$), $rho$ a resistividade ($Omega dot m$),
$l$ o comprimento ($m$) e $A$ a área da seção transversal ($m^2$), conforme @eq-resistencia.
```

### Equação Inline

Para equações dentro do parágrafo, sem espaço interno:

```typst
A energia dissipada é dada por $P = V dot I$, onde $V$ é a tensão e $I$ a corrente.
```

---

## Gerenciamento de Siglas

O template possui um sistema dinâmico de siglas integrado à **Lista de Abreviaturas e Siglas**.

### Função `#sigla()`

**Primeira ocorrência** — registra a sigla e exibe no formato `Nome por Extenso (SIGLA)`:

```typst
#sigla("UFS", "Universidade Federal de Sergipe")
```
→ Resultado: *Universidade Federal de Sergipe (UFS)*

**Ocorrências seguintes** — exibe apenas a sigla:
```typst
A #sigla("UFS") é uma instituição federal de ensino.
```
→ Resultado: *A UFS é uma instituição federal de ensino.*

> [!NOTE]
> Todas as siglas registradas com `#sigla("SIGLA", "Definição")` são coletadas automaticamente e inseridas na **Lista de Abreviaturas e Siglas**, em ordem alfabética.

### Siglas Estáticas (via parâmetro)

Para adicionar siglas que não aparecem no corpo textual (como siglas em figuras ou tabelas), use o parâmetro `siglas` da função `tcc()`:

```typst
siglas: (
  "ABNT": "Associação Brasileira de Normas Técnicas",
  "IEEE": "Institute of Electrical and Electronics Engineers",
),
```

---

## Citações e Referências Bibliográficas

### Arquivo .bib

As referências são gerenciadas em um arquivo BibTeX (ex: `referencias.bib`):

```bibtex
@book{sobrenome2024,
  author    = {Sobrenome, Nome},
  title     = {Título do Livro},
  year      = {2024},
  publisher = {Editora},
  address   = {Cidade},
}

@article{silva2023,
  author  = {Silva, João},
  title   = {Título do Artigo},
  journal = {Nome do Periódico},
  year    = {2023},
  volume  = {10},
  number  = {2},
  pages   = {100--120},
}
```

### Citações no Texto (ABNT NBR 10520)

| Tipo | Sintaxe | Resultado |
|---|---|---|
| Citação indireta | `@sobrenome2024` | (SOBRENOME, 2024) |
| Com página | `@sobrenome2024[p. 45]` | (SOBRENOME, 2024, p. 45) |

**Exemplos:**
```typst
Segundo as diretrizes da norma @abnt14724, os elementos pré-textuais...

Conforme aponta @silva2023 [p. 5], a eficiência do sistema...
```

### Citação Direta Longa (mais de 3 linhas)

Para citações diretas com mais de 3 linhas, utilize `#quote(block: true)` para aplicar o recuo regulamentar de 4 cm e redução da fonte:

```typst
Conforme @sobrenome2024 [p. 120]:

#quote(block: true)[
  A adoção de modelos formais de documentação em ambientes acadêmicos visa
  padronizar a difusão do conhecimento científico e assegurar a integridade
  da comunicação acadêmica em todas as suas formas de expressão.
]
```

### Inclusão da Lista de Referências

No final do documento (após `#set heading(numbering: none)`):

```typst
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
```

---

## Paginação

O template gerencia automaticamente a numeração de páginas conforme a ABNT NBR 14724:

- **Elementos pré-textuais** (capa até sumário): páginas contadas mas sem número impresso.
- **Elementos textuais** (introdução em diante): número impresso no **canto superior direito** em algarismos arábicos.
- A contagem começa a partir da folha de rosto.

Nenhuma configuração adicional é necessária — o template cuida disso automaticamente.

---

[← Configuração PIBIC](./04b-configuracao-pibic.md) | [Próximo: Elementos Pós-Textuais →](./06-elementos-pos-textuais.md)
