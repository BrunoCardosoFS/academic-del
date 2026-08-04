# Release vx.x.x — Template de TCC em Typst (DEL / UFS)

Modelo de **Trabalho de Conclusão de Curso (TCC)** em **Typst**, configurado e adaptado conforme as normas da ABNT e diretrizes do **Departamento de Engenharia Elétrica da Universidade Federal de Sergipe (DEL/UFS)**.

📚 **Documentação completa:** [docs/index.md](https://github.com/BrunoCardosoFS/academic-del/blob/main/docs/index.md) — cobre instalação, configuração, elementos textuais e pós-textuais, arquitetura e changelog.

**Tutorial Completo em PDF:** Confira o guia de uso e formatação consultando o [tutorial.pdf](https://github.com/BrunoCardosoFS/academic-del/blob/vx.x.x/academic-del/tutorial/tutorial.pdf) e o seu [código Typst](https://github.com/BrunoCardosoFS/academic-del/blob/vx.x.x/academic-del/tutorial/tutorial.typ) correspondente.

---

## 🛠️ Como Usar

Escolha a forma que melhor se adapta ao seu fluxo de trabalho:

### 1. Uso Local (Typst CLI / VS Code)
1. Faça o download do arquivo `academic-del.zip` anexado nesta release.
2. Extraia o conteúdo em uma pasta de sua preferência.
3. Abra o projeto no seu editor (ex: VS Code com a extensão *Typst LSP*) e comece a editar o arquivo `main.typ`.

> [!IMPORTANT]
> Ao compilar via **Typst CLI**, é necessário informar o caminho da pasta de fontes com a flag `--font-path`:
> ```sh
> typst compile main.typ --font-path ./academic-del/fonts
> ```
> Sem isso, o Typst não encontrará as fontes customizadas do template e a compilação falhará.

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
2. No seu arquivo `.typ` principal, adicione o import no topo:

```typst
#import "academic-del/config.typ": figura, sigla, tcc

#show: doc => tcc(
  curso: "Engenharia Elétrica",
  autor: "Seu Nome",
  titulo: "Título do Seu Trabalho",
  // ... demais configurações
)
