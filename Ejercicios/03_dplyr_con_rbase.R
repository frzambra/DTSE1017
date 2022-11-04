# R-base y pipes

library(dplyr)
library(purrr)

# ejemplo de uso de pipe nativo, en este caso arroja error con el asignador "_"
mtcars |> 
  filter(cyl == 4) |> 
  lm(mpg~drat,data = _) |> 
  summary() |> 
  _$r.squared
  
# el mismo caso anterior utiliznado el pipe de {magrittr} %>% con el asignador "."
mtcars %>% 
  filter(cyl == 4) %>% 
  lm(mpg~drat,data = .) %>% 
  summary() %>%
  .$r.squared

# utilizando el pipe nativo con la función anónima (lambda) "\(x)"
# divide los datos por la variable "cyl" luego aplica un modelo de regresión 
# lineal con la función "lm" y finalmente extrae el "r.squared"

mtcars |>  
  split(mtcars$cyl) |> 
  lapply(\(x) lm(mpg~wt,data = x)) |> 
  lapply(summary) |> 
  sapply(`[[`,"r.squared")

# con los datos de los pinguinos
# similar al caso anterior, pero con los datos de los pinguinos
library(palmerpenguins)
penguins[-c(2,7)] |> 
  split(penguins$species) |>
  lapply(\(x) lm(bill_length_mm~flipper_length_mm,data = x)) |> 
  lapply(summary) |> 
  sapply(`[[`,'r.squared')

penguins[-c(2,7)] |> 
  split(penguins$species) |> 
  lapply(\(x) plot(x$bill_length_mm,x$flipper_length_mm,type = 'p')) 

