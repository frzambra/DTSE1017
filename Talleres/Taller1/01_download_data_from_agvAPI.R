library(agvAPI)
library(purrr)

est_filt <- estaciones_garces |> dplyr::filter(!is.na(lat))

data_agv <- map(est_filt$serial,
    getdataAGV, time_span = c("2022-09-01","2022-09-06"))

data_agv <- readRDS('Talleres/Taller1/data/data_agvAPI.rds')

est_filt <- readRDS('Talleres/Taller1/data/metadata_estaciones_agvAPI.rds')

data_agromet <- readRDS('Talleres/Taller1/data/data_estaciones_agrometAPI.rds')

library(dplyr)
library(tidyr)
data_agromet |> distinct(station_id) |> pull(station_id) |> split(sample(rep(1:3,137),409)) -> ind_agromet

rbind(ind_agromet)

saveRDS(ind_agromet[[1]],'Talleres/Taller1/data/station_id_agromet_Jesica.rds')
saveRDS(ind_agromet[[2]],'Talleres/Taller1/data/station_id_agromet_Pablo.rds')
saveRDS(ind_agromet[[3]],'Talleres/Taller1/data/station_id_agromet_Lucas.rds')

est_filt |> distinct(serial) |> pull(serial) |> split(sample(rep(1:3,49),145)) -> ind_agv

saveRDS(ind_agv[[1]],'Talleres/Taller1/data/station_id_agv_Jesica.rds')
saveRDS(ind_agv[[2]],'Talleres/Taller1/data/station_id_agv_Pablo.rds')
saveRDS(ind_agv[[3]],'Talleres/Taller1/data/station_id_agv_Lucas.rds')
