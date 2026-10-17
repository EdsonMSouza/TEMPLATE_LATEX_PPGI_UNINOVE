# Guia de uso do modelo LaTeX (PPGI/PPGP, UNINOVE)

Este modelo serve para os textos de **pré-qualificação, qualificação e defesa** de mestrado e doutorado. A formatação segue o *Manual de Orientação para Apresentação de Trabalhos Acadêmicos* do Sistema de Bibliotecas da UNINOVE e as normas ABNT nele adotadas. Margens, fontes, espaçamentos, títulos, listas, sumário e referências já estão configurados: o seu trabalho é escrever o conteúdo.

---

## 1. Primeiros passos

1. **Overleaf:** *New Project > Upload Project*, enviando o `.zip` sem descompactar. O compilador deve ser **pdfLaTeX** (padrão).
   **Computador local (VS Code):** é necessário ter TeX Live ou MiKTeX instalado e a extensão LaTeX Workshop. Compile o arquivo `main.tex`.
2. Abra `config/dados.tex` e preencha nome, título, etapa (`\Tipoexame`), titulação, orientação, ano de ingresso e linha de pesquisa. Esses dados são digitados **uma única vez**: o modelo os reutiliza na capa, na folha de rosto, na folha de aprovação, na legenda de revisores e nas propriedades do PDF.
3. Compile. O PDF já sai com capa, folha de rosto, listas e sumário corretos.

> Compile sempre o `main.tex`, nunca um capítulo isoladamente.

---

## 2. Onde fica cada coisa

| Pasta ou arquivo | O que contém | Você edita? |
|---|---|---|
| `config/dados.tex` | Dados da capa e da folha de rosto | Sim |
| `pre-textuais/` | Resumo, abstract, listas, abreviaturas e símbolos, dedicatória, agradecimentos, epígrafe | Sim |
| `capitulos/` | Um arquivo por capítulo | Sim |
| `pos-textuais/referencias.bib` | Suas referências | Sim |
| `pos-textuais/declaracao-ia.tex` | Declaração de uso de IA generativa | Sim |
| `apendices/` | Documentos elaborados por você (questionários, roteiros, strings de busca) | Sim |
| `anexos/` | Documentos de terceiros (leis, normas, instrumentos de outros autores) | Sim |
| `figuras/` | Imagens (`.png`, `.jpg`, `.pdf`); diagramas em código em `figuras/tikz/` | Sim |
| `main.tex` | Ordem dos elementos e modo de compilação | Só o indicado neste guia |
| `config/preambulo.tex` | Pacotes adicionais, estilos e metadados do PDF | Somente com o orientador |
| `uninove-ppgi.cls`, `revisao.sty`, `config/*.bst`, `config/abnt-opcoes.bib` | Formatação ABNT | **Não** |

Para compilar mais rápido enquanto escreve um capítulo, descomente em `main.tex` a linha `\includeonly{capitulos/03-metodologia}` (ajuste o nome). Volte a comentá-la antes de gerar a versão completa.

---

## 3. Etapa do trabalho

A etapa é definida em `config/dados.tex`:

```latex
\Tipoexame{Pré-Qualificação}   % Pré-Qualificação, Qualificação ou Defesa
```

O modelo se adapta sozinho:

| | Pré-qualificação e qualificação | Defesa |
|---|---|---|
| Texto da folha de rosto | "Texto de Qualificação de Mestrado..." | "Dissertação apresentada..." |
| Capítulo 4 | Resultados preliminares | Resultados e discussão |
| Capítulo 5 | Planos para a continuidade do trabalho | Conclusão |

Na **Defesa**, descomente também em `main.tex` a linha `\folhaaprovacao` e preencha a banca em `config/dados.tex` (`\MembroBanca` e `\DataAprovacao`). Para o orientador e o coorientador, basta usar `\MembroBanca{\orientador}{...}` e `\MembroBanca{\coorientador}{...}`: os nomes já informados são reaproveitados. Na versão final depositada, inclua a ficha catalográfica com `\fichacatalografica{...}`. Ela é elaborada pela biblioteca: solicite por **biblioteca10@uninove.br** com pelo menos 2 dias úteis de antecedência.

---

## 4. Modos de compilação: revisão e final

No início de `main.tex`:

```latex
\usepackage[revisao]{revisao}   % durante a orientação
\usepackage[final]{revisao}     % para enviar à banca ou depositar
```

**Modo revisão** (use durante toda a orientação):

- mostra as notas do orientador e da banca, as marcações de edição e as caixas cinza "Orientação ao aluno";
- abre o PDF com uma página listando todas as pendências e a página de cada uma;
- exibe no topo das páginas a versão, a data de compilação e o número de pendências;
- indica, após cada referência, as páginas em que ela é citada ("Citado na pág."). Referência sem essa indicação está na lista mas não foi citada no texto, e deve ser citada ou removida.

**Modo final** (somente para envio):

- remove notas, marcações, caixas de orientação e remissões;
- deixa todo o texto em preto, como exige o manual.

Antes de enviar, confira o log de compilação. Se aparecer um aviso do pacote `revisao` informando notas, pendências ou campos sem preenchimento, o texto **ainda não está pronto**.

