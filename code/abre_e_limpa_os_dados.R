# TRATAMENTO DA BASE ===========================================================

library(here)
library(tidyverse)
library(xml2)

# UNZIP ========================================================================
# unzip: to extraindo os arquivos no diretório temporário `tempdir()`
# os arquivos brutos (xml) moram na pasta 'data_raw/'
# a função abaixo vai em 'data_raw/' com sprintf(.) e here(.)
# extrai o endereço dos arquivos em loop com list.files(.)
# descompacta o arquivo em 'data_raw/' com unzip(.)
# retorna arquivos .xml no diretório selecionado (usei o tempdir(.) mesmo)
unzip_xml <- function(ano) {
  
  "data_raw/%s" %>% 
    sprintf(ano) %>% 
    here() %>% 
    map(~ list.files(.x, pattern = "zip", full.names = T)) %>% 
    map(~ unzip(.x, exdir = tempdir()))
  
}

# loop
map(2016:2021, unzip_xml) 

# guarde os caminhos p/ aquivos
arquivos_xml <- tempdir() %>% list.files(pattern = ".xml$", full.names = T)

# cria um relatório de arquivos baixados
relatorio_arquivos_xml <- tempdir() %>% 
  list.files(pattern = ".xml$", full.names = T) %>% 
  as_tibble_col(column_name = "full_path") %>% 
  mutate(
    categoria = full_path %>% str_extract("Pedidos|Recursos|Solicitantes"),
    ano = full_path %>% str_extract("(?<=_xml_)\\d{4}") %>% as.integer(),
    nome =  full_path %>% str_extract("\\d{6}.+xml$")
  ) %>% 
  arrange(categoria, ano)

#inspeciona
print(relatorio_arquivos_xml)

# OPEN AND TIDY ================================================================
# função que abre e faxina nos arquivos baixados
extract_data_from_xml <- function(path) {
  
  path %>%                                      # recebe o caminho do arquivo xml
    file(encoding = "utf-16") %>%               # abre o arquivo
    readLines() %>%                             # lê o arquivo como texto
    xml2::read_html(encoding = "utf-16") %>%    # lê o texto como xml
    xml2::as_list() %>%                         # converte atributos do xml em obj list
    .[[1]] %>%                                  # acessa conteúdos do list object pra devolver uma tabela estruturada
    .[[1]] %>%                                  # .
    .[[1]] %>%                                  # .
    purrr::map(`[`) %>%                         # .
    purrr::map(attributes) %>%                  # .
    purrr::map(as_tibble) %>%                   # acessamos os conteúdos e agora cada linha virou uma tibble
    dplyr::bind_rows()                          # empilha essas linhas e temos a tabela final ! horaayyy =D
  
}

# vamos enfileirar os arquivos por ano e tipo de interação
pedidos <- relatorio_arquivos_xml %>% filter(categoria == "Pedidos") %>% pull(full_path)
recursos<- relatorio_arquivos_xml %>% filter(categoria == "Recursos") %>% pull(full_path)
#solicits<- relatorio_arquivos_xml %>% filter(categoria == "Solicitantes") %>% pull(full_path)

# Agora pegue as filas de arquivos e passe em um loop com purrr::map(.)
# Criamos uma id por ano com purrr::set_names(.)
# Aninhamos os resultados por ano com tibble::enframe(.)
# Consolidamos uma tabela única para cada arquivo com tidyr::unnest(.) 
# isso demora uns 10 minutos para cada dataset, os campos de pedidos e respostas são large string, paciência...
dados_cgu_nested <- function(df) {
  
  df %>% 
    purrr::map(extract_data_from_xml) %>% 
    purrr::set_names(2016:2021) %>% 
    tibble::enframe(name = "ano") %>% 
    tidyr::unnest(value)
  
}

pedidos_cgu <- dados_cgu_nested(pedidos)
recursos_cgu <- dados_cgu_nested(recursos)
#solicits_cgu <- dados_cgu_nested(solicits)


# SAVE THE DATA ================================================================
# agora aninhamos todos os objetos em um único dataset
dados_cgu <- list(pedidos_cgu, recursos_cgu) %>% 
  set_names(c("Pedidos", "Recursos")) %>% 
  enframe(name = "categoria")
  
pryr::object_size(pedidos_cgu)
pryr::object_size(recursos_cgu)
pryr::object_size(dados_cgu)

#saveRDS(dados_cgu, here("ignore/dados_cgu.rds"))
