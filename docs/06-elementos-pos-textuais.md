# 6. Elementos Pós-Textuais

Os elementos pós-textuais vêm após a conclusão do trabalho. Conforme a **ABNT NBR 6024** e a **NBR 14724**, seus títulos **não recebem numeração progressiva**.

---

## Regra Fundamental: Desativar a Numeração

Antes de inserir qualquer elemento pós-textual, adicione esta instrução:

```typst
#set heading(numbering: none)
```

Essa instrução remove a numeração automática de todos os títulos declarados a partir daquele ponto. Sem ela, os elementos pós-textuais receberiam números como `4. REFERÊNCIAS`, o que viola a norma.

---

## Estrutura Geral dos Pós-Textuais

```typst
= Conclusão
Texto da conclusão...


// ============================================================
// ELEMENTOS PÓS-TEXTUAIS
// Conforme ABNT NBR 6024: títulos sem numeração progressiva.
// ============================================================
#set heading(numbering: none)

// 1. Referências (OBRIGATÓRIO)
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")

// 2. Glossário (Opcional)
= Glossário <sec-glossario>
...

// 3. Apêndices (Opcional — elaborados pelo autor)
= APÊNDICE A – Roteiro dos Experimentos
...

// 4. Anexos (Opcional — documentos de terceiros)
= ANEXO A – Folha de Dados do Componente
...
```

---

## Referências (Obrigatório)

As referências são geradas automaticamente a partir do arquivo `.bib`. O estilo ABNT é aplicado pela string `"associacao-brasileira-de-normas-tecnicas"`, que é nativo do Typst.

```typst
#bibliography(
  "referencias.bib",
  style: "associacao-brasileira-de-normas-tecnicas",
  title: "REFERÊNCIAS"
)
```

| Parâmetro | Descrição |
|---|---|
| `"referencias.bib"` | Caminho para o arquivo BibTeX. Pode ter qualquer nome. |
| `style` | Estilo de citação. Use sempre `"associacao-brasileira-de-normas-tecnicas"` para ABNT. |
| `title` | Título da seção de referências. Use `"REFERÊNCIAS"` em maiúsculas conforme ABNT. |

> [!NOTE]
> Somente as referências que foram efetivamente citadas no texto (`@chave`) aparecem na lista de referências. Referências no `.bib` que não foram citadas não são incluídas.

---

## Glossário (Opcional)

O glossário reúne termos técnicos e jargões usados no trabalho, em ordem alfabética.

```typst
= Glossário <sec-glossario>

*Arduino* — Plataforma de prototipagem eletrônica de código aberto...

*Firmware* — Software embutido em dispositivos de hardware...

*IoT* — Rede de dispositivos físicos conectados à internet...
```

A âncora `<sec-glossario>` permite referenciar o glossário de outras partes do documento com `@sec-glossario`.

---

## Apêndices (Opcional)

Apêndices contêm textos ou documentos **elaborados pelo próprio autor** para complementar a argumentação.

A nomenclatura segue o padrão: `APÊNDICE A`, `APÊNDICE B`, etc.

```typst
= APÊNDICE A – Roteiro dos Experimentos <apendice-a>

Este apêndice descreve o roteiro completo dos experimentos realizados...

= APÊNDICE B – Código-Fonte do Firmware <apendice-b>

```arduino
void setup() {
  Serial.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000);
}
```
```

---

## Anexos (Opcional)

Anexos contêm documentos **produzidos por terceiros** que fundamentam ou ilustram o trabalho.

A nomenclatura segue o padrão: `ANEXO A`, `ANEXO B`, etc.

```typst
= ANEXO A – Folha de Dados do Componente <anexo-a>

Este anexo reproduz a folha de dados (datasheet) do sensor de corrente
utilizado nos experimentos, conforme fornecida pelo fabricante.

= ANEXO B – Parecer do Comitê de Ética <anexo-b>

...
```

---

## Tabela Resumo

| Elemento | Obrigatório | Elaborado por | Nomenclatura |
|---|---|---|---|
| Referências | ✅ Sim | — | REFERÊNCIAS |
| Glossário | ❌ Opcional | Autor | Glossário |
| Apêndices | ❌ Opcional | Autor | APÊNDICE A, B, C... |
| Anexos | ❌ Opcional | Terceiros | ANEXO A, B, C... |

---

## Exemplo Completo de Seção Pós-Textual

```typst
= Conclusão

Este trabalho demonstrou a viabilidade de um sistema de monitoramento
de energia elétrica baseado em IoT para uso residencial...

// ============================================================
// ELEMENTOS PÓS-TEXTUAIS
// ============================================================
#set heading(numbering: none)

#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas", title: "REFERÊNCIAS")

= Glossário <sec-glossario>

*IoT (Internet das Coisas)* — Rede de dispositivos físicos equipados com
sensores, software e conectividade que permite a troca de dados pela internet.

*MQTT* — Protocolo de comunicação leve baseado no padrão publish/subscribe,
amplamente utilizado em aplicações IoT.

= APÊNDICE A – Esquema Elétrico do Protótipo <apendice-a>

A @fig-esquema apresenta o esquema elétrico completo do protótipo desenvolvido.

#figura(
  image("figuras/esquema.png", width: 100%),
  caption: [Esquema elétrico completo do protótipo.],
) <fig-esquema>

= ANEXO A – Datasheet do Sensor SCT-013 <anexo-a>

A seguir reproduz-se a folha de dados técnicos do sensor de corrente
SCT-013-000, conforme documentação oficial do fabricante YHDC.
```

---

[← Elementos Textuais](./05-elementos-textuais.md) | [Próximo: Arquitetura →](./07-arquitetura.md)
