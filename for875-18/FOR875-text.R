par(mar = c(5.1, 4.1, 4.1, 2.1))
par(mfrow=c(1,1))


## ----chapter2, child='02-introToR/02-introToR.Rnw'-----------------------

## ----console, prompt=TRUE------------------------------------------------
34+20*sqrt(100)  ## +,-,*,/ have the expected meanings
exp(2)  ##The exponential function
log10(100)  ##Base 10 logarithm
log(100)  ##Base e logarithm
10^log10(55)

## ----vectorized, prompt=TRUE---------------------------------------------
1:25 ##The integers from 1 to 25
log(1:25) ##The base e logarithm of these integers
1:25*1:25 ##What will this produce?
1:25*1:5 ##What about this?
seq(from=0, to=1, by=0.1) ##A sequence of numbers from 0 to 1
exp(seq(from=0, to=1, by=0.1)) ##What will this produce?

## ----prompt=TRUE, tidy=FALSE---------------------------------------------
car.hp <- c(110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 
123, 180, 180, 180, 205)
car.mpg <- c(21.0, 21.0, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, 22.8, 
             19.2, 17.8, 16.4, 17.3, 15.2, 10.4)
car.name <- c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710", 
              "Hornet 4 Drive", "Hornet Sportabout", "Valiant", 
              "Duster 360", "Merc 240D", "Merc 230", "Merc 280", 
              "Merc 280C", "Merc 450SE", "Merc 450SL", 
              "Merc 450SLC", "Cadillac Fleetwood")
car.hp
car.mpg
car.name

## ----prompt=T------------------------------------------------------------
mean(car.hp)
sd(car.hp)
summary(car.hp)
mean(car.mpg)
sd(car.mpg)
summary(car.mpg)

## ----fig=T---------------------------------------------------------------
plot(car.hp, car.mpg)


## ----chapter3, child='03-rMarkdown/03-rMarkdown.Rnw'---------------------

## ----prompt=TRUE, eval=FALSE---------------------------------------------
## u <- "http://blue.for.msu.edu/FOR875/data/WorldBank.csv"
## WorldBank <- read.csv(u, header=TRUE, stringsAsFactors=FALSE)

## ----prompt = TRUE-------------------------------------------------------
names(WorldBank)

## ----prompt=TRUE---------------------------------------------------------
fertility <- WorldBank$fertility.rate[WorldBank$year == 1960]
lifeexp <- WorldBank$life.expectancy[WorldBank$year==1960]
fertility[1:10]
lifeexp[1:10]

## ----prompt=TRUE, out.width = '5in', out.height = '5in'------------------
plot(lifeexp, fertility)

## ----prompt = TRUE-------------------------------------------------------
pop <- WorldBank$population[WorldBank$year==1960]
region <- WorldBank$region[WorldBank$year==1960]
pop[1:10]
region[1:10]

## ----prompt=TRUE, tidy=FALSE---------------------------------------------
plot(lifeexp, fertility, type="n")
symbols(lifeexp, fertility, circles=sqrt(pop/pi), inches=0.35, 
        bg=match(region, unique(region)))


## ----chapter4, child='04-dataStructures/04-dataStructures.Rnw'-----------

## ------------------------------------------------------------------------
a <- 1
str(a)
is.vector(a)
length(a)

## ----tidy=FALSE----------------------------------------------------------
weight <- c(123, 157, 205, 199, 223, 140, 105)
weight
gender <- c("female", "female", "male", "female", "male", 
            "male", "female")
gender

## ------------------------------------------------------------------------
weight <- c(weight, 194)
gender <- c(gender, "male")
weight
gender

## ------------------------------------------------------------------------
typeof(weight)
typeof(gender)
bp <- c(FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE)
bp
typeof(bp)

## ------------------------------------------------------------------------
weight.int <- as.integer(weight)
weight.int
typeof(weight.int)
weight.char <- as.character(weight)
weight.char
bp.double <- as.double(bp)
bp.double
gender.oops <- as.double(gender)
gender.oops
sum(bp)

## ------------------------------------------------------------------------
is.double(weight)
is.character(weight)
is.integer(weight.int)
is.logical(bp)

## ------------------------------------------------------------------------
xx <- c(1, 2, 3, TRUE)
xx
yy <- c(1, 2, 3, "dog")
yy
zz <- c(TRUE, FALSE, "cat")
zz
weight+bp

## ------------------------------------------------------------------------
weight
weight[5]
weight[1:3]
length(weight)
weight[length(weight)]
weight[]
weight[3] <- 202
weight

## ------------------------------------------------------------------------
weight[-3]
weight[-length(weight)]
lessWeight <- weight[-c(1,3,5)]
lessWeight 
weight[0]
weight[c(0,2,1)]
weight[c(-1, 2)]

## ----tidy=FALSE----------------------------------------------------------
age <- c("middle age", "senior", "middle age", "senior", 
         "senior", "senior", "senior", "middle age")
income <- c("lower", "lower", "upper", "middle", "upper", 
            "lower", "lower", "middle")
age
income
age <- factor(age, levels=c("youth", "young adult", "middle age", 
                            "senior"))
age
income <- factor(income, levels=c("lower", "middle", "upper"), 
                 ordered = TRUE)
income

## ------------------------------------------------------------------------
weight
Weight

## ------------------------------------------------------------------------
missingCharacter <- c("dog", "cat", NA, "pig", NA, "horse")
missingCharacter
is.na(missingCharacter)
missingCharacter <- c(missingCharacter, "NA")
missingCharacter
is.na(missingCharacter)
allMissing <- c(NA, NA, NA)
typeof(allMissing)

## ----prompt=TRUE---------------------------------------------------------
mean(c(1,2,3,NA,5))
mean(c(1,2,3,NA,5), na.rm=TRUE)

## ----prompt=TRUE---------------------------------------------------------
x <- 0:4
x
1/x
x/x
y <- c(10, 1000, 10000)
2^y

## ----prompt=TRUE, tidy=FALSE---------------------------------------------
healthData <- data.frame(Weight = weight, Gender=gender, bp.meds = bp, 
                         stringsAsFactors=FALSE)
healthData
names(healthData)
colnames(healthData)
names(healthData) <- c("Wt", "Gdr", "bp")
healthData
rownames(healthData)
names(healthData) <- c("Weight", "Gender", "bp.meds")

## ----prompt=TRUE---------------------------------------------------------
data(mtcars)
head(mtcars)
tail(mtcars)

## ----prompt=TRUE---------------------------------------------------------
mtcars[1,4]
mtcars[1:3, 3]
mtcars[1:3, 2:3]
mtcars[,1]

## ----prompt=TRUE---------------------------------------------------------
mtcars$mpg
mtcars$cyl
mpg
cyl
weight

## ----prompt=TRUE---------------------------------------------------------
mpgHpLinMod <- lm(mpg ~ hp, data=mtcars)
mode(mpgHpLinMod)
names(mpgHpLinMod)
mpgHpLinMod$coefficients
mpgHpLinMod$residuals

## ----prompt=TRUE, tidy=FALSE---------------------------------------------
temporaryList <- list(first=weight, second=healthData, 
                      pickle=list(a = 1:10, b=healthData))
temporaryList

## ----prompt=TRUE---------------------------------------------------------
temporaryList$first
mode(temporaryList$first)
temporaryList[[1]]
mode(temporaryList[[1]])
temporaryList[1]
mode(temporaryList[1])

## ----prompt=TRUE---------------------------------------------------------
temporaryList[c(1,2)]
temporaryList[[c(1,2)]]

## ----prompt=TRUE---------------------------------------------------------
temporaryList[[c(1,2,3)]]

## ----prompt = TRUE-------------------------------------------------------
weight
weight > 200
gender[weight > 200]
weight[weight > 200]
gender == "female"
weight[gender == "female"]

## ----prompt=TRUE---------------------------------------------------------
weight
lightweight <- weight[weight < 200]
lightweight
x <- 1:10
x
x[x < 5] <- 0
x
y <- -3:9
y
y[y < 0] <- NA
y
rm(x)
rm(y)

## ----prompt=TRUE---------------------------------------------------------
healthData
healthData$Weight[healthData$Gender == "male"]
healthData[healthData$Gender == "female", ]
healthData[healthData$Weight > 190, 2:3]

## ----prompt=TRUE---------------------------------------------------------
str(mtcars)
str(temporaryList)
str(WorldBank)

## ----prompt=TRUE---------------------------------------------------------
WorldBank1971 <- WorldBank[WorldBank$year == 1971, ]
dim(WorldBank1971)

## ----prompt=TRUE---------------------------------------------------------
WorldBank1971$fertility.rate[1:25]
!is.na(WorldBank1971$fertility.rate[1:25])
WorldBank1971 <- WorldBank1971[!is.na(WorldBank1971$fertility.rate),]
dim(WorldBank1971)

## ----prompt=TRUE, tidy=FALSE---------------------------------------------
temporaryDataFrame <- data.frame(V1 = c(1, 2, 3, 4, NA), 
                                 V2 = c(NA, 1, 4, 5, NA), 
                                 V3 = c(1, 2, 3, 5, 7))
temporaryDataFrame
is.na(temporaryDataFrame)
rowSums(is.na(temporaryDataFrame))

## ----prompt=TRUE---------------------------------------------------------
dim(WorldBank)
WorldBankComplete <- WorldBank[rowSums(is.na(WorldBank)) == 0,]
dim(WorldBankComplete)

## ------------------------------------------------------------------------
1:10
-5:3
10:4
pi:7

## ------------------------------------------------------------------------
seq(from = 0, to = 1, length = 11)
seq(from = 1, to = 5, by = 1/3)
seq(from = 3, to = -1, length = 10)

## ------------------------------------------------------------------------
rep(c(1,2,4), length = 9)
rep(c(1,2,4), times = 3)
rep(c("a", "b", "c"), times = c(3, 2, 7))


## ----chapter5, child='05-graphics/05-graphics.Rnw'-----------------------

## ----prompt=TRUE, tidy=TRUE----------------------------------------------
data(iris)
str(iris)

## ----prompt = TRUE, eval=FALSE-------------------------------------------
## install.packages("ggplot2")

