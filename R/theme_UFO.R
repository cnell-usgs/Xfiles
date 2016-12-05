####UFO theme for ggplot2

theme_UFO<-function(base_size = 18, base_family = "Helvetica", legend.location = "right"){
  theme(
    line =               element_line(colour = "green", size = 1, linetype = 1, 
                                      lineend = "round"),
    rect =               element_rect(fill = "white", colour = "white", size = 0.5, linetype = 1),
    text =               element_text(family = base_family, face = "plain", colour = "white",
                                      size = base_size, hjust = 0.5, vjust = 0.5, angle = 0,
                                      lineheight = 0.9, margin=margin(), debug=FALSE),
    axis.text =          element_text(size = rel(0.8), colour = "white"),
    strip.text =         element_text(size = rel(0.8)),
    
    axis.line.x =        element_line(color = "white", size=1),
    axis.line.y =        element_line(color = "white", size=1),
    axis.text.x =        element_text(face = "plain", margin=margin(2,0,0,0)),
    axis.text.y =        element_text(face = "plain", margin=margin(0,2,0,0)),
    axis.ticks =         element_line(colour = "white", size= .6),
    axis.title =         element_text(colour = "white", face = "bold"),
    axis.title.x =       element_text(margin=margin(10,0,0,0)),
    axis.title.y =       element_text(angle = 90, margin=margin(0,10,0,0)),
    axis.ticks.length =  unit(0.15, "cm"),
    
    legend.background =  element_rect(colour = NA),
    legend.key =         element_blank(),
    legend.key.size =    unit(1.2, "lines"),
    legend.key.height =  NULL,
    legend.key.width =   NULL,
    legend.text =        element_text(size = rel(0.8)),
    legend.text.align =  NULL,
    legend.title =       element_text(size = rel(0.8), face = "bold", hjust = 0),
    legend.title.align = NULL,
    legend.position =    legend.location,
    legend.direction =   NULL,
    legend.justification = "center",
    legend.box =         NULL,
    
    panel.background =   element_rect(fill = "black", colour = NA),
    panel.border =       element_blank(),
    panel.grid.major =   element_blank(),
    panel.grid.minor =   element_blank(),
    
    strip.background =   element_rect(fill = "black", size = 0.5),
    strip.text.x =       element_text(),
    strip.text.y =       element_text(angle = -90),
    
    plot.background =    element_rect(colour = "black", fill="black"),
    plot.title =         element_text(size = rel(1.2)),
    plot.margin =        unit(c(1, 1, 1, 1), "lines"),
    
    complete = TRUE
  )
    
}
ggplot(df, aes(x=reorder(State,UFOs), y=UFOs))+geom_point(color="green", shape=8, size=3)+theme_UFO()+
  labs(x="State", y="Total UFO sightings")
