
# Download dos dados da de acesso a informação via LAI

Repositório para atualização da base de dados da CGU.

  - Download base de dados - [clique
    aqui](http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx)
  - Arquivos XML baixados [clique aqui](/data-raw)
  - Código em `python` para tratamento das variáveis - [clique
    aqui](/code)
  - Arquivos tratados prontos para analisar- [clique aqui](/data-tidy)

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">

<caption>

Tabela: PEDIDOS

</caption>

<thead>

<tr>

<th style="text-align:left;">

Campos

</th>

<th style="text-align:left;">

Formato

</th>

<th style="text-align:left;">

Descricao

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

IdPedido

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

ProtocoloPedido

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

OrgaoDestinatario

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

Situacao

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

DataRegistro

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

ResumoSolicitacao

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

DetalhamentoSolicitacao

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

PrazoAtendimento

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

FoiProrrogado

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

FoiReencaminhado

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

FormaResposta

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

OrigemSolicitacao

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

IdSolicitante

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

AssuntoPedido

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

SubAssuntoPedido

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

DataResposta

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

Resposta

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

Decisao

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

EspecificacaoDecisao

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

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">

<caption>

Tabela: RECURSOS

</caption>

<thead>

<tr>

<th style="text-align:left;">

Campos

</th>

<th style="text-align:left;">

Formato

</th>

<th style="text-align:left;">

Descricao

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

IdRecurso

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

IdRecursoPrecedente

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

DescRecurso

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

IdPedido

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

IdSolicitante

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

ProtocoloPedido

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

OrgaoDestinatario

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

Instancia

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

Situacao

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

DataRegistro

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

PrazoAtendimento

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

OrigemSolicitacao

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

TipoRecurso

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

DataResposta

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

RespostaRecurso

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

TipoResposta

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

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">

<caption>

Tabela: SOLICITANTES

</caption>

<thead>

<tr>

<th style="text-align:left;">

Campos

</th>

<th style="text-align:left;">

Formato

</th>

<th style="text-align:left;">

Descricao

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

IdSolicitante

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

TipoDemandante

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

DataNascimento

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

Genero

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

Escolaridade

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

Profissao

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

TipoPessoaJuridica

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

Pais

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

UF

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

Municipio

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

    #> [1] "./data-raw/20200311_Arquivos_xml_2018.zip"
    #> [2] "./data-raw/20200801_Arquivos_xml_2016.zip"
    #> [3] "./data-raw/20200801_Arquivos_xml_2017.zip"
    #> [4] "./data-raw/20200801_Arquivos_xml_2019.zip"
    #> [5] "./data-raw/20200804_Arquivos_xml_2020.zip"

    #> Rows: 445,488
    #> Columns: 22
    #> $ IdPedido                             <dbl> 345365, 345366, 345367, 345368...
    #> $ ProtocoloPedido                      <chr> "99901000001201633", "99902000...
    #> $ OrgaoDestinatario                    <chr> "BB – Banco do Brasil S.A.", "...
    #> $ OrgaoSuperiorAssociadoaoDestinatario <chr> NA, NA, NA, NA, NA, NA, "ME - ...
    #> $ Situacao                             <chr> "Respondido", "Respondido", "R...
    #> $ DataRegistro                         <chr> "01/01/2016 09:24:13", "01/01/...
    #> $ ResumoSolicitacao                    <chr> "consultar meu cpf . no spc e ...
    #> $ DetalhamentoSolicitacao              <chr> "Consulta do cpf no serasa e s...
    #> $ PrazoAtendimento                     <chr> "25/01/2016 23:59:59", "25/01/...
    #> $ FoiProrrogado                        <chr> "NÃO", "NÃO", "NÃO", "NÃO", "N...
    #> $ FoiReencaminhado                     <chr> "NÃO", "NÃO", "NÃO", "NÃO", "S...
    #> $ FormaResposta                        <chr> "Pelo sistema (com avisos por ...
    #> $ OrigemSolicitacao                    <chr> "Internet", "Internet", "Inter...
    #> $ IdSolicitante                        <dbl> 604629, 537117, 604635, 604636...
    #> $ CategoriaPedido                      <chr> "Economia e Finanças", "Econom...
    #> $ SubCategoriaPedido                   <chr> "Economia", "Economia", "Econo...
    #> $ NumeroPerguntas                      <dbl> 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, ...
    #> $ DataResposta                         <chr> "25/01/2016 11:30:39", "05/01/...
    #> $ Resposta                             <chr> "Prezado(a) Sr(a). Gisela,  En...
    #> $ TipoResposta                         <chr> "Acesso Concedido", "Acesso Ne...
    #> $ ClassificacaoTipoResposta            <chr> "Resposta solicitada inserida ...
    #> $ id_ano                               <chr> "345365_2016", "345366_2016", ...