## ----prompt = FALSE, tidy=FALSE------------------------------------------
library(ggplot2)
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point()

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size = 4, aes(color=Species))

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size = 3, aes(color=Species, shape=Species))

## ----prompt = FALSE------------------------------------------------------
iris.p <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) 
iris.p + geom_point()
iris.p + geom_point(size = 3, aes(color=Species, shape=Species))

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size=3, aes(color=Species))

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size=3, aes(color=Species)) + 
    stat_smooth(method = lm, se=FALSE)

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size=3, aes(color=Species)) + 
    stat_smooth(method = lm, se=FALSE, aes(color=Species))

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
    geom_point(size=3) + stat_smooth(method = lm, se=FALSE)

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size = 4, aes(color=Species, shape = Species)) + 
    geom_line()

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point(size = 4, aes(color=Species)) + 
    geom_line(aes(color=Species))

## ----tidy=FALSE----------------------------------------------------------
u.crime <- "http://blue.for.msu.edu/FOR875/data/crimeRatesByState2005.csv"
crime <- read.csv(u.crime, header=TRUE)
str(crime)
ggplot(data <- crime, aes(x = burglary, y = motor_vehicle_theft)) + 
    geom_point()

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = crime, aes(x = burglary, y = motor_vehicle_theft)) + 
    geom_point() + 
    labs(x = "Burglaries per 100,000 population", 
         y = "Motor vehicle theft per 100,000 population",
         title = "Burglaries vs motor vehicle theft for US states",
         subtitle = "2005 crime rates and 2008 population",
         caption = "Data from Nathan Yau http://flowingdata.com"
         )

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = crime, aes(x = burglary, y = motor_vehicle_theft)) + 
    geom_point() + 
    scale_x_continuous(name="Burglaries per 100,000 population", 
                       limits=c(0,max(crime$burglary))) +
    scale_y_continuous(name="Motor vehicle theft per 100,000 population", 
                       limits = c(0, max(crime$motor_vehicle_theft)))

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = crime, aes(x = burglary, y = motor_vehicle_theft, 
           size=population/100000)) + 
    geom_point(color = "blue") + 
    geom_label(aes(label = state), alpha = 0.5) +
    scale_x_continuous(name="Burglaries per 100,000 population", 
                       limits=c(0,max(crime$burglary))) +
    scale_y_continuous(name="Motor vehicle theft per 100,000 population", 
                       limits = c(0, max(crime$motor_vehicle_theft))) +
    labs(size="Population\n(100,000)")

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(data = crime, aes(x = burglary, y = motor_vehicle_theft, 
           size=population/100000)) + 
    geom_point(color = "blue") + 
    scale_x_continuous(name="Burglaries per 100,000 population", 
                       limits=c(0,max(crime$burglary))) +
    scale_y_continuous(name="Motor vehicle theft per 100,000 population", 
                       limits = c(0, max(crime$motor_vehicle_theft))) +
    labs(size="Population\n(100,000)") +
    ggrepel::geom_label_repel(aes(label = state), alpha = 0.5)

## ------------------------------------------------------------------------
u.newcomb <- "http://blue.for.msu.edu/FOR875/data/Newcomb.csv"
Newcomb <- read.csv(u.newcomb, header=TRUE)
head(Newcomb)

## ----prompt=FALSE, tidy=FALSE--------------------------------------------
ggplot(Newcomb, aes(x = Time)) + geom_histogram()

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(Newcomb, aes(x = Time)) + 
    geom_histogram(binwidth = 5, color = "black", fill = "blue" )

## ----prompt = FALSE, tidy=FALSE, warning = FALSE-------------------------
library(gapminder)
ggplot(data = subset(gapminder,  year == 2002), 
       aes(x = continent, y = gdpPercap)) + 
    geom_boxplot(color = "black", fill = "lightblue")

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(data = subset(gapminder,  year == 2002), 
       aes(x = continent, y = gdpPercap)) + 
    geom_boxplot(color = "red", fill = "lightblue") + 
    scale_x_discrete(name = "Continent") + 
    scale_y_continuous(name = "Per Capita GDP") + coord_flip()

## ------------------------------------------------------------------------
u.goals <- "http://blue.for.msu.edu/FOR875/data/StudentGoals.csv"
StudentGoals <- read.csv(u.goals, header=TRUE)
head(StudentGoals)

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(StudentGoals, aes(x = Goals)) + geom_bar()
ggplot(StudentGoals, aes(x = Goals, fill = Gender)) + geom_bar()
ggplot(StudentGoals, aes(x = Goals, fill = Gender)) + 
    geom_bar(position = "dodge")

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(subset(gapminder, country == "India"), aes(x = year, y = gdpPercap)) + 
    geom_bar(stat = "identity", color = "black", fill = "steelblue2") + 
    ggtitle("India's per-capita GDP")

## ----prompt = FALSE, tidy=FALSE------------------------------------------
x <- seq(-pi, pi, len = 1000)
sin.data <- data.frame(x = x, y = sin(x))
ggplot(data = sin.data, aes(x = x, y = y)) + geom_line() + 
    scale_y_continuous(name = "sin(x)")

## ----prompt = FALSE, tidy=FALSE------------------------------------------
ggplot(data = sin.data, aes(x = x, y = y)) + geom_line() + 
    scale_y_continuous(name = "sin(x)") +
    theme_classic()

## ----prompt = FALSE, tidy=FALSE, eval=FALSE------------------------------
## ggplot(filename = "sin-plot.pdf", device="pdf")


## ----chapter6, child='06-workingWithData/06-workingWithData.Rnw'---------

## ----tidy=FALSE----------------------------------------------------------
u.bb <- "http://blue.for.msu.edu/FOR875/data/BrainAndBody.csv"
BrainBody <- read.table(file = u.bb, header = TRUE, sep = ",", 
                        stringsAsFactors = FALSE)
head(BrainBody)

## ----tidy=FALSE----------------------------------------------------------
u.bb <- "http://blue.for.msu.edu/FOR875/data/BrainAndBody.tsv"
BrainBody2 <- read.table(file = u.bb, header = TRUE, sep = "\t", 
                         stringsAsFactors = FALSE)
head(BrainBody2)

## ----tidy=FALSE----------------------------------------------------------
u.bb <- "http://blue.for.msu.edu/FOR875/data/BrainAndBody.txt"
BrainBody3 <- read.table(u.bb, header = TRUE, sep = " ", 
                         stringsAsFactors = FALSE)

## ----tidy=FALSE----------------------------------------------------------
u.bb <- "http://blue.for.msu.edu/FOR875/data/BrainAndBody.txt"
BrainBody3 <- read.table(u.bb, header = TRUE, sep = " ", 
                         stringsAsFactors = FALSE, skip = 4)
BrainBody3[1:10,]

## ----tidy=FALSE----------------------------------------------------------
u.weather <- "http://blue.for.msu.edu/FOR875/data/WeatherKLAN2014.csv"
WeatherKLAN2014 <- read.csv(u.weather, header=TRUE, 
                            stringsAsFactors = FALSE, na.string = "")
WeatherKLAN2014[1:15,]

## ----tidy=FALSE----------------------------------------------------------
u.weather <- "http://blue.for.msu.edu/FOR875/data/WeatherKLAN2014Full.csv"
WeatherKLAN2014Full <- read.csv(u.weather, header=TRUE, 
                               stringsAsFactors = FALSE, 
                               na.string = "")
names(WeatherKLAN2014Full)

## ------------------------------------------------------------------------
mean(WeatherKLAN2014Full$Mean.TemperatureF)
mean(WeatherKLAN2014Full$Min.TemperatureF)
mean(WeatherKLAN2014Full$Max.TemperatureF)
##Et Cetera

## ------------------------------------------------------------------------
str(WeatherKLAN2014Full)

## ------------------------------------------------------------------------
WeatherKLAN2014Full$PrecipitationIn[1:50]

## ------------------------------------------------------------------------
colMeans(WeatherKLAN2014Full[,c(2:19, 21, 23)])

## ------------------------------------------------------------------------
apply(X = WeatherKLAN2014Full[,c(2:19, 21, 23)], MARGIN = 2, FUN = sd)

## ----tidy=FALSE----------------------------------------------------------
mean(WeatherKLAN2014Full$Max.TemperatureF[
                             WeatherKLAN2014Full$CloudCover < 4 & 
                             WeatherKLAN2014Full$Max.Humidity > 85])

## ------------------------------------------------------------------------
with(WeatherKLAN2014Full, 
     mean(Max.TemperatureF[CloudCover < 4 & Max.Humidity > 85]))

## ------------------------------------------------------------------------
library(gapminder)
str(gapminder)

## ------------------------------------------------------------------------
gapminder$TotalGDP <- gapminder$gdpPercap * gapminder$pop
str(gapminder)

## ------------------------------------------------------------------------
rm(gapminder)
library(gapminder)
str(gapminder)
gapminder <- within(gapminder, TotalGDP <- gdpPercap * pop)
str(gapminder)

## ----tidy=FALSE----------------------------------------------------------
gapminder <- within(gapminder, {TotalGDP <- gdpPercap * pop
    lifeExpMonths <- lifeExp * 12})
str(gapminder)

## ------------------------------------------------------------------------
str(gapminder)
gapminder <- gapminder[1:6]
str(gapminder)

## ------------------------------------------------------------------------
a <- data.frame(x = 1:3, y = c("dog", "cat", "pig"), 
                z = seq(from = 1, to = 2, length = 3))
a
a <- a[1]
a 
a <- data.frame(x = 1:3, y = c("dog", "cat", "pig"), 
                z = seq(from = 1, to = 2, length = 3))
a 
a <- a[,1]
a

## ------------------------------------------------------------------------
rm(gapminder)
library(gapminder)
gapminder$lifeExp[1:5]
gapminder$lifeExp <- gapminder$lifeExp * 12
gapminder$lifeExp[1:5]
rm(gapminder)
library(gapminder)
gapminder$lifeExp[1:5]
gapminder <- within(gapminder, lifeExp <- lifeExp * 12)
gapminder$lifeExp[1:5]

## ----tidy=FALSE----------------------------------------------------------
u.weather <- "http://blue.for.msu.edu/FOR875/data/WeatherKLAN2014Full.csv"
WeatherKLAN2014Full <- read.csv(u.weather, header=TRUE, 
                                stringsAsFactors = FALSE,
                                na.string = "")
