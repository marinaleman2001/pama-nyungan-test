#Read info for feature 19A

data = read_tsv("19A.txt", skip=5)

# Include only Pama-Nyungan data

datapm = data[data$family=="Pama-Nyungan",]

# Australia map information

australia = map_data("world")[map_data("world")$region=="Australia",]

# Final map with Pama-Nyungan data on Australia

ggplot()+
  geom_polygon(data=australia, aes(x=long,y=lat,group=group),fill="grey60")+
  coord_fixed(1.1)+
  geom_point(data=datapm,aes(x=longitude,y=latitude,color=description))+
  geom_text(data=datapm,aes(x=longitude,y=latitude,label=`wals code`),size=2.5,
            position=position_jitter(2.3, seed=1))+
  theme_bw()+
  labs(x="Longitude",y="Latitude",title="WALS feature 19A among Pama-Nyungan languages")+
  theme(plot.title = element_text(hjust = 0.5))