
# Download dos dados do site Consulta E-sic/CGU

Repositório para atualização da base de dados da CGU.

  - Download manual base de dados - [clique
    aqui](http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx)
  - Scripts neste repositório
      - **RAW DATA**:
        [**`download_dados_cgu.R`**](code/download_dados_cgu.R) é uma
        função para fazer o **download automatizado** da base direto do
        `R` utilizando o pacote `Rselenium`.
      - **LOAD DATA**:
        [**`abre_e_limpa_os_dados.R`**](code/abre_e_limpa_os_dados.R) é
        um código em `R`para **processamento e limpeza** do dado bruto
        baixado do site da CGU. Ele descompacta o arquivo bruto e
        converte de `xml` para uma `tibble` pronta para análise com o
        **`R`**.
      - **UPDATE DATA**:
        [**`organiza_fluxo_de_diretorios_para_download_com_bkp.R`**](code/organiza_fluxo_de_diretorios_para_download_com_bkp.R)
        é um procedimento de atualização dos arquivos baixados
        localmente escrito em linguagem `R`. Esse procedimento utiliza a
        função [`download_dados_cgu.R`](code/download_dados_cgu.R) para
        baixar os dados e organiza os arquivos uma estrutura de
        diretórios com registros de atualização da base de dados. É
        importante manter um controle das atualizações da base na medida
        em que os pedidos vão sendo respondidos ou recursos são
        incluídos aos pedidos.

## Tabelas e descrição das colunas:

### Tabela: Pedidos

<table class=" lightable-paper" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Campos

</th>

<th style="text-align:left;">

Formato

</th>

<th style="text-align:left;">

Descrição

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

**`IdPedido`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do pedido (não mostrado no sistema);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`ProtocoloPedido`**

</td>

<td style="text-align:left;">

texto(17)

</td>

<td style="text-align:left;">

número do protocolo do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`OrgaoDestinatario`**

</td>

<td style="text-align:left;">

texto(250)

</td>

<td style="text-align:left;">

nome do órgão destinatário do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Situacao`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

descrição da situação do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DataRegistro`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA HH:MM:SS

</td>

<td style="text-align:left;">

data de abertura do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`ResumoSolicitacao`**

</td>

<td style="text-align:left;">

texto(255)

</td>

<td style="text-align:left;">

resumo do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DetalhamentoSolicitacao`**

</td>

<td style="text-align:left;">

texto(2048)

</td>

<td style="text-align:left;">

detalhamento do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`PrazoAtendimento`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA HH:MM:ss

</td>

<td style="text-align:left;">

data limite para atendimento ao pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`FoiProrrogado`**

</td>

<td style="text-align:left;">

texto(3) “Sim” ou “Não”

</td>

<td style="text-align:left;">

informa se houve prorrogação do prazo do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`FoiReencaminhado`**

</td>

<td style="text-align:left;">

texto(3) “Sim” ou “Não”

</td>

<td style="text-align:left;">

informa se o pedido foi reencaminhado;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`FormaResposta`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

tipo de resposta escolhida pelo solicitante na abertura do pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`OrigemSolicitacao`**

</td>

<td style="text-align:left;">

texto(50)

</td>

<td style="text-align:left;">

informa se o pedido foi aberto em um Balcão SIC ou pela Internet;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`IdSolicitante`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do solicitante (não mostrado no sistema);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`AssuntoPedido`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

assunto do pedido atribuído pel SIC;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`SubAssuntoPedido`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

subassunto do pedido atribuída pelo SIC;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DataResposta`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA HH:MM:SS

</td>

<td style="text-align:left;">

data da resposta ao pedido (campo em branco para pedidos que ainda
estejam na situação “Em Tramitação”);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Resposta`**

</td>

<td style="text-align:left;">

texto(8000)

</td>

<td style="text-align:left;">

resposta ao pedido;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Decisao`**

</td>

<td style="text-align:left;">

texto(100)

</td>

<td style="text-align:left;">

tipo resposta dada ao pedido (campo em branco para pedidos que ainda
estejam na situação “Em Tramitação”);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`EspecificacaoDecisao`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

subtipo da resposta dada ao pedido (campo em branco para pedidos que
ainda estejam na situação “Em Tramitação”);

</td>

</tr>

</tbody>

</table>

### Tabela: Recursos

<table class=" lightable-paper" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Campos

</th>

<th style="text-align:left;">

Formato

</th>

<th style="text-align:left;">

Descrição

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

**`IdRecurso`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do recurso (não mostrado no sistema);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`IdRecursoPrecedente`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do recurso que precedeu este (não mostrado no
sistema e em branco no caso de Recursos de 1ª Instância e Reclamações);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DescRecurso`**

</td>

<td style="text-align:left;">

texto(8000)

</td>

<td style="text-align:left;">

descrição do recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`IdPedido`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do pedido ao qual o recurso pertence (não mostrado
no sistema);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`IdSolicitante`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do solicitante (não mostrado no sistema);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`ProtocoloPedido`**

</td>

<td style="text-align:left;">

texto(17)

</td>

<td style="text-align:left;">

número do protocolo do pedido ao qual o recurso pertence;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`OrgaoDestinatario`**

</td>

<td style="text-align:left;">

texto(250)

</td>

<td style="text-align:left;">

nome do órgão destinatário do recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Instancia`**

