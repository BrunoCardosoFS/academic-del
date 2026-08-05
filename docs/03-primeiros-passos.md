# 3. Primeiros Passos

---

## Estrutura de Arquivos

Após extrair o template, a estrutura esperada é:

```
meu-projeto/
├── academic-del/    ← Pasta do template (NÃO edite)
├── main.typ         ← Seu arquivo principal (EDITE ESTE)
└── referencias.bib  ← Suas referências BibTeX (EDITE ESTE)
```

> [!CAUTION]
> **Não modifique** os arquivos dentro da pasta `academic-del/`. Qualquer customização deve ser feita no `main.typ` por meio dos parâmetros da função `tcc()` ou `relatorioFinal()`.

---

## Exemplo de main.typ

Abaixo está um `main.typ` com os elementos para um TCC:

```typst
#import "academic-del/lib.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "João da Silva",
  titulo: "Sistema de Monitoramento de Energia Elétrica:",
  subtitulo: "Uma Abordagem com IoT",
  instituicao: "Universidade Federal de Sergipe",
  local: "São Cristóvão",
  data: "2026",
  orientador: "Prof. Dr. Maria Oliveira",
  coorientador: "Prof. Dr. Carlos Santos",

  submissao: [Trabalho de Conclusão de Curso submetido à Coordenação de
  Graduação em Engenharia Elétrica da Universidade Federal de Sergipe como
  parte dos requisitos necessários para a obtenção do grau de Bacharel em
  Ciências no Domínio da Engenharia Elétrica.],

  banca: (
    (nome: "Prof. Dr. Avaliador Um",     instituicao: "UFS", funcao: "Avaliador"),
    (nome: "Prof. Dr. Avaliadora Dois",  instituicao: "UFS", funcao: "Avaliadora"),
    (nome: "Prof. Dr. Maria Oliveira",   instituicao: "UFS", funcao: "Orientadora"),
  ),

  dedicatoria: [
    Dedico este trabalho à minha família, pelo apoio incondicional.
  ],

  agradecimentos: [
    Agradeço à minha orientadora pela paciência e dedicação.
  ],

  epigrafe: (
    texto: [A imaginação é mais importante que o conhecimento.],
    autor: [Albert Einstein],
  ),

  resumo: (
    texto: [
      Este trabalho apresenta um sistema de monitoramento de energia elétrica
      residencial baseado em Internet das Coisas (IoT)...
    ],
    palavrasChave: ("IoT", "Energia Elétrica", "Monitoramento", "Arduino"),
  ),

  abstract: (
    texto: [
      This work presents a residential electrical energy monitoring system
      based on Internet of Things (IoT)...
    ],
    keywords: ("IoT", "Electrical Energy", "Monitoring", "Arduino"),
  ),

  sumario: true,
  listaFiguras: true,
  listaTabelas: true,
  listaSiglas: true,
  listaSimbolos: true,
  simbolos: (
    "V": "Tensão elétrica (Volts)",
    "I": "Corrente elétrica (Ampères)",
    "P": "Potência elétrica (Watts)",
  ),
  doc,
)

= Introdução

O monitoramento do consumo de energia elétrica é fundamental para...
O #sigla("IoT", "Internet das Coisas") tem revolucionado este campo.

== Objetivos

=== Objetivo Geral
Desenvolver um sistema de monitoramento...

=== Objetivos Específicos
- Implementar a leitura de tensão e corrente;
- Transmitir os dados via #sigla("WiFi");
- Exibir o consumo em tempo real.

= Desenvolvimento

== Metodologia

#figura(
  image("figuras/diagrama.png", width: 80%),
  caption: [Diagrama de blocos do sistema.],
  fonte: [Autoria própria.],
) <fig-diagrama>

Conforme ilustrado na @fig-diagrama, o sistema é composto por...

= Conclusão

O sistema desenvolvido demonstrou...

// ============================
// ELEMENTOS PÓS-TEXTUAIS
// ============================
#set heading(numbering: none)
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
```

---

## Exemplo para Relatório PIBIC / PICVOL

Se o seu trabalho for um **Relatório Final de Iniciação Científica**, utilize a função `relatorioFinal` em vez de `tcc`:

```typst
#import "academic-del/lib.typ": figura, relatorioFinal, sigla

#show: doc => relatorioFinal(
  tituloProjeto: "Título do Projeto de Pesquisa",
  tituloPlanoDeTrabalho: "Título do Plano de Trabalho do Bolsista",
  autor: "Nome do Bolsista",
  voluntario: false, // setar true para PICVOL
  dataInicial: "setembro de 2025",
  dataFinal: "agosto de 2026",
  sumario: true,
  resumo: (
    texto: [
      Este trabalho apresenta um sistema de monitoramento de energia elétrica
      residencial baseado em Internet das Coisas (IoT)...
    ],
    palavrasChave: ("IoT", "Energia Elétrica", "Monitoramento", "Arduino"),
  ),
  doc,
)

= Introdução

O monitoramento do consumo de energia elétrica é fundamental para...
O #sigla("IoT", "Internet das Coisas") tem revolucionado este campo.

= Objetivos

== Objetivo Geral
Desenvolver um sistema de monitoramento...

== Objetivos Específicos
- Implementar a leitura de tensão e corrente;
- Transmitir os dados via #sigla("WiFi");
- Exibir o consumo em tempo real.

= Revisão Bibliográfica
Os trabalhos de...

= Metodologia

#figura(
  image("figuras/diagrama.png", width: 80%),
  caption: [Diagrama de blocos do sistema.],
  fonte: [Autoria própria.],
) <fig-diagrama>

Conforme ilustrado na @fig-diagrama, o sistema é composto por...

= Conclusão

O sistema desenvolvido demonstrou...

// ============================
// ELEMENTOS PÓS-TEXTUAIS
// ============================
#set heading(numbering: none)
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")
```

---

## Compilando o Documento

```sh
# Compilar uma vez
typst compile main.typ --font-path ./academic-del/assets/fonts

# Compilar com atualização automática ao salvar
typst watch main.typ --font-path ./academic-del/assets/fonts
```

O PDF será gerado na mesma pasta com o nome `main.pdf`.

---

[← Instalação](./02-instalacao.md) | [Próximo: Configuração TCC →](./04a-configuracao-tcc.md)
