#' Function to pull detailed UFO sightings data by date or date range
#' @param year
#' @param month
#' @param year_end
#' @param year_start
#' year and month are required to return UFO sightings data
#' If no values are provided for year_end or year_start, UFO sightings are returned for a single month
#' 
#' Returned dataframe includes Date, City, State, Shape, Duration, Summary, and date Posted
#' 
#' 
UFOobs <- function(year=NA, month=NA, year_end= NA, month_end = NA) {
  if (is.na(year_end) | is.na(month_end)){
    url <- paste0("http://www.nuforc.org/webreports/ndxe", year, month, ".html", sep="")
    resp<-htmltab(url, which=1, encoding = "UTF-8")
    resp$Date<-as.Date(resp$`Date / Time`, format="%m/%d/%y %H:%M")
    resp$Month<-month(resp$Date)
    resp$Year<-year(resp$Date)
    resp<-resp%>%
      select(-Posted, -`Date / Time`)
    return(resp)
    
  } else {
    date_start <- as.Date(paste0(year,"-",month,"-01"))
    date_end <- as.Date(paste0(year_end,"-",month_end,"-01"))
    
    mos<-seq(ymd(date_start),ymd(date_end), by="month")
    months<-data.frame(dates=mos)
    months$y=as.integer(year(months$dates))
    months$m<-ifelse(nchar(as.integer(month(months$dates)))<2, 
                     paste0(0,as.integer(month(months$dates))),as.integer(month(months$dates)))
    mot<-paste0(months$y,months$m)
    
    functest<-function(mot){
      url <- paste0("http://www.nuforc.org/webreports/ndxe", mot, ".html", sep="")
      resp<-htmltab(url, which=1, encoding = "UTF-8")
      return(resp)
    }
    
    output<-do.call(rbind, lapply(mot, functest))
    output$Date<-as.Date(output$`Date / Time`, format="%m/%d/%y %H:%M")
    output$Month<-month(output$Date)
    output$Year<-year(output$Date)
    output<-output%>%
      select(-Posted, -`Date / Time`)
    return(output)
  }
}


