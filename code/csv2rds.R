
# converte csv para rds: -------------------------------------------------------

## Pedidos ---------------------------------------------------------------------

### chama oarquivo csv:
pedidos_cgu <- read_csv("./data-raw/pedidos_cgu.csv")
pryr::object_size(pedidos_cgu)

### salva rds
saveRDS(pedidos_cgu, "./data-tidy/pedidos_cgu.rds", )

## Recursos --------------------------------------------------------------------

### chama csv
recursos_cgu <- read_csv("./data-raw/recursos_cgu.csv")
pryr::object_size(recursos_cgu)

### salva rds
saveRDS(recursos_cgu, "./data-tidy/recursos_cgu.rds")

# FIM 