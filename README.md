
# Download dos dados da de acesso a informação via LAI

Repositório para atualização da base de dados da CGU.

  - Download base de dados - [clique
    aqui](http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx)
  - Arquivos XML baixados [clique aqui](/data-raw)
  - Código em `python` para tratamento das variáveis - [clique
    aqui](/code)
  - Arquivos tratados prontos para analisar- [clique aqui](/data-tidy)

<!-- end list -->

``` r
URL <- "http://www.consultaesic.cgu.gov.br/arquivosRelatorios/PedidosRespostas/Dicionario-Dados-Exportacao.txt"
txt <- capture.output(cat(RCurl::getURL(URL)))
stringr::str_replace_all(txt, '\r', '')
#>  [1] "------------------------------"                                                                                                                                            
#>  [2] "-- CAMPOS: PEDIDOS"                                                                                                                                                        
#>  [3] "------------------------------"                                                                                                                                            
#>  [4] "- IdPedido - inteiro: identificador único do pedido (não mostrado no sistema);"                                                                                            
#>  [5] "- ProtocoloPedido - texto(17): número do protocolo do pedido;"                                                                                                             
#>  [6] "- OrgaoSuperiorAssociadoaoDestinatario - texto(250): Quando o órgão for vinculado, este campo traz o nome do seu órgão superior;"                                          
#>  [7] "- OrgaoDestinatario  - texto(250): nome do órgão destinatário do pedido;"                                                                                                  
#>  [8] "- Situacao - texto(200): descrição da situação do pedido;"                                                                                                                 
#>  [9] "- DataRegistro - Data DD/MM/AAAA HH:MM:SS : data de abertura do pedido;"                                                                                                   
#> [10] "- ResumoSolicitacao - texto(255): resumo do pedido;"                                                                                                                       
#> [11] "- DetalhamentoSolicitacao - texto(2048): detalhamento do pedido;"                                                                                                          
#> [12] "- PrazoAtendimento - Data DD/MM/AAAA HH:MM:ss : data limite para atendimento ao pedido;"                                                                                   
#> [13] "- FoiProrrogado - texto(3) \"Sim\" ou \"Não\" : informa se houve prorrogação do prazo do pedido;"                                                                          
#> [14] "- FoiReencaminhado - texto(3) \"Sim\" ou \"Não\": informa se o pedido foi reencaminhado;"                                                                                  
#> [15] "- FormaResposta - texto(200): tipo de resposta escolhida pelo solicitante na abertura do pedido;"                                                                          
#> [16] "- OrigemSolicitacao - texto(50): informa se o pedido foi aberto em um Balcão SIC ou pela Internet;"                                                                        
#> [17] "- IdSolicitante - inteiro: identificador único do solicitante (não mostrado no sistema);"                                                                                  
#> [18] "- CategoriaPedido - texto(200) : categoria do pedido atribuída pel SIC de acordo com o VCGE (Vocabulário COntrolado do GOverno Eletrônico);"                               
#> [19] "- SubCategoriaPedido - texto(200) : subcategoria do pedido atribuída pel SIC de acordo com o VCGE (Vocabulário COntrolado do GOverno Eletrônico);"                         
#> [20] "- NumeroPerguntas - inteiro : número de perguntas feitas no pedido;"                                                                                                       
#> [21] "- DataResposta - Data DD/MM/AAAA HH:MM:SS : data da resposta ao pedido (campo em branco para pedidos que ainda estejam na situação \"Em Tramitação\");"                    
#> [22] "- Resposta - texto(8000): resposta ao pedido;"                                                                                                                             
#> [23] "- TipoResposta - texto(100) : tipo resposta dada ao pedido (campo em branco para pedidos que ainda estejam na situação \"Em Tramitação\");"                                
#> [24] "- ClassificacaoTipoResposta - texto(200): subtipo da resposta dada ao pedido (campo em branco para pedidos que ainda estejam na situação \"Em Tramitação\");"              
#> [25] ""                                                                                                                                                                          
#> [26] ""                                                                                                                                                                          
#> [27] "------------------------------"                                                                                                                                            
#> [28] "-- CAMPOS: RECURSOS"                                                                                                                                                       
#> [29] "------------------------------"                                                                                                                                            
#> [30] ""                                                                                                                                                                          
#> [31] "- IdRecurso - inteiro: identificador único do recurso (não mostrado no sistema);"                                                                                          
#> [32] "- IdRecursoPrecedente - inteiro: identificador único do recurso que precedeu este (não mostrado no sistema e em branco no caso de Recursos de 1ª Instância e Reclamações);"
#> [33] "- DescRecurso - texto(8000): descrição do recurso;"                                                                                                                        
#> [34] "- IdPedido - inteiro: identificador único do pedido ao qual o recurso pertence (não mostrado no sistema);"                                                                 
#> [35] "- IdSolicitante - inteiro: identificador único do solicitante (não mostrado no sistema);"                                                                                  
#> [36] "- ProtocoloPedido - texto(17): número do protocolo do pedido ao qual o recurso pertence;"                                                                                  
#> [37] "- OrgaoSuperiorAssociadoaoDestinatario - texto(250): Quando o órgão for vinculado, este campo traz o nome do seu órgão superior;"                                          
#> [38] "- OrgaoDestinatario - texto(250): nome do órgão destinatário do recurso;"                                                                                                  
#> [39] "- Instancia - texto(80): descrição da instância do recurso;"                                                                                                               
#> [40] "- Situacao - texto(80): descrição da situação do recurso;"                                                                                                                 
#> [41] "- DataRegistro - Data DD/MM/AAAA HH:MM:SS : data de abertura do recurso;"                                                                                                  
#> [42] "- PrazoAtendimento - Data DD/MM/AAAA HH:MM:SS : data limite para atendimento ao recurso;"                                                                                  
#> [43] "- OrigemSolicitacao - texto(50): informa se o recurso foi aberto em um Balcão SIC ou pela Internet;"                                                                       
#> [44] "- TipoRecurso - texto(80): motivo de abertura do recurso;"                                                                                                                 
#> [45] "- DataResposta - Data DD/MM/AAAA HH:MM:SS : data da resposta ao recurso (campo em branco para recursos que ainda estejam na situação \"Em Tramitação\");"                  
#> [46] "- RespostaRecurso - texto(8000): resposta ao recurso;"                                                                                                                     
#> [47] "- TipoResposta - texto(80): tipo resposta dada ao recurso (campo em branco para recursos que ainda estejam na situação \"Em Tramitação\");"                                
#> [48] ""                                                                                                                                                                          
#> [49] ""                                                                                                                                                                          
#> [50] "------------------------------"                                                                                                                                            
#> [51] "-- CAMPOS: SOLICITANTES"                                                                                                                                                   
#> [52] "------------------------------"                                                                                                                                            
#> [53] ""                                                                                                                                                                          
#> [54] "- IdSolicitante - inteiro: identificador único do solicitante (não mostrado no sistema);"                                                                                  
#> [55] "- TipoDemandante - texto(15): Pessoa Fìsica ou Pessoa Jurídica;"                                                                                                           
#> [56] "- DataNascimento - Data DD/MM/AAAA : data de nascimento do solicitante;"                                                                                                   
#> [57] "- Sexo - texto(13) : Masculino ou Feminino (em branco para pessoa jurídica);"                                                                                              
#> [58] "- Escolaridade - texto(200): Escolaridade do solicitante (em branco para pessoa jurídica);"                                                                                
#> [59] "- Profissao - texto(200): Profissão do solicitante (em branco para pessoa jurídica);"                                                                                      
#> [60] "- TipoPessoaJuridica - texto(200): tipo de Pessoa Jurídica do solicitante (em branco para pessoa física)"                                                                  
#> [61] "- Pais - texto(200): país de residência do solicitante;"                                                                                                                   
#> [62] "- UF - texto(2): UF de residência do solicitante;"                                                                                                                         
#> [63] "- Municipio - texto(200): Município de residência do solicitante;"
```

``` r
#arquivos_xml %>% purrr::map(~unzip(.x, exdir = "./data-raw"))
list.files("./data-raw", pattern = ".zip", full.names = T) 
#> [1] "./data-raw/20200311_Arquivos_xml_2018.zip"
#> [2] "./data-raw/20200801_Arquivos_xml_2016.zip"
#> [3] "./data-raw/20200801_Arquivos_xml_2017.zip"
#> [4] "./data-raw/20200801_Arquivos_xml_2019.zip"
#> [5] "./data-raw/20200804_Arquivos_xml_2020.zip"
```

``` r
library(dplyr)
readRDS("./data-tidy/pedidos_cgu.rds") %>% glimpse()
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
```
