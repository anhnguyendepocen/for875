fertility = WorldBank$fertility.rate[WorldBank$year == 1960]
lifeexp = WorldBank$life.expectancy[WorldBank$year==1960]
pop = WorldBank$population[WorldBank$year==1960]
region = WorldBank$region[WorldBank$year==1960]

plot(lifeexp, fertility, type="n")
symbols(lifeexp, fertility, circles=sqrt(pop/pi), inches=0.35, bg=as.integer(region)+1)

plot(WorldBank$life.expectancy[WorldBank$year==1960], WorldBank$fertility.rate[WorldBank$year==1960], type="n")
symbols(WorldBank$life.expectancy[WorldBank$year==1960], WorldBank$fertility.rate[WorldBank$year==1960], circles=sqrt(WorldBank$population[WorldBank$year==1960]/pi), inches=0.25, bg=as.integer(WorldBank$region))