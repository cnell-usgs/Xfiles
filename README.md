# Xfiles
UFO sightings package

This package provides access to data onUFO sightings from the National UFO Report Center. 

Functions: 
UFOcount():
- Returns the total number of UFO sightings for a given month and year.
- Defaults to returning monthly counts for all years of data.  

Example:

ufos<-UFOcount()
ufos$Date<-as.Date(as.yearmon(as.character(ufos$Date), "%m/%Y"), format="%m/%d/%Y")
ufos$year<-year(ufos$Date)
ufos$month<-month(ufos$Date)
ufos<-ufos%>%filter(ufos$year>=1950)

ggplot(ufos, aes(x=Date, y=UFOs))+geom_point(size=1)+
  theme_minimal()+labs(x="Date", y="Monthly UFO sightings")
