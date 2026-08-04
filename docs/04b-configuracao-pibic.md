# 4b. Configuração — Parâmetros da Função `relatorioFinal()` (PIBIC/PICVOL)

A função `relatorioFinal()` foi desenvolvida especificamente para a elaboração de **Relatórios Finais de Iniciação Científica (PIBIC/PICVOL)** no padrão institucional da UFS (POSGRAP/COPES).

---

## Importação

```typst
#import "academic-del/lib.typ": figura, relatorioFinal, sigla
```

---

## Uso Básico

```typst
#show: doc => relatorioFinal(
  tituloProjeto: "Título do Projeto de Pesquisa",
  tituloPlanoDeTrabalho: "Título do Plano de Trabalho",
  autor: "Nome do Bolsista",
  // parâmetros aqui...
  doc,
)
```

> [!IMPORTANT]
> O parâmetro `doc` (sem vírgula no final) **sempre** deve ser o último argumento. Ele representa o corpo do documento que vem após a chamada `#show`.

---

## Referência Completa de Parâmetros

### Identificação do Projeto e Plano de Trabalho

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `tituloProjeto` | `string` | `""` | Título do projeto de pesquisa cadastrado na POSGRAP/COPES |
| `tituloPlanoDeTrabalho` | `string` | `""` | Título do plano de trabalho individual do aluno |
| `autor` | `string` | `""` | Nome completo do aluno bolsista ou voluntário |
| `voluntario` | `bool` | `false` | Se `false`, identifica como PIBIC; se `true`, identifica como PICVOL (Voluntário) |

**Exemplo:**
```typst
tituloProjeto: "Desenvolvimento de Antenas Fractais para Detecção de Descargas Parciais",
tituloPlanoDeTrabalho: "Miniaturização de Antena Monopolo Impressa Circular",
autor: "Bruno Cardoso Ferreira da Silva",
voluntario: false, // Setar 'true' caso seja voluntário (PICVOL)
```

---

### Período da Bolsa / Vigência

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `dataInicial` | `string` | `"janeiro de 2026"` | Mês e ano de início do período da bolsa (ex: `"setembro de 2025"`) |
| `dataFinal` | `string` | `"dezembro de 2026"` | Mês e ano de término do período da bolsa (ex: `"agosto de 2026"`) |

**Exemplo:**
```typst
dataInicial: "setembro de 2025",
dataFinal: "agosto de 2026",
```

---

### Resumo e Palavras-chave

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `resumo` | `dicionário` ou `content` | `none` | Resumo do relatório final e lista de palavras-chave |

Pode ser passado como dicionário com `texto` e `palavrasChave`, ou como bloco simples de conteúdo (`[Texto do resumo...]`).

**Exemplo (dicionário):**
```typst
resumo: (
  texto: [
    Este relatório final apresenta os resultados obtidos durante o período de vigência da bolsa de Iniciação Científica (PIBIC)...
  ],
  palavrasChave: ("Iniciação Científica", "PIBIC", "Antenas", "Typst"),
),
```

---

### Sumário e Tipografia

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `sumario` | `bool` | `true` | Habilita a geração automática do Sumário |
| `fonte` | `string` | `"Arimo"` | Família tipográfica principal (Arimo/Arial) |

```typst
sumario: true,
fonte: "Arimo",
```

---

## Template PIBIC/PICVOL com Valores Mínimos

```typst
#import "academic-del/lib.typ": figura, relatorioFinal, sigla

#show: doc => relatorioFinal(
  tituloProjeto: "Título do Projeto de Pesquisa",
  tituloPlanoDeTrabalho: "Título do Plano de Trabalho",
  autor: "Nome do Bolsista",
  voluntario: false, // true para PICVOL
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  sumario: true,
  resumo: (
    texto: [Resumo do relatório de iniciação científica...],
    palavrasChave: ("Iniciação Científica", "PIBIC", "Typst"),
  ),
  doc,
)

= Introdução
Texto da introdução...
```

---

[← Configuração TCC](./04a-configuracao-tcc.md) | [Próximo: Elementos Textuais →](./05-elementos-textuais.md)
