#+ message = FALSE
# FUNÇÃO QUE FAZ DOWNLOAD ======================================================
library(RSelenium)
library(tidyverse)
library(here)

#' @title Download dados de pedidos e respostas da CGU
#' 
#' A função abaixo faz o download dos dados de pedidos e respostas de acesso a informaçao
#' ao governo federal. 
#' 
#' #' A função faz o download o arquivo via RSelenium, 
#' Um erro comum ao carregar o RSelenium é a versão do navegador Google Chrome,
#' ver: https://github.com/ropensci/wdman/issues/23#issuecomment-482375132v
#' 
#' @param ano inteiro
#' @param formato `"XML"` (default) ou `"CSV"`
#' @param dest.file onde quer salvar o download? `tempdir()` é o default, separador `"//"`
#' @param versao_do_chrome certifique-se de que vc está usando a versão mais atual do Chrome e escolha uma versão com o comando `binman::list_versions("chromedriver")$win32`
#' 
#' Os dados são baixados de http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx
#'
#' @usage download_cgu_files(ano == "2019")
#' 

download_cgu_files <- function(ano,
                               formato = "XML",
                               dest.file = tempdir(),
                               versao_do_chrome = binman::list_versions("chromedriver")$win32[5]) {
  
  # dest.file ----
  eCaps <- list(
    chromeOptions = list(
      prefs = list(
        # entra nas opções do Chrome e define pasta de destino para download (dest.file)
        "profile.default_content_settings.popups" = 0L,
        "download.prompt_for_download" = FALSE,
        "download.default_directory" = dest.file
      )
    )
  )
  
  # open web browser ----
  # Importante: faça um teste da ver
  driver <- rsDriver(
    browser = c("chrome"),
    chromever = versao_do_chrome,  
    port = sample.int(9999, 1),
    extraCapabilities = eCaps
  )
  
  remDr <- driver[["client"]]
  
  # open website ----
  remDr$navigate("http://www.consultaesic.cgu.gov.br/busca/_layouts/15/DownloadPedidos/DownloadDados.aspx")
  
  # ano ----
  ano_vec <- 2:6
  names(ano_vec) <- 2017:2021
  xpath_ano <- sprintf('//*[@id="ctl00_PlaceHolderMain_cmbAno"]/option[%s]', ano_vec[ano])
  
  seleciona_ano <- remDr$findElement(using = 'xpath', xpath_ano)
  seleciona_ano$clickElement()
  
  # format ----
  fmt_vec <- 2:3
  names(fmt_vec) <- c("CSV", "XML")
  xpath_fmt <- sprintf('//*[@id="ctl00_PlaceHolderMain_cmbFormato"]/option[%s]', fmt_vec[formato])
  
  seleciona_formato <- remDr$findElement(using = 'xpath', xpath_fmt)
  seleciona_formato$clickElement()
  
  # aciona download ----
  botao_download <- remDr$findElement(using = 'xpath', '//*[@id="ctl00_PlaceHolderMain_btnDownload"]')
  botao_download$clickElement()
  
}