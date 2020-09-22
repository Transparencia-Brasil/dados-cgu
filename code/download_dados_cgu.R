#' @title Download dados de pedidos e respostas da CGU
#' 
#' A função abaixo faz o download dos dados de pedidos e respostas de acesso a informaçao
#' ao governo federal. 
#' 
#' #' A função faz o download o arquivo via RSelenium, 
#' Um erro comum ao carregar o RSelenium é a versão do navegador Google Chrome,
#' ver: https://github.com/ropensci/wdman/issues/23#issuecomment-482375132v
#' 
#' @param ano
#' @param formato
#' @param dest.file
#' 
#' Os dados são baixados de http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx
#'
#' @usage download_cgu_files(ano == "2019")
#' 

library(RSelenium)
library(tidyverse)

download_cgu_files <- function(ano, formato = "XML", dest.file = tempdir()) {
  
  # my_dir: onde o arquivo será salvo e setup do navegador ---------------------
  eCaps <- list(
    chromeOptions = list(
      prefs = list(
        "profile.default_content_settings.popups" = 0L,
        "download.prompt_for_download" = FALSE,
        "download.default_directory" = dest.file
      )
    )
  )
  
  # Carrega RSelenium ----------------------------------------------------------
  driver <- rsDriver(
    browser = c("chrome"),
    chromever = "85.0.4183.87",
    port = sample.int(9999, 1),
    extraCapabilities = eCaps
  )
  
  remDr <- driver[["client"]]
  
  # Acessando o site -----------------------------------------------------------
  remDr$navigate("http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx")
  
  # Seleciona ano --------------------------------------------------------------
  ano_vec <- 2:6
  names(ano_vec) <- 2016:2020
  xpath_ano <- sprintf('//*[@id="ctl00_PlaceHolderMain_cmbAno"]/option[%s]', ano_vec[ano])
  
  seleciona_ano <- remDr$findElement(using = 'xpath', xpath_ano)
  seleciona_ano$clickElement()
  
  # Seleciona formato ----------------------------------------------------------
  fmt_vec <- 2:3
  names(fmt_vec) <- c("XML", "CSV")
  xpath_fmt <- sprintf('//*[@id="ctl00_PlaceHolderMain_cmbFormato"]/option[%s]', fmt_vec[formato])
  
  seleciona_formato <- remDr$findElement(using = 'xpath', xpath_fmt)
  seleciona_formato$clickElement()
  
  # Clica em download ----------------------------------------------------------
  botao_download <- remDr$findElement(using = 'xpath', '//*[@id="ctl00_PlaceHolderMain_btnDownload"]')
  botao_download$clickElement()
  
}

download_cgu_files(ano = "2020")

#' @title cgu_xml2tibble
#' 


library(tidyverse)
library(xml2)

#arquivos_xml %>% map(~unzip(.x, exdir = "./data-raw"))

arquivos_xml <- "./data-raw" %>% list.files(pattern = ".xml$", full.names = T) 
arquivos_xml[1]

pedidos <- arquivos_xml[1] %>% 
  file(encoding = "utf-16") %>% 
  readLines() %>% 
  read_html(encoding = "utf-16") %>%
  as_list() %>% 
  .[[1]] %>% 
  .[[1]] %>% 
  .[[1]] %>% 
  map(`[`) %>% 
  map(attributes) %>% 
  map(as_tibble) %>% 
  bind_rows()

pryr::object_size(pedidos)

#TODO: loop com todos os arquivos xml