</td>

<td style="text-align:left;">

texto(80)

</td>

<td style="text-align:left;">

descrição da instância do recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Situacao`**

</td>

<td style="text-align:left;">

texto(80)

</td>

<td style="text-align:left;">

descrição da situação do recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DataRegistro`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA HH:MM:SS

</td>

<td style="text-align:left;">

data de abertura do recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`PrazoAtendimento`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA HH:MM:SS

</td>

<td style="text-align:left;">

data limite para atendimento ao recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`OrigemSolicitacao`**

</td>

<td style="text-align:left;">

texto(50)

</td>

<td style="text-align:left;">

informa se o recurso foi aberto em um Balcão SIC ou pela Internet;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`TipoRecurso`**

</td>

<td style="text-align:left;">

texto(80)

</td>

<td style="text-align:left;">

motivo de abertura do recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DataResposta`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA HH:MM:SS

</td>

<td style="text-align:left;">

data da resposta ao recurso (campo em branco para recursos que ainda
estejam na situação “Em Tramitação”);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`RespostaRecurso`**

</td>

<td style="text-align:left;">

texto(8000)

</td>

<td style="text-align:left;">

resposta ao recurso;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`TipoResposta`**

</td>

<td style="text-align:left;">

texto(80)

</td>

<td style="text-align:left;">

tipo resposta dada ao recurso (campo em branco para recursos que ainda
estejam na situação “Em Tramitação”);

</td>

</tr>

</tbody>

</table>

### Tabela: Solicitantes

<table class=" lightable-paper" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Campos

</th>

<th style="text-align:left;">

Formato

</th>

<th style="text-align:left;">

Descrição

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

**`IdSolicitante`**

</td>

<td style="text-align:left;">

inteiro

</td>

<td style="text-align:left;">

identificador único do solicitante (não mostrado no sistema);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`TipoDemandante`**

</td>

<td style="text-align:left;">

texto(15)

</td>

<td style="text-align:left;">

Pessoa Fìsica ou Pessoa Jurídica;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`DataNascimento`**

</td>

<td style="text-align:left;">

Data DD/MM/AAAA

</td>

<td style="text-align:left;">

data de nascimento do solicitante;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Genero`**

</td>

<td style="text-align:left;">

texto(13)

</td>

<td style="text-align:left;">

Masculino, Feminino ou Outro(em branco para pessoa jurídica);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Escolaridade`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

Escolaridade do solicitante (em branco para pessoa jurídica);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Profissao`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

Profissão do solicitante (em branco para pessoa jurídica);

</td>

</tr>

<tr>

<td style="text-align:left;">

**`TipoPessoaJuridica`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

tipo de Pessoa Jurídica do solicitante (em branco para pessoa física)

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Pais`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

país de residência do solicitante;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`UF`**

</td>

<td style="text-align:left;">

texto(2)

</td>

<td style="text-align:left;">

UF de residência do solicitante;

</td>

</tr>

<tr>

<td style="text-align:left;">

**`Municipio`**

</td>

<td style="text-align:left;">

texto(200)

</td>

<td style="text-align:left;">

Município de residência do solicitante;

</td>

</tr>

</tbody>

</table>

## Última versão disponível

Últimas versões dos arquivos:

<table>

<thead>

<tr>

<th style="text-align:left;">

Arquivo

</th>

<th style="text-align:right;">

Tamanho (mb)

</th>

<th style="text-align:left;">

Data do download

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

20201022\_Arquivos\_xml\_2016.zip

</td>

<td style="text-align:right;">

90.8

</td>

<td style="text-align:left;">

2021-01-13 23:48:10

</td>

</tr>

<tr>

<td style="text-align:left;">

20210113\_Arquivos\_xml\_2017.zip

</td>

<td style="text-align:right;">

112.7

</td>

<td style="text-align:left;">

2021-01-13 23:32:41

</td>

</tr>

<tr>

<td style="text-align:left;">

20210113\_Arquivos\_xml\_2018.zip

</td>

<td style="text-align:right;">

115.0

</td>

<td style="text-align:left;">

2021-01-13 23:34:02

</td>

</tr>

<tr>

<td style="text-align:left;">

20210113\_Arquivos\_xml\_2019.zip

</td>

<td style="text-align:right;">

120.5

</td>

<td style="text-align:left;">

2021-01-13 23:35:19

</td>

</tr>

<tr>

<td style="text-align:left;">

20210113\_Arquivos\_xml\_2020.zip

</td>

<td style="text-align:right;">

137.4

</td>

<td style="text-align:left;">

2021-01-13 23:36:38

</td>

</tr>

<tr>

<td style="text-align:left;">

20210113\_Arquivos\_xml\_2021.zip

</td>

<td style="text-align:right;">

54.9

</td>

<td style="text-align:left;">

2021-01-13 23:37:55

</td>

</tr>

</tbody>

</table>
