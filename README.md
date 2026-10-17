# Template LaTeX PPGI - UNINOVE

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

*Template* LaTeX para projetos de pesquisa, exames de qualificação, dissertações e teses do PPGI (Programa de Pós-Graduação em Informática e Gestão do Conhecimento) da Universidade Nove de Julho (Uninove).

O modelo deriva do *template* do IME-USP desenvolvido pelo Prof. Dr. Jesús P. Mena-Chalco ([2015](http://latex-exemplo.blogspot.com.br/2015/11/modelo-latex-para-dissertacoes-e-teses.html)), adaptado ao PPGI pelo Dr. Charles Gobber ([2018](https://github.com/gobber/uninove-ppgi-latex)). Desde 2026, a manutenção é do Prof. Dr. Edson Melo de Souza (PPGI-Uninove).

> As instruções de uso (edição dos arquivos, compilação, comandos de revisão e exemplos) estão no arquivo **LEIA-ME.md**. Este README apenas descreve o que o *template* oferece e como ele evoluiu.

## Conformidade normativa

A formatação segue o **Manual de Orientações para Apresentação de Trabalhos Acadêmicos** do Sistema de Bibliotecas Professor José Storópoli (Uninove, edição 2025), que remete às normas da ABNT:

| Norma | Objeto |
|---|---|
| NBR 14724:2024 | Estrutura e apresentação de trabalhos acadêmicos |
| NBR 10520:2023 | Citações em documentos |
| NBR 6023:2018 | Elaboração de referências |
| NBR 6024:2012 | Numeração progressiva das seções |
| NBR 6027:2012 | Sumário |
| NBR 6028:2021 | Resumo |

A conformidade é garantida pela classe `uninove-ppgi.cls`. Margens, fonte, espaçamento, paginação, títulos e listas não precisam de ajuste manual.

## O que o template faz

**Um único modelo para as três etapas.** O tipo de exame declarado em `config/dados.tex` (pré-qualificação, qualificação ou defesa) ajusta a folha de rosto e o título do Capítulo 4 ("Resultados preliminares" ou "Resultados e discussão"). Também define o capítulo final: planos de continuidade nas etapas intermediárias, conclusão na defesa.

**Dois modos de compilação.** Basta trocar uma opção em `main.tex`:

- **Revisão:** links em azul e indicação "Citado na pág." nas referências. Exibe também as notas do orientador, do coorientador e da banca, as marcas de edição (inserir, remover, substituir, verificar), as caixas de orientação ao aluno e uma lista final de pendências.
- **Final:** texto integralmente em preto, sem anotações nem remissões, pronto para depósito na biblioteca.

**Dados informados uma única vez.** Nome do autor, título, orientador, coorientador e etapa são declarados apenas em `config/dados.tex`. A partir deles, o modelo compõe a capa, a folha de rosto, a folha de aprovação, a legenda de revisores do modo revisão e as propriedades do PDF.

**Metadados do PDF.** O arquivo gerado traz título, autor, assunto e palavras-chave nas suas propriedades, o que facilita a indexação no repositório institucional e a identificação do documento por buscadores e gerenciadores de referências.

**Elementos ABNT completos.** Capa, folha de rosto, ficha catalográfica, folha de aprovação com membros da banca, dedicatória, agradecimentos, epígrafe, resumo e *abstract*. Inclui ainda listas de figuras, quadros, tabelas, algoritmos, abreviaturas e símbolos, além do sumário, de apêndices e anexos e de uma declaração de uso de inteligência artificial.

**Recursos para o texto científico, com exemplos comentados nos próprios capítulos:**

- figuras, quadros (`quadros`) e tabelas com legenda e fonte no padrão do manual;
- equações numeradas, com orientação sobre o capítulo adequado a cada tipo;
- algoritmos em pseudocódigo (`algorithm2e`);
- gráficos gerados a partir de dados (`pgfplots`) e diagramas em TikZ, como o fluxo PRISMA;
- listagens de código e expressões de busca copiáveis para as bases de dados;
- citações diretas longas, citações indiretas e notas de rodapé;
- resumo de capítulo, caixas de destaque, lacuna e pergunta de pesquisa;
- tabelas longas e em modo paisagem.

**Bibliografia ABNT corrigida.** O estilo `abntex2-alf-uninove.bst` produz citações em caixa baixa com autores separados por ponto e vírgula e *et al.* a partir de quatro autores. Nas referências, o título do periódico sai em negrito, o DOI é impresso e as URLs aparecem sem os sinais `< >`.

**Organização em pastas.** Os arquivos estão separados em `capitulos/`, `pre-textuais/`, `pos-textuais/`, `apendices/`, `anexos/`, `figuras/` e `config/`. Assim, aluno e orientador editam partes independentes do trabalho sem tocar na formatação.

## Evolução das correções

### Versão original (Mena-Chalco, 2015)
Modelo para dissertações e teses do IME-USP, base estrutural da classe.

### Adaptação ao PPGI (Gobber, 2018)
Adequação à identidade da Uninove e inclusão de exemplos de algoritmos, figuras, quadros, tabelas, citações, apêndices, anexos, resumos de capítulo e marcações coloridas de revisão.

### Revisão de conformidade e reestruturação (Souza, 2026)

**Paginação e sumário**

- A contagem passou a começar na folha de rosto, e a numeração só aparece a partir da Introdução (antes, a contagem começava na capa).
- As listas pré-textuais deixaram de constar no sumário.
- Títulos sem indicativo numérico (resumo, listas, referências) passaram a ser centralizados.
- Apêndices e anexos, antes formatados como seções, ganharam títulos próprios, com a grafia correta no sumário.

**Citações e referências**

- As citações, que saíam em caixa alta, agora saem em caixa baixa, com ponto e vírgula entre os autores. O *et al.*, antes aplicado a partir de três autores, vale a partir de quatro.
- O comando `\titleset`, que destacava o título do artigo, foi abandonado. O negrito agora recai sobre o título do periódico, conforme a NBR 6023.
- O título "Referências Bibliográficas" passou a ser "Referências".
- As URLs ficaram sem os sinais `< >`, e o DOI passou a ser impresso.
- Foram removidas as instruções para `\citep` e `\citet`, comandos inexistentes no abnTeX2.
- DOIs fictícios e referências inconsistentes nos exemplos foram corrigidos.
- A colisão da chave de opções `AuthorYEAR`, que o BibTeX tratava como idêntica a `AUTHORYEAR`, foi resolvida em `config/abnt-opcoes.bib`.

**Formatação**

- Ajustes de fonte (Times 12), recuo de parágrafo (1,25 cm) e legendas e fontes em tamanho 10.
- O *abstract*, antes desativado, foi reativado com suporte ao idioma inglês.
- As palavras-chave, antes separadas por vírgula, passaram a ser separadas por ponto e vírgula e finalizadas por ponto, conforme a NBR 6028.
- Correção da grafia "Pós-Graduação".
- Orientador e coorientador alinhados à direita, sem quebra de linha.
- Novo ambiente `citacao`, com recuo de 4 cm.

**Classe e compilação**

- Remoção de `\makeatletter` e `\makeatother` do corpo da classe e de `\ifthenelse` nos metadados do PDF.
- Correção das aspas desbalanceadas nas expressões de busca, da seta mal especificada e do transbordamento de caixas no diagrama PRISMA.
- Separação entre a classe (formatação ABNT, que não deve ser alterada) e `config/preambulo.tex` (pacotes e estilos do texto), agora integralmente comentado.
- Os metadados do PDF, antes vazios, passaram a ser preenchidos automaticamente com título, autor, assunto e palavras-chave.

**Revisão e orientação**

- Os nomes do orientador, do coorientador e do autor deixaram de ser escritos no `revisao.sty` e passaram a ser lidos de `config/dados.tex`.
- A nota do orientador, antes vinculada às iniciais de um docente (`\notaEMS`), tornou-se genérica (`\notaORIENTADOR`). O comando antigo foi mantido como sinônimo, de modo que textos já escritos continuam compilando.
- Notas de margem passaram a aceitar um rótulo abreviado, evitando que o nome do revisor ultrapasse a margem de 2 cm.
- A folha de aprovação passou a reaproveitar os nomes do orientador e do coorientador.

**Novos recursos**

- Pacote `revisao.sty`, com os modos revisão e final, notas por revisor, marcas de edição, campos a preencher e lista de pendências.
- Modelo adaptável às três etapas do curso.
- Caixas de orientação ao aluno, visíveis só no modo revisão.
- Seção de limitações, lista de símbolos e declaração de uso de IA.
- Exemplos-guia de dedicatória, epígrafe e agradecimentos.
- Exemplos de equações, pseudocódigo e quadro em largura total.
- Projeto fictício completo ("Sistemas Inteligentes para Resolução de Problemas de Trânsito em São Paulo") em três versões (pré-qualificação, qualificação e defesa), que mostra a evolução de um trabalho real com o *template*.

## Modificações

O *template* pode ser adaptado livremente, desde que as alterações respeitem o manual da biblioteca e as normas da ABNT. Ajustes de conteúdo e de pacotes devem ser feitos em `config/preambulo.tex`; a classe `uninove-ppgi.cls` concentra a formatação normativa e não deve ser alterada pelo aluno.

## Ambiente de compilação

O *template* compila com `pdflatex` e `bibtex` em distribuições atuais (TeX Live ou MiKTeX, versão 2024 ou posterior), em ambientes como:

- **Overleaf**, *online*, sem instalação ([Abrir no Overleaf](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fcodeload.github.com%2FEdsonMSouza%2FTEMPLATE_LATEX_PPGI_UNINOVE%2Fzip%2Frefs%2Fheads%2Fmain));
- **VS Code** com a extensão LaTeX Workshop;
- **TeXstudio**, com MiKTeX ou TeX Live.

A sequência de compilação e a solução de problemas comuns estão descritas no LEIA-ME.md.

## Licença

Esta obra está licenciada com uma Licença [Creative Commons Atribuição-CompartilhaIgual 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)