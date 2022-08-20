rm(list=ls())
library(sp)
library(raster)


directory<- "C:\\Users\\vimiv\\OneDrive - AGROSAVIA - CORPORACION COLOMBIANA DE INVESTIGACION AGROPECUARIA\\Documentos\\Texture\\Script"
setwd(paste0(directory))

mod<-"Ensemble" # "MACHISPLIN","landmap","Ensemble","SG"
mod

###load texture factions
##Clay
Clay_0_5<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Clay_0_5.tif"))
Clay_5_15<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Clay_5_15.tif"))
Clay_15_30<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Clay_15_30.tif"))
Clay_30_60<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Clay_30_60.tif"))
Clay_60_100<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Clay_60_100.tif"))

#for landmap, ensemble and SG
proj4string(Clay_0_5) <- CRS(SRS_string = "EPSG:3116")
proj4string(Clay_5_15) <- CRS(SRS_string = "EPSG:3116")
proj4string(Clay_15_30) <- CRS(SRS_string = "EPSG:3116")
proj4string(Clay_30_60) <- CRS(SRS_string = "EPSG:3116")
proj4string(Clay_60_100) <- CRS(SRS_string = "EPSG:3116")

#for MACHISPLIN
#proj4string(Clay_0_5) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Clay_0_5<-projectRaster(Clay_0_5,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Clay_0_5) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Clay_5_15<-projectRaster(Clay_5_15,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Clay_5_15) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Clay_15_30<-projectRaster(Clay_15_30,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Clay_15_30) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Clay_30_60<-projectRaster(Clay_30_60,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Clay_60_100) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Clay_60_100<-projectRaster(Clay_60_100,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models

##Sand
Sand_0_5<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Sand_0_5.tif"))
Sand_5_15<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Sand_5_15.tif"))
Sand_15_30<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Sand_15_30.tif"))
Sand_30_60<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Sand_30_60.tif"))
Sand_60_100<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Sand_60_100.tif"))

#for landmap, ensemble and SG
proj4string(Sand_0_5) <- CRS(SRS_string = "EPSG:3116")
proj4string(Sand_5_15) <- CRS(SRS_string = "EPSG:3116")
proj4string(Sand_15_30) <- CRS(SRS_string = "EPSG:3116")
proj4string(Sand_30_60) <- CRS(SRS_string = "EPSG:3116")
proj4string(Sand_60_100) <- CRS(SRS_string = "EPSG:3116")


#for MACHISPLIN
#proj4string(Sand_0_5) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Sand_0_5<-projectRaster(Sand_0_5,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Sand_0_5) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Sand_5_15<-projectRaster(Sand_5_15,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Sand_5_15) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Sand_15_30<-projectRaster(Sand_15_30,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Sand_15_30) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Sand_30_60<-projectRaster(Sand_30_60,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Sand_60_100) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Sand_60_100<-projectRaster(Sand_60_100,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models

##Silt
Silt_0_5<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Silt_0_5.tif"))
Silt_5_15<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Silt_5_15.tif"))
Silt_15_30<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Silt_15_30.tif"))
Silt_30_60<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Silt_30_60.tif"))
Silt_60_100<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Silt_60_100.tif"))

#for landmap, ensemble and SG
proj4string(Silt_0_5) <- CRS(SRS_string = "EPSG:3116")
proj4string(Silt_5_15) <- CRS(SRS_string = "EPSG:3116")
proj4string(Silt_15_30) <- CRS(SRS_string = "EPSG:3116")
proj4string(Silt_30_60) <- CRS(SRS_string = "EPSG:3116")
proj4string(Silt_60_100) <- CRS(SRS_string = "EPSG:3116")

#for MACHISPLIN
#proj4string(Silt_0_5) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Silt_0_5<-projectRaster(Silt_0_5,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Silt_0_5) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Silt_5_15<-projectRaster(Silt_5_15,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Silt_5_15) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Silt_15_30<-projectRaster(Silt_15_30,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Silt_15_30) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Silt_30_60<-projectRaster(Silt_30_60,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models
#proj4string(Silt_60_100) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Silt_60_100<-projectRaster(Silt_60_100,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models

###Integrating
##0 to 30
Clay_0_30<-(1/30)*(1/2)*(((5-0)*(Clay_0_5+Clay_0_5))+((15-5)*(Clay_0_5+Clay_5_15))+((30-15)*(Clay_5_15+Clay_15_30)))
writeRaster(Clay_0_30,paste0("Results/Integrated/",mod,"Clay_0_30.tif"),overwrite=TRUE)

Sand_0_30<-(1/30)*(1/2)*(((5-0)*(Sand_0_5+Sand_0_5))+((15-5)*(Sand_0_5+Sand_5_15))+((30-15)*(Sand_5_15+Sand_15_30)))
writeRaster(Sand_0_30,paste0("Results/Integrated/",mod,"_Sand_0_30.tif"),overwrite=TRUE)

Silt_0_30<-(1/30)*(1/2)*(((5-0)*(Silt_0_5+Silt_0_5))+((15-5)*(Silt_0_5+Silt_5_15))+((30-15)*(Silt_5_15+Silt_15_30)))
writeRaster(Silt_0_30,paste0("Results/Integrated/",mod,"_Silt_0_30.tif"),overwrite=TRUE)

##0 to 100

Clay_0_100<-(1/100)*(1/2)*(((5-0)*(Clay_0_5+Clay_0_5))+((15-5)*(Clay_0_5+Clay_5_15))+((30-15)*(Clay_5_15+Clay_15_30))+
                           ((60-30)*(Clay_15_30+Clay_30_60))+((100-60)*(Clay_30_60+Clay_60_100)))
writeRaster(Clay_0_100,paste0("Results/Integrated/",mod,"_Clay_0_100.tif"),overwrite=TRUE)

Sand_0_100<-(1/100)*(1/2)*(((5-0)*(Sand_0_5+Sand_0_5))+((15-5)*(Sand_0_5+Sand_5_15))+((30-15)*(Sand_5_15+Sand_15_30))+
                             ((60-30)*(Sand_15_30+Sand_30_60))+((100-60)*(Sand_30_60+Sand_60_100)))
writeRaster(Sand_0_100,paste0("Results/Integrated/",mod,"_Sand_0_100.tif"),overwrite=TRUE)

Silt_0_100<-(1/100)*(1/2)*(((5-0)*(Silt_0_5+Silt_0_5))+((15-5)*(Silt_0_5+Silt_5_15))+((30-15)*(Silt_5_15+Silt_15_30))+
                             ((60-30)*(Silt_15_30+Silt_30_60))+((100-60)*(Silt_30_60+Silt_60_100)))
writeRaster(Silt_0_100,paste0("Results/Integrated/",mod,"_Silt_0_100.tif"),overwrite=TRUE)

### Save as a composite layer
Text_0_30<-stack(Clay_0_30,Sand_0_30,Silt_0_30)
writeRaster(Text_0_30,paste0("Results/Integrated/",mod,"_Text_0_30.tif"),overwrite=TRUE)

Text_0_100<-stack(Clay_0_100,Sand_0_100,Silt_0_100)
writeRaster(Text_0_100,paste0("Results/Integrated/",mod,"_Text_0_100.tif"),overwrite=TRUE)