---

## 5. Trabalhando com o orientador

O orientador comenta diretamente no código. Os comandos mais comuns:

| O que aparece no PDF | Comando | O que fazer |
|---|---|---|
| Nota na margem ou caixa no texto | `\notaORIENTADOR{...}`, `\notaCoor{...}`, `\notaBanca{...}` | Resolver e **apagar** o comando |
| Texto azul sublinhado | `\inserir{...}` | Aceitar: manter só o texto, sem o comando |
| Texto vermelho tachado | `\remover{...}` | Aceitar: apagar o comando e o texto |
| Riscado seguido de sublinhado | `\substituir{antigo}{novo}` | Aceitar: deixar apenas o texto novo |
| Texto laranja com [?] | `\verificar{...}` | Conferir o dado ou a citação na fonte |
| Caixa amarela "Pendente" | `\pendente{...}` | Executar a tarefa e apagar o comando |
| Texto vermelho entre colchetes | `\preencher{...}` | Substituir pelo seu texto |

Para responder a uma nota, escreva logo abaixo dela:

```latex
\notaAluno{Ajustei conforme sugerido; ver novo parágrafo da Seção 2.3.}
```

Cada nota tem duas formas: `\notaORIENTADOR{...}` aparece na margem (identificada como "Orient.", por falta de espaço) e `\notaORIENTADOR*{...}` aparece como caixa no corpo do texto. A cor identifica o revisor, e a legenda na página de pendências mostra o nome de cada um, lido de `config/dados.tex` (`\Orientador`, `\Coorientador` e `\Autor`). Textos antigos com `\notaEMS` continuam funcionando, como sinônimo de `\notaORIENTADOR`.

Não apague notas do orientador sem resolvê-las. O histórico do Overleaf (ou do Git) guarda tudo, mas a lista de pendências serve justamente para que nada se perca entre uma reunião e outra.

---

## 6. Escrevendo o texto

### 6.1 Títulos

Escreva os títulos de seção apenas com a primeira letra maiúscula: `\section{Problema de pesquisa}`. O modelo aplica sozinho a caixa alta nos títulos de capítulo e no sumário.

### 6.2 Citações (NBR 10520:2023)

| Comando | Resultado |
|---|---|
| `\cite{chave}` | (Silva, 2024) |
| `\citeonline{chave}` | Silva (2024) |
| `\cite[p.~27]{chave}` | (Silva, 2024, p. 27) |
| `\citeonline[p.~27, tradução nossa]{chave}` | Silva (2024, p. 27, tradução nossa) |
| `\citeauthor{chave}` | Silva |

- Citação direta de até três linhas: entre aspas duplas (` ``texto'' `), sempre com a página.
- Citação direta com mais de três linhas: ambiente `citacao`, sem aspas.
- Os comandos `\citep` e `\citet` **não existem** neste modelo.
- Com quatro ou mais autores, o modelo usa *et al.* automaticamente.

### 6.3 Referências

- Cadastre cada obra em `pos-textuais/referencias.bib`. Só aparecem nas Referências as obras citadas no texto.
- Prefira exportar as entradas do Zotero, Mendeley ou da própria base (Scopus, Web of Science) e **confira cada uma**: autores, título, periódico, volume, número, páginas e DOI.
- Não coloque títulos entre `\textbf{}`: o negrito é aplicado automaticamente ao elemento correto (título do livro ou do periódico).
- Para documentos online, informe `url` e `urlaccessdate` (data de acesso). Informe o `doi` sempre que existir.
- O arquivo traz algumas referências **fictícias**, marcadas no início, usadas apenas nos exemplos. Apague-as junto com os exemplos.

### 6.4 Figuras, quadros e tabelas

- **Figura:** imagens, gráficos, diagramas e fluxogramas. **Quadro:** informação textual organizada em linhas e colunas, com bordas. **Tabela:** dados numéricos, sem bordas laterais (padrão IBGE).
- Título **acima**, fonte **abaixo**. A fonte é obrigatória, mesmo para elaboração própria: `\fonte{Elaborado pelo autor (\ano).}` (use "Elaborada" para figura e tabela).
- Toda ilustração deve ser citada no texto antes de aparecer: `Figura~\ref{fig:rotulo}`, `Quadro~\ref{qua:rotulo}`, `Tabela~\ref{tab:rotulo}`.
- Use o ambiente `quadros` para quadros, e não `table`.
- Os capítulos 2 a 5 trazem exemplos de cada tipo, prontos para adaptar.

### 6.5 Equações

- **Fundamentação teórica:** equações que **definem** conceitos ou modelos da literatura, sempre com citação.
- **Metodologia:** equações que mostram **como o seu estudo** mede, estima ou decide (métricas, modelo a estimar, critérios).
- **Resultados:** equações com valores **estimados** por você.
- Cada equação aparece uma única vez; nos demais capítulos, remeta a ela com `Equação~\eqref{eq:rotulo}`.
- A equação faz parte da frase: termine com vírgula ou ponto e defina as variáveis logo depois ("em que...").
- Decimais com vírgula dentro de fórmulas: `0{,}5`.

