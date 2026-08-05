# 4c. Configuração — Parâmetros da Função `relatorioFinalPIBITI()` (PIBITI)

A função `relatorioFinalPIBITI()` foi desenvolvida especificamente para a elaboração de **Relatórios Finais do Programa Institucional de Iniciação em Desenvolvimento Tecnológico e Inovação (PIBITI)** no padrão institucional da UFS (POSGRAP/AGITTE).

---

## Importação

```typst
#import "academic-del/lib.typ": figura, relatorioFinalPIBITI, sigla
```

---

## Uso Básico

```typst
#show: doc => relatorioFinalPIBITI(
  tituloProjeto: "Título do Projeto de Inovação Tecnológica",
  areaDoConhecimento: "Engenharias",
  subAreaDoConhecimento: "Engenharia Elétrica",
  especialidadeDoConhecimento: "Medição e Controle",
  autor: "Nome do Bolsista",
  // parâmetros adicionais aqui...
  doc,
)
```

> [!IMPORTANT]
> O parâmetro `doc` (sem vírgula no final) **sempre** deve ser o último argumento. Ele representa o corpo do documento que vem após a chamada `#show`.

---

## Referência Completa de Parâmetros

### Identificação do Projeto e Classificação do Conhecimento

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `tituloProjeto` | `string` | `""` | Título do projeto de desenvolvimento tecnológico cadastrado na POSGRAP/AGITTE |
| `areaDoConhecimento` | `string` | `""` | Área grande do conhecimento CNPq (ex: `"Engenharias"`) |
| `subAreaDoConhecimento` | `string` | `""` | Subárea do conhecimento CNPq (ex: `"Engenharia Elétrica"`) |
| `especialidadeDoConhecimento` | `string` | `""` | Especialidade da pesquisa (ex: `"Sistemas Eletrônicos de Medição"`) |
| `autor` | `string` | `""` | Nome completo do aluno bolsista |

**Exemplo:**
```typst
tituloProjeto: "Desenvolvimento de Plataforma IoT para Monitoramento Térmico Industrial",
areaDoConhecimento: "Engenharias",
subAreaDoConhecimento: "Engenharia Elétrica",
especialidadeDoConhecimento: "Instrumentação Eletrônica",
autor: "Bruno Cardoso Ferreira da Silva",
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
    Este relatório final apresenta os resultados obtidos durante o período de vigência da bolsa PIBITI...
  ],
  palavrasChave: ("Desenvolvimento Tecnológico", "PIBITI", "Inovação", "Typst"),
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

## Template PIBITI com Valores Mínimos

```typst
#import "academic-del/lib.typ": figura, relatorioFinalPIBITI, sigla

#show: doc => relatorioFinalPIBITI(
  tituloProjeto: "Título do Projeto de Pesquisa Aplicada",
  areaDoConhecimento: "Engenharias",
  subAreaDoConhecimento: "Engenharia Elétrica",
  especialidadeDoConhecimento: "Automação Eletrônica",
  autor: "Nome do Bolsista",
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  sumario: true,
  resumo: (
    texto: [Resumo do relatório de desenvolvimento tecnológico...],
    palavrasChave: ("Inovação", "PIBITI", "Typst"),
  ),
  doc,
)

= Introdução
Texto da introdução...

// ============================
// ELEMENTOS PÓS-TEXTUAIS
// ============================
#set heading(numbering: none)
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
```

---

## Arquivo de Exemplo

Um modelo de Relatório Final PIBITI está disponível no arquivo `academic-del/examples/pibiti.typ`. Você pode utilizá-lo como base para iniciar o seu documento.

> [!IMPORTANT]
> Caso deseje compilar o arquivo de exemplo diretamente via **Typst CLI**, informe a flag `--root .` para que os imports sejam resolvidos a partir da raiz:
> ```sh
> typst compile academic-del/examples/pibiti.typ --root ./ --font-path ./academic-del/assets/fonts
> ```

---

[← Configuração PIBIC/PICVOL](./04b-configuracao-pibic.md) | [Próximo: Elementos Textuais →](./05-elementos-textuais.md)
