library(tibbe)

tibble( a = rnorm(100))
data.frame( a = rnorm(100))

tibble(
  x = c("a", "b"),
  y = c(1, 2),
  z = c(T, F)
)

tribble(
  ~x, ~y,  ~z,
  "a", 1,  T,
  "b", 2,  F
)


m <- data.frame(
  x = c("a", "b"),
  y = c(1, 2),
  z = c(T, F)
) 

as_tibble(m)

v <- c(x = "a", y = "b", z = 1)

attributes(v)

enframe(v, name = "name", value = "value")


iris |> 
  as_tibble() |> 
  glimpse()


tb <- tibble(
  `1` = 1:5,
  ` ` = 5:1,
  `país` = round(rnorm(5)))
tb 

install.packages('emo')
library(emo)
paises <- c(emo::ji('chile'),emo::ji('argentina'),emo::ji('brazil'))
names(tb) <- paises
tb

library(palmerpenguins)
install.packages('palmerpenguins')

penguins |> glimpse()
penguins[-c(2,7)] |> glimpse()


penguins[-c(2,7)] |> 
  # subset(species == 'Adelie') |>
  subset(select = -species)


penguins %>% 
  subset(year == 2007) %>% 
  .$body_mass_g %>%
  mean(na.rm = TRUE)

penguins[1:5, c("island", "bill_length_mm")] %T>% 
  print %>% 
  .$bill_length_mm %>% mean(na.rm=T)

library(magrittr)
penguins %$% 
  plot(species, bill_length_mm)  

# equivalente a: plot(penguins$species, penguins$bill_length_mm)


var <- penguins$bill_length_mm

var %<>% mean(na.rm=T)

penguins %>% 
  subset(x = ., species == 'Adelie') %>%
  print(n=3)

penguins %>% 
  subset(., species == 'Adelie') %>%
  print(n=3)

penguins %>% 
  subset(species == 'Adelie')

penguins |> 
  subset(species == 'Adelie') |> 
  subset(select = -c(1,2,7)) |> 
  apply(2, mean, na.rm = TRUE)

penguins %>%
  subset(species == 'Adelie')  %>%
  subset(select = -c(1,2,7)) %>%
  apply(2, mean, na.rm = TRUE)


penguins %>% 
  subset(species == 'Adelie') %>%
  lm(bill_length_mm~flipper_length_mm,data = .) %>% 
  .$coef


penguins |> 
  subset(species == 'Adelie') |> 
  (\(d) lm(bill_length_mm~flipper_length_mm, data = d))()

# 4.2.0
penguins |> 
  subset(species == 'Adelie') |> 
  lm(bill_length_mm~flipper_length_mm, data =_) |> 
  _$coef

#### 
library(palmerpenguins)
penguins |> 
  subset(species == 'Chinstrap') |> 
  lm(bill_length_mm~flipper_length_mm,data = _)

library(magrittr)
penguins %>%
  subset(species == 'Chinstrap') %>% 
  lm(bill_length_mm~flipper_length_mm,data = .)

penguins %>% 
  split(list(penguins$species)) %>%
  lapply(lm(bill_length_mm~flipper_length_mm,data = .))

penguins |> 
  split(list(penguins$species)) |>
  lapply( \(x) lm(bill_length_mm~flipper_length_mm,data = x))
