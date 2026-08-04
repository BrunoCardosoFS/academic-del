# Release vx.x.x — Template Acadêmico em Typst — DEL / UFS (TCC e PIBIC)

Conjunto de modelos acadêmicos para **Trabalhos de Conclusão de Curso (TCC)** e **Relatórios Finais PIBIC/PICVOL** em **Typst**, configurados e adaptados conforme as normas da ABNT e diretrizes do **Departamento de Engenharia Elétrica da Universidade Federal de Sergipe (DEL/UFS)**.

📚 **Documentação completa:** [docs/index.md](https://github.com/BrunoCardosoFS/academic-del/blob/vx.x.x/docs/index.md) — cobre instalação, configuração (TCC e PIBIC), elementos textuais e pós-textuais, arquitetura e changelog.

---

## 🛠️ Como Usar

Escolha a forma que melhor se adapta ao seu fluxo de trabalho:

### 1. Uso Local (Typst CLI / VS Code)
1. Faça o download do arquivo `academic-del.zip` anexado nesta release.
2. Extraia o conteúdo em uma pasta de sua preferência.
3. Abra o projeto no seu editor (ex: VS Code com a extensão *Tinymist Typst*) e comece a editar o arquivo `main.typ`.

> [!IMPORTANT]
> Ao compilar via **Typst CLI**, informe o caminho das fontes com a flag `--font-path`:
> ```sh
> # Compilação do projeto (main.typ)
> typst compile main.typ --font-path ./academic-del/fonts
>
> # Compilação em modo watch (atualização automática ao salvar)
> typst watch main.typ --font-path ./academic-del/fonts
> ```
> Sem a flag `--font-path ./academic-del/fonts`, o Typst não encontrará as fontes customizadas (**Arimo**) e a compilação falhará.

> [!IMPORTANT]
> **Nota para compilação dos arquivos de exemplos (`academic-del/examples/`):**
> Caso deseje compilar diretamente um arquivo de exemplo dentro da pasta do pacote (ex: `examples/tcc.typ` ou `examples/pibic.typ`), é necessário passar a flag `--root .` para que os imports sejam resolvidos a partir da raiz:
> ```sh
> typst compile --root . academic-del/examples/tcc.typ --font-path ./academic-del/fonts
> ```

---

### 2. Uso na Web (Typst App — [typst.app](https://typst.app))
1. Faça o download e extraia o arquivo `academic-del.zip`.
2. Acesse o [typst.app](https://typst.app) e crie um novo projeto em branco (*Blank Project*).
3. Arraste todos os arquivos e pastas descompactados para a área de arquivos (*File Tree*) do Typst Web.
4. Abra o `main.typ` para iniciar a escrita.

---

### 3. Integração em um Projeto Typst Existente
Se você já possui um projeto em andamento e deseja apenas aplicar o modelo:
1. Baixe o `academic-del.zip` e copie apenas a pasta `academic-del` para a raiz do seu projeto.
2. No seu arquivo `.typ` principal, adicione o import e a configuração correspondente no topo:

#### Para TCC:
```typst
#import "academic-del/lib.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Seu Nome",
  titulo: "Título do Seu Trabalho",
  // ... demais configurações
)
```

#### Para Relatório Final PIBIC / PICVOL:
```typst
#import "academic-del/lib.typ": figura, relatorioFinal, sigla

#show: doc => relatorioFinal(
  tituloProjeto: "Título do Projeto",
  tituloPlanoDeTrabalho: "Título do Plano de Trabalho",
  autor: "Nome do Bolsista",
  // ... demais configurações
)
```