Os capítulos 2 e 3 trazem exemplos completos.

### 6.6 Siglas e símbolos

- Na primeira ocorrência, escreva o nome por extenso seguido da sigla: "Comitê de Ética em Pesquisa (CEP)". Depois, use apenas a sigla.
- Registre as siglas em `pre-textuais/abreviaturas.tex`, em **ordem alfabética**.
- Os símbolos matemáticos vão no mesmo arquivo, com o comando `\simbolo{...}{...}`, na **ordem em que aparecem no texto**.
- Cada símbolo deve ter um único significado em todo o trabalho.

### 6.7 Apêndices e anexos

- **Apêndice:** material elaborado por você. Comece o arquivo com `\apendice{Título}`.
- **Anexo:** material de terceiros. Comece com `\anexo{Título}`.
- As letras (A, B, C...) são atribuídas automaticamente. Inclua novos arquivos em `main.tex` com `\include{...}`.
- As expressões de busca da revisão de literatura ficam no Apêndice A, no formato que permite copiá-las do PDF e executá-las na base.

### 6.8 Declaração de uso de IA generativa

Preencha `pos-textuais/declaracao-ia.tex` indicando cada ferramenta usada (nome, versão, forma de acesso e período), o que foi feito com ela, em que partes do texto e como você verificou o resultado. Mantenha somente os itens que de fato se aplicam. Se nenhuma ferramenta foi usada, declare isso expressamente.

---

### 6.9 Propriedades do PDF (metadados)

O PDF gerado já traz, nas suas propriedades, título, autor, assunto e palavras-chave, preenchidos automaticamente:

| Propriedade | Origem |
|---|---|
| Título | `\Titulo` em `config/dados.tex` |
| Autor e Criador | `\Autor` em `config/dados.tex` |
| Assunto | Etapa (`\Tipoexame`), programa e ano |
| Palavras-chave | `\PalavrasChave` em `pre-textuais/resumo.tex` |

Não é preciso editar nada além desses campos. As palavras-chave entram no PDF a partir da segunda compilação, o que o Overleaf, o latexmk e o LaTeX Workshop fazem automaticamente. Para conferir, abra o PDF e use *Arquivo > Propriedades* (Ctrl+D). A aba *Detalhes* do Windows Explorer só exibe esses campos se houver um leitor como o Adobe Acrobat Reader instalado.

---

## 7. Elementos opcionais

Em `main.tex`, descomente as linhas correspondentes:

- `pre-textuais/dedicatoria.tex`: sem título, texto breve;
- `pre-textuais/agradecimentos.tex`: bolsistas devem seguir a redação exigida pela agência (CAPES: frase obrigatória com o Código de Financiamento 001);
- `pre-textuais/epigrafe.tex`: citação com autor, ano e página, que também deve constar nas Referências.

Cada arquivo traz instruções e um exemplo comentado.

---

## 8. Antes de enviar o texto

- [ ] `\Tipoexame` e dados de `config/dados.tex` corretos
- [ ] Nenhum `\preencher`, `\pendente` ou nota de revisão restante
- [ ] Caixas "Orientação ao aluno" e textos de instrução removidos
- [ ] Exemplos e referências fictícias apagados
- [ ] Todas as referências citadas no texto (verifique o "Citado na pág." no modo revisão)
- [ ] Todas as figuras, quadros, tabelas e equações citados no texto
- [ ] Siglas definidas na primeira ocorrência e registradas na lista
- [ ] Resumo e abstract com 150 a 500 palavras e 3 a 6 palavras-chave separadas por ponto e vírgula (sem as palavras-chave de exemplo)
- [ ] Propriedades do PDF (Ctrl+D) com título, autor e palavras-chave corretos
- [ ] Declaração de uso de IA preenchida
- [ ] Compilação em `[final]` sem avisos do pacote `revisao`

---

## 9. Problemas comuns

| Sintoma | Causa provável |
|---|---|
| Citação aparece como **??** ou (chave) | A referência não existe no `.bib`, a chave está diferente, ou falta compilar novamente |
| Referência não aparece nas Referências | A obra não foi citada no texto |
| "Figura ??" no texto | Rótulo digitado errado ou documento compilado uma única vez |
| Número errado na remissão à figura | `\label` colocado antes do `\caption` |
| Erro *Undefined control sequence* | Comando digitado errado ou pacote não carregado |
| Erro *Missing $ inserted* | Símbolo matemático (`_`, `^`, `%`, `&`) fora de `$...$`; no texto comum, use `\_`, `\%`, `\&` |
| Acentos estranhos no PDF | Arquivo salvo em codificação diferente de UTF-8 |
| Palavras-chave vazias nas propriedades do PDF | Documento compilado uma única vez; compile novamente |
| Propriedades do PDF vazias na aba *Detalhes* do Windows | Limitação do Windows; confira no leitor de PDF (Ctrl+D) |

No VS Code, os erros aparecem no painel *Problems*; no Overleaf, em *Logs and output files*. Leia sempre a **primeira** mensagem de erro: as seguintes costumam ser consequência dela.