names(WeatherKLAN2014Full)

## ------------------------------------------------------------------------
WeatherKLAN2014Full <- WeatherKLAN2014Full[c(1,17, 18, 19, 2:16, 20:23)]
names(WeatherKLAN2014Full)

## ----echo = F------------------------------------------------------------
yearlyIncomeWide <- data.frame(name = c("John Smith", "Jane Doe", "Albert Jones"), income1990 = c(29784, 56789, 2341), income2000 = c(39210, 89321, 34567), income2010 = c(41213, 109321, 56781))
library(tidyr)
yearlyIncomeLong <- gather(yearlyIncomeWide, year, income, income1990:income2010)

## ------------------------------------------------------------------------
yearlyIncomeWide

## ------------------------------------------------------------------------
yearlyIncomeLong

## ------------------------------------------------------------------------
u.rel <- "http://blue.for.msu.edu/FOR875/data/religion2.csv"
religion <- read.csv(u.rel, header=TRUE, stringsAsFactors = FALSE)
head(religion)

## ----tidy=FALSE----------------------------------------------------------
library(tidyr)
religionLong <- gather(data = religion, key = IncomeLevel, 
                       value = Frequency, 2:11)
head(religionLong)
tail(religionLong)

## ----tidy=FALSE----------------------------------------------------------
religionLong <- gather(data = religion, key = IncomeLevel, 
                       value = Frequency, -religion)
head(religionLong)

## ------------------------------------------------------------------------
religionWide <- spread(data = religionLong, key = IncomeLevel, 
                       value = Frequency)
head(religionWide)

## ----tidy=FALSE----------------------------------------------------------
firstLast <- separate(data = yearlyIncomeLong, col = name, 
                      into = c("first", "last"), sep="\\s")
print(firstLast)

## ------------------------------------------------------------------------
unite(firstLast, col=name, first, last, sep="_")

## ------------------------------------------------------------------------
library(dplyr)
head(religionWide)
religionWide[,1]
religionWideTbl <- tbl_df(religionWide)
head(religionWideTbl)
religionWideTbl[,1]

## ------------------------------------------------------------------------
u.gm <- "http://blue.for.msu.edu/FOR875/data/gapminder.tsv"
gm <- read.delim(u.gm)
gm <- tbl_df(gm)
str(gm)
head(gm)

## ----echo = FALSE--------------------------------------------------------
options(scipen = 100)

## ------------------------------------------------------------------------
filter(gm, country == "Brazil")
filter(gm, country %in% c("Brazil", "Mexico"))
filter(gm, country %in% c("Brazil", "Mexico") & year %in% c(1952, 1972))
filter(gm, pop > 300000000)
filter(gm, pop > 300000000 & year == 2007)

## ------------------------------------------------------------------------
select(gm, country, year, lifeExp)
select(gm, 2:4)
select(gm, -c(2,3,4))
select(gm, starts_with("c"))

## ------------------------------------------------------------------------
select(filter(gm, continent %in% c("Asia", "Europe")), country, year, pop)

## ------------------------------------------------------------------------
gm %>% filter(continent %in% c("Asia", "Europe")) %>% select(country, year, pop)

## ------------------------------------------------------------------------
head(gm, 15)

## ------------------------------------------------------------------------
gm %>% arrange(year, country)

## ------------------------------------------------------------------------
gm %>% filter(country == "Rwanda") %>% arrange(lifeExp)

## ------------------------------------------------------------------------
gm %>% filter(country == "Rwanda") %>% arrange(desc(lifeExp))

## ------------------------------------------------------------------------
gm %>% filter(country == "Rwanda") %>% select(year, lifeExp) %>% arrange(desc(lifeExp)) 

## ------------------------------------------------------------------------
gm <- rename(gm, population = pop)
head(gm)

## ------------------------------------------------------------------------
summarize(gm, meanpop = mean(population), medpop = median(population))
##or
gm %>% summarize(meanpop = mean(population), 
                 medpop = median(population))

## ------------------------------------------------------------------------
median(gm$lifeExp[gm$continent == "Africa"])
median(gm$lifeExp[gm$continent == "Asia"])
median(gm$lifeExp[gm$continent == "Europe"])
median(gm$lifeExp[gm$continent == "Americas"])
median(gm$lifeExp[gm$continent == "Oceania"])

## ------------------------------------------------------------------------
gm %>% group_by(continent) %>% summarize(medLifeExp = median(lifeExp)) 

## ----tidy=FALSE----------------------------------------------------------
gm %>% group_by(continent) %>% 
    summarize(medLifeExp = median(lifeExp)) %>% 
    arrange(medLifeExp)

## ----tidy=FALSE----------------------------------------------------------
gm %>% group_by(continent) %>% summarize(numObs = n())
gm %>%
  group_by(continent) %>%
  summarize(n_obs = n(), n_countries = n_distinct(country))

## ----tidy=FALSE----------------------------------------------------------
gm %>%
  filter(continent == "Africa") %>%
  group_by(year) %>%
  summarize(min_lifeExp = min(lifeExp), max_lifeExp = max(lifeExp))

## ----tidy=FALSE----------------------------------------------------------
gm %>% select(country, continent, year, lifeExp) %>% 
    group_by(year) %>% arrange(year) %>% 
    filter(rank(lifeExp) == 1)

## ------------------------------------------------------------------------
desc(1:5)
desc(c(2,3,1,5,6,-4))
desc(c("a", "c", "b", "w", "e"))

## ----tidy=FALSE----------------------------------------------------------
gm %>% select(country, continent, year, lifeExp) %>% 
    group_by(year) %>% arrange(year) %>% 
    filter(rank(lifeExp) == 1 | rank(desc(lifeExp)) == 1) %>% 
    print(n=24)

## ------------------------------------------------------------------------
gm %>% group_by(country) %>% 
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(population, gdpPercap))

## ------------------------------------------------------------------------
gm %>% group_by(country) %>% 
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(population, gdpPercap)) %>% 
  summarize(largestDropLifeExp = min(changeLifeExp))

## ------------------------------------------------------------------------
gm %>% group_by(country) %>% 
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(population, gdpPercap)) %>% 
  summarize(largestDropLifeExp = min(changeLifeExp, na.rm = TRUE))

## ------------------------------------------------------------------------
gm %>% group_by(country) %>% 
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(population, gdpPercap)) %>% 
  arrange(changeLifeExp)

## ------------------------------------------------------------------------
gm %>% group_by(country) %>% 
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(population, gdpPercap)) %>% 
  ungroup() %>% 
  arrange(changeLifeExp) %>% 
  print(n=20)


## ----chapter7, child='07-functionsAndProgramming/07-functionsAndProgramming.Rnw'----

## ------------------------------------------------------------------------
u.corn = "http://blue.for.msu.edu/FOR875/data/corn.csv"
corn = read.csv(u.corn, header=TRUE)
corn

## ------------------------------------------------------------------------
dbar <- mean(corn$kiln_dried - corn$regular)
n <- length(corn$regular)
S_d <- sd(corn$kiln_dried - corn$regular)
t_obs <- dbar/(S_d/sqrt(n))
t_obs

pval <- 2*(1 - pt(abs(t_obs), n-1))
pval

margin <- qt(0.975, n-1)*(S_d/sqrt(n))
lcl <- dbar - margin
ucl <- dbar + margin
lcl
ucl

## ------------------------------------------------------------------------
paired_t <- function(x1, x2){
    n <- length(x1)
    dbar <- mean(x1 - x2)
    s_d <- sd(x1 - x2)
    tstat <- dbar/(s_d/sqrt(n))
    pval <- 2*(1 - pt(abs(tstat), n-1))
    margin <- qt(0.975, n-1)*s_d/sqrt(n)
    lcl <- dbar - margin
    ucl <- dbar + margin
    return(list(tstat = tstat, pval = pval, lcl=lcl, ucl=ucl))
}

## ------------------------------------------------------------------------
paired_t(x1 = corn$kiln_dried, x2 = corn$regular)

## ------------------------------------------------------------------------
paired_t <- function(x1, x2, cl = 0.95){
    n <- length(x1)
    dbar <- mean(x1 - x2)
    s_d <- sd(x1 - x2)
    tstat <- dbar/(s_d/sqrt(n))
    pval <- 2*(1 - pt(abs(tstat), n-1))
    pctile <- 1 - (1 - cl)/2
    margin <- qt(pctile, n-1)*s_d/sqrt(n)
    lcl <- dbar - margin
    ucl <- dbar + margin
    return(list(tstat = tstat, pval = pval, lcl = lcl, ucl=ucl))
}

## ------------------------------------------------------------------------
paired_t(corn$kiln_dried, corn$regular)
paired_t(corn$kiln_dried, corn$regular, cl = 0.99)

## ------------------------------------------------------------------------
paired_t(1:5, 1:4)

## ------------------------------------------------------------------------
paired_t <- function(x1, x2, cl = 0.95){
    if(length(x1) != length(x2)){
        stop("The input vectors  must have the same length")
    }
    n <- length(x1)
    dbar <- mean(x1 - x2)
    s_d <- sd(x1 - x2)
    tstat <- dbar/(s_d/sqrt(n))
    pval <- 2*(1 - pt(abs(tstat), n-1))
    pctile <- 1 - (1 - cl)/2
    margin <- qt(pctile, n-1)*s_d/sqrt(n)
    lcl <- dbar - margin
    ucl <- dbar + margin
    return(list(tstat = tstat, pval = pval, lcl = lcl, ucl=ucl))
}
paired_t(1:5, 1:4)

