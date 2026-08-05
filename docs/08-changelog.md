# 8. Changelog — Histórico de Versões

## v0.0.3 — Suporte ao Modelo PIBITI e Reorganização de Modelos

**Data:** Agosto de 2026

### O que mudou

Esta versão adiciona suporte ao modelo de Relatório Final do Programa Institucional de Iniciação em Desenvolvimento Tecnológico e Inovação (**PIBITI**) e reorganiza a estrutura interna do pacote.

#### Novos arquivos e modelos

| Arquivo | Descrição |
|---|---|
| `models/pibiti.typ` | Função principal `relatorioFinalPIBITI()`, orquestra a capa institucional UFS/POSGRAP/AGITTE e pré-textuais PIBITI |
| `examples/pibiti.typ` | Exemplo completo e compilável para Relatório Final PIBITI |
| `docs/04c-configuracao-pibiti.md` | Guia de configuração e referência de parâmetros do modelo PIBITI |

#### Reorganização de arquivos

- A pasta de componentes (`components/`) foi renomeada/reorganizada para `models/` (`tcc.typ`, `pibic.typ`, `pibiti.typ`).
- Os assets foram consolidados na pasta `assets/`:
  - `assets/fonts/`: Fontes tipográficas (**Arimo**).
  - `assets/images/`: Imagens e brasões institucionais (`Brasao.svg`, `posgrap.png`, `agitte.png`).
- O ponto de entrada `lib.typ` foi atualizado para exportar `relatorioFinalPIBITI`, `relatorioFinalPIBIC` (com alias `relatorioFinal`), `tcc`, `figura` e `sigla`.

---

## v0.0.2 — Refatoração Modular

**Data:** Agosto de 2026

### O que mudou

Esta versão refatora o template de um arquivo monolítico (`config.typ`) para uma arquitetura modular com separação de responsabilidades.

#### Novos arquivos

| Arquivo | Descrição |
|---|---|
| `lib.typ` | Ponto de entrada público — re-exporta `tcc`, `relatorioFinal`, `figura` e `sigla` |
| `components/tcc.typ` | Função principal `tcc()`, orquestra todos os pré-textuais de TCC |
| `components/pibic.typ` | Função principal `relatorioFinal()`, orquestra a capa e pré-textuais de relatórios PIBIC/PICVOL |
| `core/format.typ` | Estilos ABNT reutilizáveis (`aplicar-estilos-abnt()`) |
| `core/utils.typ` | Funções utilitárias: `figura()` e `sigla()` |
| `core/listas.typ` | Sumário e listas de figuras, tabelas, siglas e símbolos |
| `core/pretextuais.typ` | Dedicatória, agradecimentos, epígrafe e resumo |

#### Arquivos removidos

| Arquivo | Motivo |
|---|---|
| `config.typ` | Conteúdo migrado para os módulos de `core/` e `components/` |

#### Mudanças de API

- A função `pagina-resumo` foi renomeada para `resumo` em `core/pretextuais.typ`.
- O import agora é `"academic-del/lib.typ"` (antes: `"academic-del/config.typ"`).

#### Correções

- Atualizado o script de build `.github/scripts/build-windows.ps1` para a nova estrutura `src/`.
- Atualizado `main.typ` para importar de `lib.typ` em vez de `config.typ`.

---

## v0.0.1 — Versão Inicial

**Data:** 2026

### O que foi incluído

Primeira versão do modelo de TCC em Typst para o DEL/UFS.

#### Funcionalidades

- **Elementos pré-textuais automáticos:** Capa, Folha de Rosto, Folha de Aprovação.
- **Elementos pré-textuais opcionais:** Dedicatória, Agradecimentos, Epígrafe, Resumo, Abstract.
- **Listas automáticas:** Sumário (NBR 6027), Lista de Ilustrações, Lista de Tabelas, Lista de Abreviaturas e Siglas, Lista de Símbolos.
- **Formatação ABNT automática:** Margens, fonte (Arimo), espaçamento, recuos, hierarquia de seções, equações numeradas.
- **Função `#figura()`:** Inserção de figuras com legenda acima e fonte abaixo, conforme NBR 14724.
- **Função `#sigla()`:** Gerenciamento dinâmico de siglas com coleta automática para a lista.
- **Suporte a BibTeX:** Citações ABNT via `@chave` e lista de referências automática.

#### Normas Atendidas

- ABNT NBR 14724 (Trabalhos acadêmicos)
- ABNT NBR 6024 (Numeração de seções)
- ABNT NBR 6023 (Referências)
- ABNT NBR 6027 (Sumário)
- ABNT NBR 6028 (Resumo)
- ABNT NBR 10520 (Citações)

---

[← Arquitetura](./07-arquitetura.md) | [↑ Índice](./index.md)
