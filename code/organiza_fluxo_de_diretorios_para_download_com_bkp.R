# FLUXO DE ATUALIZAÇÃO =========================================================
library(tidyverse)
library(glue)

atualiza_base <- function(ano) {
  
  # INICIA FLUXO DE ATUALIZAÇÂO ==================================================
  
  is_first_download <- !file.exists(here(glue("data_raw/{ano}")))
  
  if (is_first_download == TRUE) { 
    
    # caso seja a primeira vez que o download é feito
    # . montamos do zero a estrutura de diretórios
    message("Este é o primeiro download, vamos criar a estrutura de diretórios do zero")
    
    # . criando as pastas...
    dir.create("data_raw") 
    dir.create("data_bkp") 
    message("pasta 'data_raw' e 'data_bkp' criada")
    
    # . criando as subpastas...
    glue("data_raw/{ano}") %>% here() %>% dir.create()
    glue("data_bkp/{ano}") %>% here() %>% dir.create()
    message(glue("subpastas de {ano} em 'data_raw' e 'data_bkp' criadas"))
    
    # . e criando a ficha de registro...
    ficha_de_registro <- tibble(
      nome_do_arquivo = "criação da pasta de backup",
      tamanho = NA,
      data_download = Sys.time()
    )
    
    saveRDS(ficha_de_registro, glue("data_bkp/{ano}/ficha_de_registro_{ano}.rds"))
    message("relatório de backup pronto para uso")
    
    # e uma log de inicialização
    cat(glue("repositório iniciado em {Sys.time()}"), file = glue("data_raw/{ano}/log_de_incializacao_de_fluxo.txt"))
    message("log de inicialização de fluxo criado")
    
  } else {
    
    # caso a NÃO seja a primeira vez que odownload é feito, seguimos em frente
    message("Atualizando estrutura de diretórios existente")
    
  }
  
  # MOVIMENTA ARQUIVO E PREENCHE FICHA DE REGISTRO ===============================
  
  # precisa mover o arquivo antigo para a pasta de backup
  arquivo_old <- glue("data_raw/{ano}") %>% here() %>% dir(full.names = T)
  
  # e precisa atualizar a ficha de regustro
  registro_old <- arquivo_old %>% 
    file.info() %>% 
    transmute(
      nome_do_arquivo = row.names(.) %>% str_remove(glue("^.+{ano}/")),
      tamanho = paste(round(size/(1024^2),2), "mb"),
      data_download = ctime
    )
  
  glue("data_bkp/{ano}/ficha_de_registro_{ano}.rds") %>% 
    readRDS() %>% 
    bind_rows(registro_old) %>% 
    saveRDS(glue("data_bkp/{ano}/ficha_de_registro_{ano}.rds"))
  
  # remove arquivo de bkp antigo 
  glue("data_bkp/{ano}") %>% list.files(pattern = "zip", full.names = TRUE) %>% unlink()
  
  # transfere arquivo de bakp mais recente
  file.copy(from = arquivo_old, to = str_replace(arquivo_old, "raw", "bkp"))
  
  # limpa a pasta "data_raw"
  unlink(arquivo_old)
  
  # DOWNLOAD DO NOVO ARQUIVO =====================================================
  # chamar o novo download
  source(here("code/download_dados_cgu.R"))
  download_cgu_files(ano = glue("{ano}"), dest.file = glue("data_raw/{ano}") %>% here() %>% str_replace_all("/", fixed("\\\\")))
  Sys.sleep(60)
  
}

# ATUALIZAÇÂO ==================================================================
map(2017:2021, atualiza_base)
