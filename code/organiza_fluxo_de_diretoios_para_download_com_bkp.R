# FLUXO DE ATUALIZAÇÃO =========================================================
library(tidyverse)
library(here)

#' @title Atualização da base de dados com backup e histórico de downloads
#' 
#' Chama a função `download_cgu_files(...)`, faz o download dos dados e cria um registro de downloads, transfere arquivo antigo para backup registrando saída.
#' Os dados são baixados de http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx
#' 
#' @param ano inteiro
#' 
#' @usage atualiza_base(ano == "2019")
#' 

atualiza_base <- function(ano) {
  
  # diretórios ----
  path <- here(paste0("data_raw/", ano))
  path_historico <- paste0(path, "/historico_downloads.rds")
  
  # cria os diretórios
  dir.create(path, recursive = T)
  dir.create(paste0("./data_bkp/", ano), recursive = T)
  
  # tabela histórico ----
  if (!file.exists(path_historico)) {
    
    file.info(path) %>%
      rownames_to_column(var = "arquivo") %>% 
      saveRDS(path_historico)
    
    message("criada lista histórico dos downloads")
    
    file.info(path_historico) %>%
      rownames_to_column(var = "arquivo") %>% 
      bind_rows(readRDS(path_historico), .) %>% 
      saveRDS(path_historico)
    
    historico <- readRDS(path_historico)
    print(historico)
    
  } else {
    
    message("carrega arquivo de atualização de histórico")
    
    historico <- readRDS(path_historico)
    print(historico)
    
  }
  
  # backup e registro no histórico ----
  # move arquivo antigo para bkp e faz o registro de saída
  if (!identical(list.files(path ,pattern = "zip", full.names = TRUE), character(0))) {
    
    arquivo_old <- path %>% 
      list.files(full.names = T, pattern = "zip$") %>% 
      file.info() %>% 
      filter(ctime == min(ctime)) %>%
      rownames_to_column(var = "arquivo") %>% 
      mutate(fluxo = "saída")
    
    historico <- bind_rows(historico, arquivo_old) 
    saveRDS(historico, path_historico)
    
    print(historico)
    message("historico atualizado")
    
    file.copy(from = arquivo_old$arquivo, to = str_replace(arquivo_old$arquivo, "raw", "bkp"))
    message("arquivo antigo movido para pasta data_bkp")
    
    unlink(arquivo_old$arquivo)
    message("arquivo antigo removido da pasta data_raw")
    
  } else {
    
    message("arquivo de backup não encontrado")
    
  }
  
  # donwload_cgu_files ----
  # chamar o novo download
  download_cgu_files(ano = ano, dest.file = str_replace_all(path, "/", fixed("\\\\")))
  Sys.sleep(60)
  
  # registra nova base ----
  # faz o registro de entrada da nova base
  arquivo_new <- list.files(path ,pattern = "zip", full.names = TRUE) %>% 
    file.info() %>% 
    rownames_to_column(var = "arquivo") %>% 
    mutate(fluxo = "entrada")
  
  historico <- bind_rows(historico, arquivo_new) 
  historico %>% saveRDS(path_historico)
  print(historico)
  message("historico atualizaado")
  
}

# ATUALIZAÇÂO ==================================================================
map(2017:2021, atualiza_base)
