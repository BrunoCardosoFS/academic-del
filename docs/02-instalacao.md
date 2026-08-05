# 2. Instalação — Como Baixar e Configurar

---

## Pré-requisitos

Antes de começar, você precisa de uma das seguintes opções:

### Opção A — Typst CLI (Recomendado para uso local)

1. Acesse [github.com/typst/typst/releases](https://github.com/typst/typst/releases) e baixe o executável para o seu sistema operacional.
2. Extraia e adicione ao `PATH` do sistema (ou use diretamente pela pasta).
3. Verifique a instalação:
   ```sh
   typst --version
   ```

### Opção B — VS Code com extensão Tinymist (Recomendado para edição)

1. Instale o [VS Code](https://code.visualstudio.com).
2. Na aba de extensões (`Ctrl+Shift+X`), instale **Tinymist Typst** (ou **Typst LSP**).
3. A extensão compila automaticamente ao salvar o arquivo.

### Opção C — Typst App (Sem instalação)

Acesse [typst.app](https://typst.app) — nenhuma instalação é necessária.

---

## Baixando o Template

Acesse a [página de releases](https://github.com/BrunoCardosoFS/academic-del/releases/latest) do repositório no GitHub e faça o download do arquivo `academic-del.zip` da versão mais recente.

---

## Formas de Uso

### 1. Uso Local (Typst CLI / VS Code)

Esta é a forma mais recomendada para quem vai editar o trabalho localmente.

**Passo a passo:**

1. Baixe o arquivo `academic-del.zip` da [Release mais recente](https://github.com/BrunoCardosoFS/academic-del/releases/latest).
2. Extraia o conteúdo em uma pasta de sua preferência.
3. Você terá a seguinte estrutura:
   ```
   meu-tcc/
   ├── academic-del/       ← Pasta do template (não edite)
   │   ├── lib.typ
   │   ├── models/
   │   ├── core/
   │   ├── examples/
   │   └── assets/
   ├── main.typ            ← Seu arquivo principal
   └── referencias.bib     ← Suas referências BibTeX
   ```
4. Abra a pasta no VS Code ou no seu editor de preferência.
5. Edite o `main.typ` com os dados do seu trabalho.

> [!IMPORTANT]
> Ao compilar via **Typst CLI no terminal**, informe o caminho das fontes com a flag `--font-path`:
> ```sh
> typst compile main.typ --font-path ./academic-del/assets/fonts
> ```
> Sem essa flag, o Typst não encontrará a fonte **Arimo** e a compilação falhará ou usará uma fonte substituta incorreta.

**Compilação com watch (atualização automática):**
```sh
typst watch main.typ --font-path ./academic-del/assets/fonts
```
O PDF é regenerado automaticamente a cada vez que você salva o arquivo.

---

### 2. Uso na Web (Typst App)

Ideal para quem não quer instalar nada ou quer colaborar online.

**Passo a passo:**

1. Baixe e extraia o arquivo `academic-del.zip`.
2. Acesse [typst.app](https://typst.app) e faça login (conta gratuita).
3. Clique em **"New project"** → **"Blank project"**.
4. Na área de arquivos à esquerda (*File Tree*), arraste todos os arquivos e pastas extraídos para o projeto.
5. Clique em `main.typ` para começar a editar.

> [!NOTE]
> No Typst App, as fontes do sistema e as fontes incluídas no projeto são detectadas automaticamente. Não é necessário informar `--font-path`.

---

### 3. Integração em um Projeto Typst Existente

Se você já tem um projeto em andamento:

1. Baixe e extraia o `academic-del.zip`.
2. Copie **apenas** a pasta `academic-del/` para a raiz do seu projeto.
3. No seu arquivo `.typ` principal, adicione no início:

```typst
#import "academic-del/lib.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Seu Nome",
  titulo: "Título do Trabalho",
  // ... demais parâmetros
  doc,
)
```

> [!NOTE]
> O ponto de entrada do template é `academic-del/lib.typ`. Esse arquivo re-exporta as funções públicas do pacote: `tcc`, `relatorioFinal`, `figura` e `sigla`.

---

## Verificando a Instalação

Após extrair os arquivos, compile o `main.typ` sem modificações:

```sh
typst compile main.typ --font-path ./academic-del/assets/fonts
```

Se um arquivo `main.pdf` for gerado sem erros, a instalação está correta. O documento gerado conterá dados de exemplo que você substituirá pelos dados reais do seu trabalho.

---

[← Introdução](./01-introducao.md) | [Próximo: Primeiros Passos →](./03-primeiros-passos.md)