## ------------------------------------------------------------------------
c(FALSE, TRUE, FALSE) || c(TRUE, FALSE, FALSE)
c(FALSE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
c(FALSE, TRUE, FALSE) && c(TRUE, TRUE, FALSE)
c(FALSE, TRUE, FALSE) & c(TRUE, TRUE, FALSE)

## ------------------------------------------------------------------------
paired_t <- function(x1, x2, cl = 0.95){
    if(length(x1) != length(x2)){
        stop("The input vectors  must have the same length")
    }
    if(cl <= 0 || cl >= 1){
        stop("The confidence level must be between 0 and 1")
    }
    n <- length(x1)
    dbar <- mean(x1 - x2)
    s_d <- sd(x1 - x2)
    tstat <- dbar/(s_d/sqrt(n))
    pval <- 2*(1 - pt(abs(tstat), n-1))
    pctile <- 1 - (1 - cl)/2
    margin <- qt(pctile, n-1)*s_d/sqrt(n)
    lcl <- dbar - margin
    ucl <- dbar + margin
    return(list(tstat = tstat, pval = pval, lcl = lcl, ucl=ucl))
}
paired_t(1:5, 2:6, cl=15)

## ------------------------------------------------------------------------
Sign <- function(x){
    if(x < 0){
        print("the number is negative")
    }else if(x > 0){
        print("the number is positive")
    }else{
        print("the number is zero")
    }
}
Sign(3)
Sign(-3)
Sign(0)

## ------------------------------------------------------------------------
paired_t <- function(x1, x2, cl = 0.95, alternative="not.equal"){
    if(length(x1) != length(x2)){
        stop("The input vectors must be of the same length")
        }
    if(cl <= 0 || cl >= 1){
        stop("The confidence level must be between 0 and 1")
        }
    n <- length(x1)
    dbar <- mean(x1 - x2)
    s_d <- sd(x1 - x2)
    tstat <- dbar/(s_d/sqrt(n))
    if(alternative == "not.equal"){
        pval <- 2*(1 - pt(abs(tstat), n-1))
        pctile <- 1 - (1 - cl)/2
        margin <- qt(pctile, n-1)*s_d/sqrt(n)
        lcl <- dbar - margin
        ucl <- dbar + margin
    }else if(alternative == "greater"){
        pval <- 1 - pt(tstat, n-1)
        margin <- qt(cl, n-1)*s_d/sqrt(n)
        lcl <- dbar - margin
        ucl <- Inf
    } else if(alternative == "less"){
        pval <- pt(tstat, n-1)
        margin <- qt(cl, n-1)*s_d/sqrt(n)
        lcl <- -Inf
        ucl <- dbar + margin
    }
    
    return(list(tstat = tstat, pval = pval, lcl=lcl, ucl=ucl))
}
paired_t(corn$kiln_dried, corn$regular)
paired_t(corn$kiln_dried, corn$regular, alternative = "less")
paired_t(corn$kiln_dried, corn$regular, alternative = "greater")

## ------------------------------------------------------------------------
2^-30
2^-30 + (2^30 - 2^30)
(2^-30 + 2^30) - 2^30

## ------------------------------------------------------------------------
1.5 - 1.4
1.5 - 1.4 == 0.1
(1.5 - 1.4) - 0.1

## ------------------------------------------------------------------------
all.equal((1.5 - 1.4), 0.1)

## ------------------------------------------------------------------------
1 == 1+10^-4
1 == 1 + 10^-50

## ------------------------------------------------------------------------
1 == 1+1/2
1 == 1 + 1/2^2
1 == 1 + 1/2^3

## ------------------------------------------------------------------------
k <- 1
repeat{
    if(1 == 1+1/2^k){
        break
    }else{
        k <- k+1
    }
}
k
1/2^(k-1)

## ------------------------------------------------------------------------
k <- 1
while(1 != 1+1/2^k){
    k <- k+1 
}
k
1/2^(k-1)

## ------------------------------------------------------------------------
x <- 1:10
S <- 0
for(i in 1:length(x)){
    S <- S + x[i]
}
S
S = 0
for(value in x){S = S + value}
S

## ------------------------------------------------------------------------
f1 <- function(n){
    x <- numeric(0)
    for(i in 1:n){
        x <- c(x,i)
    }
    x
}

## ------------------------------------------------------------------------
f2 <- function(n){
    x <- numeric(n)
    for(i in 1:n){
        x[i] <- i
    }
    x
}

## ----efficiency1, cache = TRUE-------------------------------------------
n <- 100000
system.time(f1(n))
system.time(f2(n))

## ------------------------------------------------------------------------
system.time(1:n)
n <- 1000000
system.time(1:n)      

## ------------------------------------------------------------------------
test_matrix <- matrix(1:6, byrow=TRUE, nrow=2)
test_matrix
ss1 <- function(M){
    n <- dim(M)[1]
    m <- dim(M)[2]
    out <- rep(0,m)
    for(j in 1:m){
        for(i in 1:n){
            out[j] <- out[j] + M[i,j]^2
        } 
    }
    return(out)
}
ss1(test_matrix)

## ------------------------------------------------------------------------
ss2 <- function(M){
    m <- dim(M)[2]
    out <- numeric(m)
    for(j in 1:m){
        out[j] <- sum(M[,j]^2)
    }
    return(out) 
}
ss2(test_matrix)

## ------------------------------------------------------------------------
ss3 <- function(M){
    out <- colSums(M^2)
    return(out)
}
ss3(test_matrix)

## ----efficiency2, cache=TRUE---------------------------------------------
mm <- matrix(1:10000000, byrow=TRUE, nrow=1000)
system.time(ss1(mm))
system.time(ss2(mm))
system.time(ss3(mm))
rm(mm)

## ------------------------------------------------------------------------
tmp_function <- function(first.arg, second.arg, third.arg, fourth.arg){
    return(c(first.arg, second.arg, third.arg, fourth.arg))
}
tmp_function(34, 15, third.arg = 11, fou = 99)

## ------------------------------------------------------------------------
tmp_function <- function(first.arg, fourth.arg){
    return(c(first.arg, fourth.arg))
}
tmp_function(1, f=2)

## ------------------------------------------------------------------------
sum(1:5)
sum(1:5, c(3,4,90))
sum(1,2,3,c(3,4,90), 1:5)

## ------------------------------------------------------------------------
sum

## ------------------------------------------------------------------------
my.read <- function(file, header=TRUE, sep = ",", skip = 5, ...){
    read.table(file = file, header = header, sep = sep, skip = skip, ...)
}

## ------------------------------------------------------------------------
read.csv

## ------------------------------------------------------------------------
f <- function(a,b){
    print(a^2)
    print(a^3)
    print(a*b)
}
f(a=3, b=2)
f(a=3)

## ------------------------------------------------------------------------
f <- function(a,b = a^3){
    return(a*b)
}
f(2)
f(2,10)


## ----chapter8, child='08-spatialData/08-spatialData.Rnw'-----------------

## ------------------------------------------------------------------------
library(sp)

x <- c(3,2,5,6)
y <- c(2,5,6,7)

coords <- cbind(x, y)

sp.pts <- SpatialPoints(coords)

class(sp.pts)

some.data <- data.frame(var.1 = c("a", "b", "c", "d"), var.2 = 1:4)

sp.pts.df <- SpatialPointsDataFrame(sp.pts, some.data)

class(sp.pts.df)

## ------------------------------------------------------------------------
df <- data.frame(x = c(3,2,5,6), y=c(2,5,6,7), var.1 = c("a", "b", "c", "d"), var.2 = 1:4)
class(df)

#promote to a SpatialPointsDataFrame
coordinates(df) <- ~x+y

class(df)

#access entire data frame
df@data

class(df@data)

#access columns directly
df$var.1

df[,c("var.1","var.2")]

df[,2]

#get the bounding box
bbox(df)

## ----tidy=FALSE----------------------------------------------------------
library(downloader)

download("http://blue.for.msu.edu/FOR875/data/PEF.zip", 
         destfile="./PEF.zip", mode="wb") 

unzip("PEF.zip", exdir = ".")

list.files("PEF")

## ------------------------------------------------------------------------
library(rgdal)
mu <- readOGR("PEF", "MU-bounds")

## ------------------------------------------------------------------------
class(mu)

## ------------------------------------------------------------------------
class(mu@data)
dim(mu@data)
head(mu@data)

## ------------------------------------------------------------------------
proj4string(mu)

## ------------------------------------------------------------------------
mu <- spTransform(mu, CRS("+proj=longlat +datum=WGS84"))
proj4string(mu)

## ------------------------------------------------------------------------
library(ggmap)
mu.f <- fortify(mu, region="mu_id")
head(mu.f)

## ----tidy=FALSE----------------------------------------------------------
mu.bbox <- bbox(mu)

basemap <- get_map(location=mu.bbox, zoom = 14, maptype="satellite")

ggmap(basemap) +
    geom_polygon(data=mu.f, aes(x = long, y = lat, group=group), 
                 fill=NA, size=0.2, color="orange")

## ------------------------------------------------------------------------
plots <- read.csv("PEF/plots.csv", stringsAsFactors=FALSE)
str(plots)

## ----tity=FALSE----------------------------------------------------------
coordinates(plots) <- ~easting+northing

class(plots)

## ----tidy=FALSE----------------------------------------------------------
proj4string(plots)

proj4string(plots) <- CRS("+proj=utm +zone=19 +datum=NAD83 +units=m 
                             +no_defs +ellps=GRS80 +towgs84=0,0,0")                   

## ------------------------------------------------------------------------
plots <- spTransform(plots, CRS("+proj=longlat +datum=WGS84"))

## ----tidy=FALSE----------------------------------------------------------
ggmap(basemap) +
    geom_polygon(data=mu.f, aes(x = long, y = lat, group=group), 
                 fill=NA, size=0.2, color="orange") +
    geom_point(data=as.data.frame(plots), 
               aes(x = easting, y = northing, color=biomass_mg_ha)) + 
    scale_color_gradient(low="white", high="darkblue") +
    labs(color = "Biomass (mg/ha)")

## ----tidy=FALSE----------------------------------------------------------
mu.bio <- plots@data %>% group_by(mu_id) %>% 
    summarize(biomass_mu = mean(biomass_mg_ha))
print(mu.bio)

## ------------------------------------------------------------------------
head(mu.f, n=2)

mu.f <- left_join(mu.f, mu.bio, by = c('id' = 'mu_id'))

head(mu.f, n=2)

## ----tidy=FALSE----------------------------------------------------------
ggmap(basemap) +
    geom_polygon(data=mu.f, aes(x = long, y = lat, 
                                group=group, fill=biomass_mu), 
                 size=0.2, color="orange") +
    scale_fill_gradient(low="white", high="darkblue", 
                        na.value="transparent") +
    labs(fill="Biomass (mg/ha)")

## ----tidy=FALSE----------------------------------------------------------
roads <- readOGR("PEF", "roads")

roads <- spTransform(roads, proj4string(mu))

roads.f <- fortify(roads, region="id")
roads.f <- left_join(roads.f, roads@data, by = c('id' = 'id'))

ggmap(basemap) +
    geom_polygon(data=mu.f, aes(x = long, y = lat, group=group, 
                                fill=biomass_mu), 
                 size=0.2, color="orange") +
    geom_path(data=roads.f, aes(x = long, y = lat, 
                                group=group, color=factor(type))) +
    scale_fill_gradient(low="white", high="darkblue", 
                        na.value="transparent") +
    scale_color_brewer(palette="Dark2") +
    labs(fill="Biomass (mg/ha)", color="Road type", xlab="Longitude", 
         ylab="Latitude", title="PEF forest biomass")

## ----eval=FALSE, tidy=FALSE----------------------------------------------
## library(leaflet)
## 
## m <- leaflet() %>%
##       addTiles() %>%  # Add default OpenStreetMap map tiles
##       addMarkers(lng=-84.482004, lat=42.727516,
##                  popup="<b>Here I am!</b>") # Add a clickable marker
## m  # Print the map

## ----tidy=FALSE, warnings=FALSE------------------------------------------
library(raster)
library(dplyr)

pef.centroid <- as.data.frame(plots) %>% 
    summarize(mu.x = mean(easting), mu.y = mean(northing))

srtm <- getData("SRTM", lon = pef.centroid[1], lat = pef.centroid[2])

class(srtm)

proj4string(srtm)

image(srtm)
plot(plots, add = TRUE)

## ------------------------------------------------------------------------
srtm <- crop(srtm, mu)

image(srtm)
plot(mu, add = TRUE)

## ------------------------------------------------------------------------
min(plots$stems_ha)

plots.10k <- plots[plots$stems_ha > 10000,]

min(plots.10k$stems_ha)     

## ------------------------------------------------------------------------
plots$diameter_in <- plots$diameter_cm/2.54

head(plots)

## ------------------------------------------------------------------------
mu.10k <- mu[plots.10k,]## A[B,]

mu.10k.f <- fortify(mu.10k, region="mu_id")

ggmap(basemap) +
    geom_polygon(data=mu.10k.f, aes(x = long, y = lat, group=group), fill="transparent", size=0.2, color="orange") +
    geom_point(data=as.data.frame(plots.10k), aes(x = easting, y = northing), color="white")

## ------------------------------------------------------------------------
mu.10k <- mu[mu$mu_id %in% unique(over(plots.10k, mu)$mu_id),]

## ------------------------------------------------------------------------
i <- over(plots.10k, mu)
ii <- i$mu_id
iii <- unique(ii)
iv <- mu$mu_id %in% iii
v <- mu[iv,]

## ----tidy=FALSE, warnings=FALSE------------------------------------------
hikes <- roads[roads$type %in% c("Trail", "Winter", "Gravel"),]
 
hikes.pts <- as(hikes, "SpatialPointsDataFrame")
srtm.sp <- as(srtm, "SpatialPixelsDataFrame")

hikes.pts$srtm <- over(hikes.pts, srtm.sp)

basemap <- get_map(location=mu.bbox,  zoom = 14, maptype="terrain")

ggmap(basemap) +
    geom_point(data=as.data.frame(hikes.pts), 
               aes(x = coords.x1, y = coords.x2, color=srtm)) + 
    scale_color_gradient(low="green", high="red") +
    labs(color = "Hiking trail elevation\n(m above sea level)", 
         xlab="Longitude", ylab="Latitude")

## ----warning=FALSE-------------------------------------------------------
mu.ag <- aggregate(plots[,c("mu_id","biomass_mg_ha")], by=mu, FUN=mean)

head(mu.ag@data, n=2)

## ------------------------------------------------------------------------
mu.ag$id <- row.names(mu.ag)

mu.ag.f <- fortify(mu.ag)

mu.ag.f <- left_join(mu.ag.f, mu.ag@data)

ggmap(basemap) +
    geom_polygon(data=mu.ag.f, aes(x = long, y = lat, 
                                group=group, fill=biomass_mg_ha), 
                 size=0.2, color="orange") +
    scale_fill_gradient(low="white", high="darkblue", 
                        na.value="transparent") +
    labs(fill="Biomass (mg/ha)")

## ----tidy=FALSE----------------------------------------------------------
mu.srtm <- aggregate(srtm.sp, by=mu,
                     FUN=function(x){sqrt(var(x))})

mu.srtm$id <- row.names(mu.srtm)

mu.srtm.f <- fortify(mu.srtm)

mu.srtm.f <- left_join(mu.srtm.f, mu.srtm@data)

ggmap(basemap) +
    geom_polygon(data=mu.srtm.f, aes(x = long, y = lat, group=group, 
                                     fill=srtm_23_04), 
                 size=0.2, color="orange") +
    scale_fill_gradient(low="green", high="red") +
        labs(fill = "Elevation standard deviation\n(m above sea level)", 
         xlab="Longitude", ylab="Latitude")


## ----chapter9, child='09-shiny/09-shiny.Rnw'-----------------------------

## ----eval=FALSE,prompt=FALSE---------------------------------------------
## library(shiny)
## runExample("01_hello")

## ----prompt=FALSE, tity=TRUE---------------------------------------------
library(downloader)

download("http://blue.for.msu.edu/FOR875/data/shiny_chapter_code.zip", 
         destfile="./shiny_chapter_code.zip", mode="wb")

unzip("shiny_chapter_code.zip", exdir = ".")

## ----prompt=FALSE, tity=TRUE---------------------------------------------
namesDF <- read.csv("http://blue.for.msu.edu/FOR875/data/name_list.csv", 
                    stringsAsFactors = FALSE)
str(namesDF)

## ----prompt=FALSE,eval=FALSE---------------------------------------------
## # app.R version 1
## 
## library(shiny)
## 
## names.df <- read.csv("http://blue.for.msu.edu/FOR875/data/name_list.csv")
## 
## # Define UI
## ui <- fluidPage(
## 
##   titlePanel("Random Names Analysis"),
## 
##   sidebarLayout(
## 
##     sidebarPanel("our inputs will be here"),
## 
##     mainPanel("our output will appear here")
##   )
## )
## 
## # Define server logic
## server <- function(input, output) {}
## 
## # Create Shiny app
## shinyApp(ui = ui, server = server)
## 

## ----prompt=FALSE,eval=F-------------------------------------------------
## # app.R version 2
## 
## library(shiny)
## 
## names.df <- read.csv("http://blue.for.msu.edu/FOR875/data/name_list.csv")
## 
## # Define UI
## ui <- fluidPage(
##   titlePanel("Random Names Age Analysis"),
##   sidebarLayout(
##     sidebarPanel(
##       # Dropdown selection for Male/Female
##       selectInput(inputId = "sexInput", label = "Sex:",
##                   choices = c("Female" = "F",
##                               "Male" = "M",
##                               "Both" = "B"))
##     ),
##     mainPanel("our output will appear here")
##   )
## )
## 
## # Define server logic
## server <- function(input, output) {}
## 
## # Create Shiny app
## shinyApp(ui = ui, server = server)
## 

## ----prompt=FALSE,eval=FALSE---------------------------------------------
## # app.R version 3
## 
## library(shiny)
## 
## names.df <- read.csv("http://blue.for.msu.edu/FOR875/data/name_list.csv")
## 
## # Define UI
## ui <- fluidPage(
##   titlePanel("Random Names Age Analysis"),
##   sidebarLayout(
##     sidebarPanel(
##       # Dropdown selection for Male/Female
##       selectInput(inputId = "sexInput", label = "Sex:",
##                   choices = c("Female" = "F",
##                               "Male" = "M",
##                               "Both" = "B"))
##     ),
##     mainPanel("our output will appear here")
##   )
## )
## 
## # Define server logic
## server <- function(input, output) {
## 
##   output$histogram <- renderPlot({
## 
##     if(input$sexInput != "B"){
##       subset.names.df <- subset(names.df, Sex == input$sexInput)
##     } else {
##       subset.names.df <- names.df
##     }
## 
##     ages <- subset.names.df$Age
## 
##     # draw the histogram with the specified 20 bins
##     hist(ages, col = 'darkgray', border = 'white')
##   })
## 
## }
## 
## # Create Shiny app
## shinyApp(ui = ui, server = server)
## 

## ----prompt=FALSE,eval=F-------------------------------------------------
## # app.R version 4
## 
## library(shiny)
## 
## names.df <- read.csv("http://blue.for.msu.edu/FOR875/data/name_list.csv")
## 
## # Define UI
## ui <- fluidPage(
##   titlePanel("Random Names Age Analysis"),
##   sidebarLayout(
##     sidebarPanel(
##       # Dropdown selection for Male/Female
##       selectInput(inputId = "sexInput", label = "Sex:",
##                   choices = c("Female" = "F",
##                               "Male" = "M",
##                               "Both" = "B"))
##     ),
##     mainPanel(plotOutput("histogram"))
##   )
## )
## 
## # Define server logic
## server <- function(input, output) {
## 
##   output$histogram <- renderPlot({
## 
##     if(input$sexInput != "B"){
##       subset.names.df <- subset(names.df, Sex == input$sexInput)
##     } else {
##       subset.names.df <- names.df
##     }
## 
##     ages <- subset.names.df$Age
## 
##     # draw the histogram with the specified 20 bins
##     hist(ages, col = 'darkgray', border = 'white')
##   })
## 
## }
## 
## # Create Shiny app
## shinyApp(ui = ui, server = server)
## 

## ----tidy=TRUE-----------------------------------------------------------
u <- "http://blue.for.msu.edu/FOR875/data/Michigan_State_Park_Campgrounds.csv"
sites <- read.csv(u, stringsAsFactors = F)
str(sites)

## ----eval=FALSE,prompt=FALSE, tidy = FALSE-------------------------------
## sites1 <- subset(sites,
##                   TOTAL_SITE >= input$rangeNum[1] &
##                   TOTAL_SITE <= input$rangeNum[2] &
##                   Camp_type == input$type &
##                   if(input$ada){ ADA_SITES > 0 } else {ADA_SITES >= 0}
##                 )

## ----eval=FALSE,prompt=FALSE---------------------------------------------
## # renderLeaflet function from app.R
## 
## output$plot1 <- renderLeaflet({
##     # create a subset of campsites based on inputs
##     sites1 <- subset(sites,
##                     TOTAL_SITE >= input$rangeNum[1] &
##                       TOTAL_SITE <= input$rangeNum[2] &
##                       Camp_type == input$type &
##                       if(input$ada){ ADA_SITES > 0 } else {ADA_SITES >= 0})
## 
##     if(nrow(sites1) > 0){
##       leaflet(sites1) %>% addTiles()  %>%
##         addCircleMarkers(lng = ~Long, lat = ~Lat,
##                          radius = 5,
##                          color = "red",
##                          label = mapply(function(x,y) {
##                            HTML(sprintf('<em>%s</em><br>%s site(s)',
##                                         htmlEscape(x),
##                                         htmlEscape(y)))},
##                            sites1$FACILITY, sites1$TOTAL_SITE
##                            )
##                          )
##     } else {
##         leaflet() %>% addTiles() %>%
##         setView( -84.5555, 42.7325,   zoom = 7)
##     }
## 
##   })


## ----chapter10, child='10-classification/10-classification.Rnw'----------

## ----tidy = FALSE--------------------------------------------------------
library(ggplot2)
logistic <- function(x){exp(x)/(1 + exp(x))}
ggplot(data.frame(x = c(-6, 6)), aes(x)) +
  stat_function(fun = logistic)

## ----message = FALSE-----------------------------------------------------
library(MASS)
head(Pima.tr)

## ------------------------------------------------------------------------
Pima.tr$diabetes <- rep(0, dim(Pima.tr)[1])
Pima.tr$diabetes[Pima.tr$type == "Yes"] <- 1
head(Pima.tr)

## ------------------------------------------------------------------------
diabetes.lr1 <- glm(diabetes ~ glu, data = Pima.tr, family = binomial)
diabetes.lr1
summary(diabetes.lr1)
beta0.lr.1 <- coef(diabetes.lr1)[1]
beta1.lr.1 <- coef(diabetes.lr1)[2]
beta0.lr.1
beta1.lr.1

## ------------------------------------------------------------------------
exp(-5.504 + 0.038*150)/(1 + exp(-5.504 + 0.038*150))

## ----tidy = FALSE--------------------------------------------------------
diabetes.logistic.1 <- function(x){
  exp(beta0.lr.1+ beta1.lr.1*x)/(1 + exp(beta0.lr.1+ 
                                           beta1.lr.1*x))
}
ggplot(Pima.tr, aes(x = glu, y = diabetes)) + 
  stat_function(fun = diabetes.logistic.1) + geom_point()

## ----tidy = FALSE--------------------------------------------------------
ggplot(Pima.tr, aes(x = glu, y = diabetes)) + 
  geom_point() + 
  stat_smooth(method = "glm", 
              method.args = list(family = "binomial"), se = FALSE)

## ------------------------------------------------------------------------
head(Pima.te)
diabetes.probs.1 <- predict(diabetes.lr1, Pima.te, type = "response")
head(diabetes.probs.1)

## ----tidy = FALSE--------------------------------------------------------
diabetes.predict.1 <- rep("No", dim(Pima.te)[1])
diabetes.predict.1[diabetes.probs.1 > 0.5] <- "Yes"
head(diabetes.predict.1)
table(diabetes.predict.1, Pima.te$type)
length(diabetes.predict.1[diabetes.predict.1 == Pima.te$type])/
  dim(Pima.te)[1]


## ------------------------------------------------------------------------
diabetes.lr2 <- glm(diabetes ~ glu + bmi, 
                    data = Pima.tr, family = binomial)
diabetes.lr2
summary(diabetes.lr2)

## ------------------------------------------------------------------------
diabetes.probs.2 <- predict(diabetes.lr2, Pima.te, type = "response")
head(diabetes.probs.2)
diabetes.predict.2 <- rep("No", dim(Pima.te)[1])
diabetes.predict.2[diabetes.probs.2 > 0.5] <- "Yes"
head(diabetes.predict.2)
table(diabetes.predict.2, Pima.te$type)
length(diabetes.predict.2[diabetes.predict.2 == Pima.te$type])/
  dim(Pima.te)[1]

## ----tidy = FALSE--------------------------------------------------------
lr.int <- -coef(diabetes.lr2)[1]/coef(diabetes.lr2)[3]
lr.slope <- -coef(diabetes.lr2)[2]/coef(diabetes.lr2)[3]
ggplot(Pima.tr, aes(x = glu, y = bmi)) + 
  geom_point(aes(color = type)) + 
  geom_abline(intercept = lr.int, slope = lr.slope)

## ----tidy = FALSE--------------------------------------------------------
data(iris)
head(iris)
str(iris)
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point(aes(color = Species))
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point(aes(color = Species))

## ------------------------------------------------------------------------
set.seed(321)
selected <- sample(1:150, replace = FALSE, size = 75)
iris.train <- iris[selected,]
iris.test <- iris[-selected,]

## ----warning = FALSE, tidy = FALSE, message = FALSE----------------------
library(VGAM)
iris.lr <- vglm(Species ~ Petal.Width + Petal.Length, 
                data = iris.train, family = multinomial)
summary(iris.lr)

## ------------------------------------------------------------------------
iris.probs <- predict(iris.lr, iris.test[,c(3,4)], type="response")
head(iris.probs)

## ------------------------------------------------------------------------
which.max(c(2,3,1,5,8,3))
which.max(c(2,20,4,5,9,1,0))
class.predictions <- apply(iris.probs, 1, which.max)
head(class.predictions)
class.predictions[class.predictions == 1] <- levels(iris$Species)[1]
class.predictions[class.predictions == 2] <- levels(iris$Species)[2]
class.predictions[class.predictions == 3] <- levels(iris$Species)[3]
head(class.predictions)

## ------------------------------------------------------------------------
table(class.predictions, iris.test$Species)

## ----tidy = FALSE--------------------------------------------------------
u.knn <- "http://blue.for.msu.edu/FOR875/data/knnExample.csv"
knnExample <- read.csv(u.knn, header=TRUE)
str(knnExample)
ggplot(data = knnExample, aes(x = x1, y = x2)) + 
   geom_point(aes(color = as.factor(class))) +
   theme_bw()

## ------------------------------------------------------------------------
expand.grid(x = c(1,2), y = c(5,3.4,2))
min(knnExample$x1)
max(knnExample$x1)
min(knnExample$x2)
max(knnExample$x2)
x.test <- expand.grid(x1 = seq(-2.6, 4.2, by=0.1), x2 = seq(-2, 2.9, by=0.1))

## ------------------------------------------------------------------------
library(class)
Example_knn <- knn(knnExample[,c(1,2)], x.test, knnExample[,3], k = 15, prob = TRUE)
prob <- attr(Example_knn, "prob")
head(prob)

## ----tidy = TRUE---------------------------------------------------------
library(dplyr)
df1 <- mutate(x.test, prob = prob, class = 0,  prob_cls = ifelse(Example_knn == class, 1, 0))
str(df1)
df2 <- mutate(x.test, prob = prob, class = 1,  prob_cls = ifelse(Example_knn == class, 1, 0))
bigdf <- bind_rows(df1, df2)

names(knnExample)
ggplot(bigdf) + 
   geom_point(aes(x=x1, y =x2, col=class), data = mutate(x.test, class = Example_knn), size = 0.5) + 
   geom_point(aes(x = x1, y = x2, col = as.factor(class)), size = 4, shape = 1, data = knnExample) + 
   geom_contour(aes(x = x1, y = x2, z = prob_cls, group = as.factor(class), color = as.factor(class)), size = 1, bins = 1, data = bigdf) + theme_bw()

## ----warning=FALSE-------------------------------------------------------
Example_knn <- knn(knnExample[,c(1,2)], x.test, knnExample[,3], k = 1, prob = TRUE)
prob <- attr(Example_knn, "prob")
head(prob)
df1 <- mutate(x.test, prob = prob, class = 0,  prob_cls = ifelse(Example_knn == class, 1, 0))
str(df1)
df2 <- mutate(x.test, prob = prob, class = 1,  prob_cls = ifelse(Example_knn == class, 1, 0))
bigdf <- bind_rows(df1, df2)

ggplot(bigdf) + geom_point(aes(x = x1, y = x2, col = class), data = mutate(x.test, class = Example_knn), size = 0.5) + geom_point(aes(x = x1, y = x2, col = as.factor(class)), size = 4, shape = 1, data = knnExample) + geom_contour(aes(x = x1, y = x2, z = prob_cls, group = as.factor(class), color = as.factor(class)), size = 1, bins = 1, data = bigdf) + theme_bw()

## ------------------------------------------------------------------------
Pima.tr[,1:7] <- scale(Pima.tr[,1:7], center = TRUE, scale = TRUE)
Pima.te[,1:7] <- scale(Pima.te[,1:7], center = TRUE, scale = TRUE)
knn_Pima <- knn(Pima.tr[,c(2,5)], Pima.te[,c(2,5)], Pima.tr[,8], k = 15, prob=TRUE)
table(knn_Pima, Pima.te[,8])

## ------------------------------------------------------------------------
sd(iris.train$Petal.Width)
sd(iris.train$Petal.Length) 
head(iris.train)
knn_iris <- knn(iris.train[,c(3,4)], iris.test[,c(3,4)], iris.train[,5], k=1, prob=TRUE)
table(knn_iris, iris.test[,5])
knn_iris <- knn(iris.train[,c(3,4)], iris.test[,c(3,4)], iris.train[,5], k=3, prob=TRUE)
table(knn_iris, iris.test[,5])
knn_iris <- knn(iris.train[,c(3,4)], iris.test[,c(3,4)], iris.train[,5], k=15, prob=TRUE)
table(knn_iris, iris.test[,5])


## ----chapter11, child='11-textData/11-textData.Rnw'----------------------

## ----echo = FALSE, message = FALSE---------------------------------------
library(ggplot2)

## ----ReadEmail, cache = TRUE---------------------------------------------
u.email <- "http://blue.for.msu.edu/FOR875/data/email1.txt"
email1 <- scan(u.email, what = "character", sep = "")
length(email1)
email1[1:10]
email1 <- scan(u.email, what = "character", sep = "\n")
length(email1)
email1[1:10]

## ----ReadMobyDick, cache=TRUE--------------------------------------------
u.moby <- "http://blue.for.msu.edu/FOR875/data/mobydick.txt"
moby_dick <- scan(u.moby, what = "character", sep = "\n")
moby_dick[1:25]

## ------------------------------------------------------------------------
moby_dick <- moby_dick[408:18576]
length(moby_dick)
moby_dick[1:4]
moby_dick[18165:18169]

## ------------------------------------------------------------------------
paste("Homer Simpson", "is", "Bart Simpson's", "father")
n <- 10
paste("The value of n is", n)
paste(c("pig", "dog"), 3)

## ------------------------------------------------------------------------
paste("mail", "google", "com", sep=".")
paste("and", "or", sep = "/")
paste(c("dog", "cat", "horse", "human", "elephant"), "food")

## ------------------------------------------------------------------------
paste(c("one", "two", "three", "four", "five"), 
      c("six", "seven", "eight", "nine", "ten"))
paste(c("one", "two", "three", "four", "five"), 
      c("six", "seven", "eight", "nine", "ten"), collapse = ".")
paste(c("one", "two", "three", "four", "five"),  
      c("six", "seven", "eight", "nine", "ten"), collapse = "&&")
paste(c("one", "two", "three", "four", "five"),
      c("six", "seven", "eight", "nine", "ten"), collapse = " ")

## ------------------------------------------------------------------------
paste(c("a", "b"), 1:10, sep = "")
paste(c("a", "b"), 1:9, sep = "")

## ----cointoss------------------------------------------------------------
coin_toss <- function(n=10, iter = 500){
  require(ggplot2)
  df <- data.frame(numheads = numeric(iter))
  for(i in 1:iter) {
    df$numheads[i] <- rbinom(1, n, 0.5)
    if(i <= 5) {
      print(paste("The number of HEADS out of", n, "tosses is", df$numheads[i]))}
  }
ggplot(data = df, aes(x = numheads)) + 
  geom_histogram(binwidth = 1) + 
  ggtitle(paste("Number of HEADS in", n, "tosses"))
}
coin_toss()
coin_toss(n = 25, iter=1000)

## ------------------------------------------------------------------------
small_novel <- c("First line", "Second somewhat longer line", 
                 "third line.")
small_novel
small_novel <- paste(small_novel, collapse=" ")
length(small_novel)
small_novel

## ------------------------------------------------------------------------
moby_dick <- paste(moby_dick, collapse = " ")
length(moby_dick)

## ------------------------------------------------------------------------
x <- "aBCdefG12#"
y <- x
tolower(x)
toupper(y)

## ------------------------------------------------------------------------
moby_dick <- tolower(moby_dick)

## ------------------------------------------------------------------------
nchar("dog")
nchar(c("dog", "cat", "horse", "elephant"))
nchar(c("dog", "cat", "horse", "elephant", NA, "goat"))
nchar(c("dog", "cat", "horse", "elephant", NA, "goat"), keepNA = FALSE)
nchar(moby_dick)

## ------------------------------------------------------------------------
strsplit(c("mail.msu.edu", "mail.google.com", "www.amazon.com"),
         split = ".", fixed = TRUE)
unlist(strsplit(c("mail.msu.edu", "mail.google.com", "www.amazon.com"),
                split = ".", fixed = TRUE))
unlist(strsplit(c("dog", "cat", "pig", "horse"), 
                split = "o", fixed = TRUE))

## ------------------------------------------------------------------------
unlist(strsplit(c("dog", "cat", "pig", "horse", "rabbit"), 
                split = "[aeiou]"))

## ------------------------------------------------------------------------
unlist(strsplit(c("dog", "cat", "pig", "horse", "rabbit"), 
                split = "[aorb]"))

## ------------------------------------------------------------------------
unlist(strsplit(c("a1c2b", "bbb2bc3f"), split = "[1-9]"))

## ------------------------------------------------------------------------
unlist(strsplit(c("aBc1fGh", "1TyzaaG"), split = "[^a-z]"))

## ------------------------------------------------------------------------
unlist(strsplit(c("the rain", "in Spain stays mainly", "in", "the plain"), 
                split = "[^0-9A-Za-z]"))
unlist(strsplit(c("the rain", "in Spain stays mainly", "in", "the plain"), 
                split =" ", fixed = TRUE))

## ------------------------------------------------------------------------
moby_dick <- unlist(strsplit(moby_dick, split = "[^0-9A-Za-z]"))

## ------------------------------------------------------------------------
moby_dick[1:50]

## ------------------------------------------------------------------------
unlist(strsplit(c("the rain", "in Spain    stays mainly", "in", "the plain"), split = "[^0-9A-Za-z]"))

## ------------------------------------------------------------------------
length(moby_dick)
not.blanks <- which(moby_dick != "")
moby_dick <- moby_dick[not.blanks]
length(moby_dick)
moby_dick[1:50]

## ------------------------------------------------------------------------
moby_dick_nchar <- nchar(moby_dick)
moby_dick_nchar[1:50]
max(moby_dick_nchar)
ggplot(data = data.frame(nwords = moby_dick_nchar), aes(x = nwords)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "white") + 
  ggtitle("Number of letters in words in Moby Dick") + 
  theme_bw()

## ----echo = FALSE, eval = FALSE------------------------------------------
## ##There are a lot of numeric "words" in the vector
## ##Do we really want these in the file?
## md <- sort(moby_dick)
## md[1:1000]

## ------------------------------------------------------------------------
moby_dick_word_table <- table(moby_dick)
moby_dick_word_table <- sort(moby_dick_word_table, decreasing = TRUE)
moby_dick_word_table[1:50]

## ------------------------------------------------------------------------
x <- "Michigan"
substr(x, 3, 4)
substr(x, 3, 4) <- "CH"
x
x <- c("Ohio", "Michigan", "Illinois", "Wisconsin")
substr(x, 2,4)
substr(x, 2, 4) <- "$#&"
x

## ------------------------------------------------------------------------
strtrim("Michigan", 1)
strtrim("Michigan", 4)
strtrim("Michigan", 100)
strtrim(c("Ohio", "Michigan", "Illinois", "Wisconsin"), 3)
strtrim(c("Ohio", "Michigan", "Illinois", "Wisconsin"), c(3, 4, 5, 6))

## ------------------------------------------------------------------------
grep("a", c("the rain", "in Spain    stays mainly", "in", "the plain"), 
     fixed = TRUE)
grep("a", c("the rain", "in Spain    stays mainly", "in", "the plain"), 
     fixed = TRUE, value = TRUE)
grepl("a", c("the rain", "in Spain    stays mainly", "in", "the plain"), 
      fixed = TRUE)

## ------------------------------------------------------------------------
gsub("a", "?", c("the rain", "in Spain    stays mainly", "in", 
                 "the plain"), fixed = TRUE)
sub("a", "?", c("the rain", "in Spain    stays mainly", "in", 
                "the plain"), fixed = TRUE)
gsub("a", "???", c("the rain", "in Spain    stays mainly", "in", 
                   "the plain"), fixed = TRUE)
sub("a", "???", c("the rain", "in Spain    stays mainly", "in", 
                  "the plain"), fixed = TRUE)


## ----chapter12, child='12-rcpp/12-rcpp.Rnw'------------------------------

## ----eval=FALSE----------------------------------------------------------
## install.packages(c('Rcpp','microbenchmark'))

## ----eval=FALSE----------------------------------------------------------
## library(Rcpp)
## sourceCpp("hello.cpp")
## hello()

## ----echo=FALSE----------------------------------------------------------
print("Hello World!")

## ----prompt=FALSE--------------------------------------------------------
library(Rcpp)

cppFunction("int add(int x, int y, int z){
  int sum = x + y + z;
  return sum;
}")

add(1, 2, 4)

a <- add(3, 2, 1)
a

## ----eval=FALSE, prompt=FALSE--------------------------------------------
## one <- function() 1L

## ----eval=FALSE, prompt=FALSE--------------------------------------------
## cppFunction("int one() {
##   return 1;
## }")

## ----eval=FALSE, prompt=FALSE--------------------------------------------
## signR <- function(x) {
##     if (x > 0) {
##         1
##     } else if (x == 0) {
##         0
##     } else {
##         -1
##     }
## }
## 
## cppFunction("int signC(int x) {
##   if (x > 0) {
##     return 1;
##   } else if (x == 0) {
##     return 0;
##   } else {
##     return -1;
##   }
## }")

## ----prompt=FALSE--------------------------------------------------------
sumR <- function(x) {
    total <- 0
    for (i in 1:length(x)) {
        total <- total + x[i]
    }
    total
}

## ----prompt=FALSE--------------------------------------------------------
cppFunction("double sumC(NumericVector x) {
  int n = x.size();
  double total = 0;
  for(int i = 0; i < n; i++) {
    total += x[i];
  }
  return total;
}")

## ----prompt=FALSE--------------------------------------------------------
library(microbenchmark)

x <- runif(1000)
microbenchmark(sum(x), sumC(x), sumR(x))

## ----prompt=FALSE--------------------------------------------------------
pdistR <- function(x, ys) {
    sqrt((x - ys)^2)
}

## ----prompt=FALSE--------------------------------------------------------
cppFunction("NumericVector pdistC(double x, NumericVector ys) {
  int n = ys.size();
  NumericVector out(n);

  for(int i = 0; i < n; i++) {
    out[i] = sqrt(pow(ys[i] - x, 2.0));
  }
  return out;
}")

## ----prompt=FALSE--------------------------------------------------------
cppFunction("NumericVector rowSumsC(NumericMatrix x) {
  int nrow = x.nrow(), ncol = x.ncol();
  NumericVector out(nrow);

  for (int i = 0; i < nrow; i++) {
    double total = 0;
    for (int j = 0; j < ncol; j++) {
      total += x(i, j);
    }
    out[i] = total;
  }
  return out;
}")

x <- matrix(sample(100), 10)

rowSums(x)
rowSumsC(x)


## ----chapter13, child = '13-databases/13-databases.Rnw'------------------

## ----echo = FALSE, message = FALSE, warning = FALSE, results = FALSE-----
#lapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""),detach,character.only=TRUE,unload=TRUE)

## ----message = FALSE, warning = FALSE------------------------------------
library(dplyr)
library(dbplyr)
library(RSQLite)

## ------------------------------------------------------------------------
library(DBI)
chinook <- dbConnect(SQLite(), "13-data/chinook.db")

## ----tidy = TRUE---------------------------------------------------------
src_dbi(chinook)

## ------------------------------------------------------------------------
employees <- tbl(chinook, "employees")
employees

## ----tidy = FALSE--------------------------------------------------------
employees %>% 
  select(LastName, FirstName, Phone, Email) %>% 
  arrange(LastName)
employees %>% 
  filter(Title == "Sales Support Agent") %>% 
  select(LastName, FirstName, Address) %>% 
  arrange(LastName)
employees %>% 
  group_by(ReportsTo) %>% 
  summarize(numberAtLocation = n())

## ----tidy = FALSE--------------------------------------------------------
salesSupportAgents <- employees %>% 
  filter(Title == "Sales Support Agent") %>% 
  select(LastName, FirstName, Address) %>% 
  arrange(LastName) 
salesSupportAgents

## ----tidy = FALSE--------------------------------------------------------
salesSupportAgents <- employees %>% 
  filter(Title == "Sales Support Agent") %>% 
  select(LastName, FirstName, Address) %>% 
  arrange(LastName) %>% 
  collect()
salesSupportAgents

## ----tidy = FALSE--------------------------------------------------------
library(dbplot)
employees %>% 
  dbplot_bar(Title)

## ----tidy = FALSE--------------------------------------------------------
library(ggplot2)
employees %>% 
  dbplot_bar(Title) + 
  labs(title = "Employee Types") + 
  ylab("Count") + 
  theme_classic()

## ----echo = FALSE--------------------------------------------------------
path = "/home/jeffdoser/.httr-oauth"
options(httr_oauth_cache = path)

## ----tidy = FALSE--------------------------------------------------------
library(bigrquery)
library(DBI)
library(dplyr)
billing <- "for875-databases"
con <- dbConnect(
  bigquery(),
  project = "publicdata",
  dataset = "samples",
  billing = billing
)
shakespeare <- con %>%
  tbl("shakespeare")
shakespeare %>% 
  group_by(word) %>% 
  summarise(n = sum(word_count, na.rm = TRUE)) %>% 
  arrange(desc(n)) %>% 
  head(10)

## ----tidy = FALSE--------------------------------------------------------
weather <- con %>% 
  tbl("gsod")
dbListFields(con, "gsod")
weather %>% 
  select(thunder, mean_wind_speed) %>% 
  head(10)

## ----tidy = FALSE--------------------------------------------------------
weather %>% 
  filter(mean_temp > 60 & mean_wind_speed > 10) %>% 
  summarize(count = n())

## ----tidy = FALSE--------------------------------------------------------
weather %>% 
  dbplot_line(year, average_wind_speed = mean(mean_wind_speed, na.rm = TRUE))

## ----tidy = FALSE--------------------------------------------------------
weather %>%
  select(year, mean_wind_speed) %>% 
  filter(year < 1940 & !is.na(mean_wind_speed)) %>% 
  dbplot_histogram(mean_wind_speed)

## ----tidy = FALSE--------------------------------------------------------
weather %>% 
  filter(year < 1940 & !is.na(mean_wind_speed)) %>% 
  group_by(year) %>% 
  summarize(count = n())

## ----tidy = FALSE--------------------------------------------------------
weather %>%
  select(year, mean_wind_speed) %>% 
  filter(year == 1929 & !is.na(mean_wind_speed)) %>% 
  dbplot_histogram(mean_wind_speed)


## ----chapter14, child = '14-signalProcessing/14-signalProcessing.Rnw'----

## ----echo = FALSE, plot = TRUE, fig.width = 4, fig.height = 4------------
x <- seq(0, 2 * pi, .05)
library(ggplot2)
ggplot(mapping = aes(x, sin(x))) +
  geom_line()

## ----echo = FALSE, plot = TRUE, fig.width = 4, fig.height = 4------------
x <- seq(0, 2 * pi, .1)
ggplot(mapping = aes(x, sin(x))) + 
  geom_point()

## ----plot = TRUE, tidy = FALSE-------------------------------------------
x <- seq(0, 2 * pi, .1)
standard <- sin(x)
altered <- 2*sin(3 * (x - 1)) + 4
graphData <- dplyr::data_frame(x, standard, altered)
ggplot(data = graphData, mapping = aes(x = x)) + 
  geom_point(mapping = aes(y = standard, color = "sin(x)")) + 
  geom_point(mapping = aes(y = altered, color = "2*sin(3 * (x - 1)) + 4")) + 
  scale_color_manual("", breaks = c("sin(x)", "2*sin(3 * (x - 1)) + 4"), 
                     values = c("blue", "red")) + 
  labs(x = "x", y ="")

## ----plot = TRUE, height = 4, width = 4, message = FALSE, tidy = FALSE----
library(signal)
t <- seq(0, 1, len = 100)
sig <- sin(2 * pi * t)
ggplot(mapping = aes(t, sig)) + 
  geom_line()

## ----plot = TRUE, height = 4, width = 4, tidy = FALSE--------------------
noisySig <- sin(2 * pi * t) + 0.25 * rnorm(length(t))
ggplot() + 
  geom_line(aes(t, noisySig), color = "red")

## ----plot = TRUE, height = 4, width = 4, tidy = FALSE--------------------
library(dplyr)
butterFilter <- butter(3, 0.1)
recoveredSig <- signal::filter(butterFilter, noisySig)
allSignals <- data_frame(t, sig, noisySig, recoveredSig)
ggplot(allSignals, aes(t)) + 
  geom_line(aes(y = sig, color = "Original")) + 
  geom_line(aes(y = noisySig, color = "Noisy")) + 
  geom_line(aes(y = recoveredSig, color = "Recovered")) + 
  labs(x = "Time", y = "Signal")

## ----plot = TRUE, tidy = FALSE-------------------------------------------
t <- 1:500
cleanSignal <- 50 * sin(t * 4 * pi/length(t))
noise <- 50 * 1/12 * sin(t * 4 * pi/length(t) * 12)
originalSignal <- cleanSignal + noise
ggplot() + 
  geom_line(aes(t, originalSignal))

## ----plot = TRUE, tidy = FALSE-------------------------------------------
lowButter <- butter(2, 1/50, type = "low")
low <- signal::filter(lowButter, originalSignal)

highButter <- butter(2, 1/25, type = "high")
high <- signal::filter(highButter, originalSignal)

signals <- data_frame(originalSignal, low, high)

ggplot(signals, aes(t)) + 
  geom_line(aes(y = originalSignal, color = "Original")) + 
  geom_line(aes(y = low, color = "Signal")) + 
  geom_line(aes(y = high, color = "Noise")) + 
  labs(x = "Time", y = "Signal")


## ----echo = FALSE, results = FALSE, plot = TRUE, message = FALSE---------
library(seewave)
example(ftwindow)

## ----fig = T-------------------------------------------------------------
library(seewave)
data(tico)
spectro(tico)

## ----fig = T-------------------------------------------------------------
spectro(tico, f = 22050, wl = 1024, wn = "bartlett", ovlp = 5)

## ----eval = FALSE--------------------------------------------------------
## library(tuneR)
## play(tico, "aplay")

## ------------------------------------------------------------------------
setwd("/home/jeffdoser/Documents/01-summer2018/01-for875/14-signalProcessing")

## ----warning = FALSE, message = FALSE------------------------------------
library(warbleR)
cedarWax <- quer_xc(qword = "Bombycilla cedrorum",
                    download = FALSE)
names(cedarWax)

## ----fig = TRUE----------------------------------------------------------
xc_maps(X = cedarWax, img = FALSE)

## ------------------------------------------------------------------------
table(cedarWax$Vocalization_type)

## ------------------------------------------------------------------------
newCedarWax <- subset(cedarWax, cedarWax$Recording_ID %in% c(313682, 313683, 313684, 321881, 329907, 361006))
quer_xc(X = newCedarWax)
mp32wav()
system("rm *.mp3")

## ------------------------------------------------------------------------
lspec(ovlp = 10, it = "tiff", rows = 5)

## ------------------------------------------------------------------------
wavs <- list.files(pattern = ".wav", ignore.case = TRUE)
subset <- wavs[2]
autodetec(flist = subset, bp = c(4, 10), threshold = 10, mindur = 0.05, 
          maxdur = 0.5,ssmooth = 800, ls = TRUE, 
          res = 100, flim = c(1, 12), wl = 300, set =TRUE, sxrow = 6, 
          rows = 5, redo = TRUE, it = "jpeg", img =TRUE, smadj = "end")

## ------------------------------------------------------------------------
waxwingSignals <- autodetec(flist = wavs, bp = c(4, 10), threshold = 10, mindur = 0.05, 
          maxdur = 0.5,ssmooth = 800, ls = TRUE, 
          res = 100, flim = c(1, 12), set =TRUE, sxrow = 6, 
          rows = 15, redo = TRUE, it = "tiff", img = FALSE, smadj = "end")
waxwingSignals[is.na(waxwingSignals)] <- 0

## ------------------------------------------------------------------------
params <- specan(waxwingSignals, bp = c(1, 15))
names(params)

## ------------------------------------------------------------------------
params$Recording_ID <- gsub('.*-([0-9]+).*','\\1', params$sound.files)
newCedarWax$Recording_ID <- as.character(newCedarWax$Recording_ID)
finalData <- inner_join(params, newCedarWax)

## ------------------------------------------------------------------------
# Remove the non-numeric variables and then run the pca
pca <- prcomp(x = finalData[, sapply(finalData, is.numeric)], scale. = TRUE)
score <- as.data.frame(pca[[5]])
ID <- as.numeric(finalData$Recording_ID)
ggplot(data = score, mapping = aes(PC1, PC2)) +
  geom_point(aes(color = finalData$Recording_ID, shape = finalData$Country)) 

## ----echo = FALSE--------------------------------------------------------
system("rm *.wav *.tiff *.jpeg")


