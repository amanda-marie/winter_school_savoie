



data(package = .packages(all.available = TRUE))

MASS::crabs

boot::catsM

carData::TitanicSurvival

Titanic_data <- carData::TitanicSurvival

Titanic_data %>% group_by(passengerClass, survived) %>%
  summarise(count = n())

Titanic_data %>% group_by(passengerClass, survived) %>%
  summarise(count = n(), 
              count_surv = sum(survived == "yes"),
            count_dead = sum(survived == "no"),
            prop_surv = count_surv/(sum(count_dead + count_surv))) %>% 
           arrange(prop_surv)

Titanic_data %>% 
  group_by(passengerClass) %>% 
  summarise(count = n(),
sum_death = sum(survived == "no"), 
prop_passengers = sum_death/count)

Titanic_class_survival <- Titanic_data %>% 
  group_by(passengerClass) %>% 
  summarise(count = n(),
            sum_death = sum(survived == "no"), 
            prop_passengers = sum_death/count)


# basic histogram
p <- ggplot(Titanic_class_survival, aes(x=passengerClass, 
                                        y=prop_passengers)) + 
  geom_bar(stat = "identity")

p
