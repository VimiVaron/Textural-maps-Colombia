rm(list = ls())

library(raster)
library(readxl)
setwd("C:\\Users\\vimiv\\OneDrive - AGROSAVIA - CORPORACION COLOMBIANA DE INVESTIGACION AGROPECUARIA\\Documentos\\Texture\\Script")

#definici?n profundidad de trabajo y modelo a validadar#
prof<-"0_5" #"0_5","5_15","15_30","30_60","60_100"
prof

mod<-"landmap" # "MACHISPLIN","landmap","Ensemble"
mod
#Cargar datos de validaci?n#
test <- read.csv(paste0("Data/dat_",prof,"_test.csv"),sep = ",",header = TRUE,dec = ".")

xy_test <- test[,c(5,4)]


test <- SpatialPointsDataFrame(coords = xy_test,data = test[,c(6,8,7)],
                               proj4string = CRS(SRS_string = "EPSG:4326"))
st_crs(test)

dat_test<-spTransform(test,CRS(SRS_string = "EPSG:3116"))

Clay_pred<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Clay_",prof,".tif"))
Sand_pred<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Sand_",prof,".tif"))
Silt_pred<-raster(paste0("Results/",mod,"/Text_fractions/",mod,"_Silt_",prof,".tif"))

proj4string(Clay_pred) <- CRS(SRS_string = "EPSG:3116")
proj4string(Sand_pred) <- CRS(SRS_string = "EPSG:3116")
proj4string(Silt_pred) <- CRS(SRS_string = "EPSG:3116")

#proj4string(Clay_pred) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Clay_pred<-projectRaster(Clay_pred,crs=CRS("+init=epsg:3116")) # for MACHISPLIN models

#proj4string(Sand_pred) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Sand_pred<-projectRaster(Sand_pred,crs=CRS("+init=epsg:3116"))# for MACHISPLIN models

#proj4string(Silt_pred) <- CRS("+init=epsg:4326")# for MACHISPLIN models
#Silt_pred<-projectRaster(Silt_pred,crs=CRS("+init=epsg:3116"))# for MACHISPLIN models

predicions<-stack(Clay_pred,Sand_pred,Silt_pred)
writeRaster(predicions,filename = paste0("Results/Text_maps/Text_",mod,"_",prof,".tif"),overwrite=TRUE)
ext_valid<-extract(predicions,dat_test,sp=T) ### Ar, A, L obs [1,2,3] Ar,A,L pred [4,5,6] x y [7,8]


validation_ext<-as.data.frame(ext_valid)
head(validation_ext)
write.csv(validation_ext,file=paste0("Results/Tables_validation/",mod,"_",prof,".csv"))


rm(mod)
rm(prof)




######################Validaci?n de los modelos por profundidad##################
rm(list = ls())
library(DescTools)#CCC calculation
library(raster)
library(readxl)
setwd("D:\\OneDrive - AGROSAVIA - CORPORACION COLOMBIANA DE INVESTIGACION AGROPECUARIA\\Documentos\\Texture\\Script")

prof<-"0_5" #"0_5","5_15","15_30","30_60","60_100"
prof

dat<-read.csv(paste0("Results/Tables_validation/MACHISPLIN_",prof,".csv"))
validation<-dat[,c(2:7)]

validation$PE_Clay<-validation[,4]-validation[,1]
validation$PE_Sand<-validation[,5]-validation[,2]
validation$PE_Silt<-validation[,6]-validation[,3]

ME_Clay<-mean(validation[,7],na.rm=TRUE)
RMSE_Clay<-sqrt(sum(validation[,7]^2,na.rm=TRUE)/length(validation[,7]))
AVE_Clay<-1-sum(validation[,7]^2,na.rm=TRUE)/sum((validation[,1]-mean(validation[,1],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Clay<-CCC(validation[,1], validation[,4], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Clay<-CCC_Clay$rho.c$est

ME_Sand<-mean(validation[,8],na.rm=TRUE)
RMSE_Sand<-sqrt(sum(validation[,8]^2,na.rm=TRUE)/length(validation[,8]))
AVE_Sand<-1-sum(validation[,8]^2,na.rm=TRUE)/sum((validation[,2]-mean(validation[,2],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Sand<-CCC(validation[,2], validation[,5], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Sand<-CCC_Sand$rho.c$est

ME_Silt<-mean(validation[,9],na.rm=TRUE)
RMSE_Silt<-sqrt(sum(validation[,9]^2,na.rm=TRUE)/length(validation[,9]))
AVE_Silt<-1-sum(validation[,9]^2,na.rm=TRUE)/sum((validation[,3]-mean(validation[,3],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Silt<-CCC(validation[,3], validation[,6], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Silt<-CCC_Silt$rho.c$est

ME<-cbind(ME_Clay,ME_Sand,ME_Silt)
RMSE<-cbind(RMSE_Clay,RMSE_Sand,RMSE_Silt)
AVE<-cbind(AVE_Clay,AVE_Sand,AVE_Silt)
CCC<-cbind(CCC_Clay,CCC_Sand,CCC_Silt)

Val_MACHISPLIN<-rbind(ME,RMSE,AVE,CCC)
Val_MACHISPLIN

#landmap
dat<-read.csv(paste0("Results/Tables_validation/landmap_",prof,".csv"))
validation<-dat[,c(2:7)]

validation$PE_Clay<-validation[,4]-validation[,1]
validation$PE_Sand<-validation[,5]-validation[,2]
validation$PE_Silt<-validation[,6]-validation[,3]

ME_Clay<-mean(validation[,7],na.rm=TRUE)
RMSE_Clay<-sqrt(sum(validation[,7]^2,na.rm=TRUE)/length(validation[,7]))
AVE_Clay<-1-sum(validation[,7]^2,na.rm=TRUE)/sum((validation[,1]-mean(validation[,1],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Clay<-CCC(validation[,1], validation[,4], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Clay<-CCC_Clay$rho.c$est

ME_Sand<-mean(validation[,8],na.rm=TRUE)
RMSE_Sand<-sqrt(sum(validation[,8]^2,na.rm=TRUE)/length(validation[,8]))
AVE_Sand<-1-sum(validation[,8]^2,na.rm=TRUE)/sum((validation[,2]-mean(validation[,2],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Sand<-CCC(validation[,2], validation[,5], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Sand<-CCC_Sand$rho.c$est

ME_Silt<-mean(validation[,9],na.rm=TRUE)
RMSE_Silt<-sqrt(sum(validation[,9]^2,na.rm=TRUE)/length(validation[,9]))
AVE_Silt<-1-sum(validation[,9]^2,na.rm=TRUE)/sum((validation[,3]-mean(validation[,3],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Silt<-CCC(validation[,3], validation[,6], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Silt<-CCC_Silt$rho.c$est

ME<-cbind(ME_Clay,ME_Sand,ME_Silt)
RMSE<-cbind(RMSE_Clay,RMSE_Sand,RMSE_Silt)
AVE<-cbind(AVE_Clay,AVE_Sand,AVE_Silt)
CCC<-cbind(CCC_Clay,CCC_Sand,CCC_Silt)

Val_landmap<-rbind(ME,RMSE,AVE,CCC)
Val_landmap

#SG
dat<-read.csv(paste0("Results/Tables_validation/SG_",prof,".csv"))
validation<-dat[,c(2:7)]

validation$PE_Clay<-validation[,4]-validation[,1]
validation$PE_Sand<-validation[,5]-validation[,2]
validation$PE_Silt<-validation[,6]-validation[,3]

ME_Clay<-mean(validation[,7],na.rm=TRUE)
RMSE_Clay<-sqrt(sum(validation[,7]^2,na.rm=TRUE)/length(validation[,7]))
AVE_Clay<-1-sum(validation[,7]^2,na.rm=TRUE)/sum((validation[,1]-mean(validation[,1],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Clay<-CCC(validation[,1], validation[,4], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Clay<-CCC_Clay$rho.c$est

ME_Sand<-mean(validation[,8],na.rm=TRUE)
RMSE_Sand<-sqrt(sum(validation[,8]^2,na.rm=TRUE)/length(validation[,8]))
AVE_Sand<-1-sum(validation[,8]^2,na.rm=TRUE)/sum((validation[,2]-mean(validation[,2],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Sand<-CCC(validation[,2], validation[,5], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Sand<-CCC_Sand$rho.c$est

ME_Silt<-mean(validation[,9],na.rm=TRUE)
RMSE_Silt<-sqrt(sum(validation[,9]^2,na.rm=TRUE)/length(validation[,9]))
AVE_Silt<-1-sum(validation[,9]^2,na.rm=TRUE)/sum((validation[,3]-mean(validation[,3],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Silt<-CCC(validation[,3], validation[,6], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Silt<-CCC_Silt$rho.c$est

ME<-cbind(ME_Clay,ME_Sand,ME_Silt)
RMSE<-cbind(RMSE_Clay,RMSE_Sand,RMSE_Silt)
AVE<-cbind(AVE_Clay,AVE_Sand,AVE_Silt)
CCC<-cbind(CCC_Clay,CCC_Sand,CCC_Silt)

Val_SG<-rbind(ME,RMSE,AVE,CCC)
Val_SG

#Ensemble
dat<-read.csv(paste0("Results/Tables_validation/Ensemble_",prof,".csv"))
validation<-dat[,c(2:7)]

validation$PE_Clay<-validation[,4]-validation[,1]
validation$PE_Sand<-validation[,5]-validation[,2]
validation$PE_Silt<-validation[,6]-validation[,3]

ME_Clay<-mean(validation[,7],na.rm=TRUE)
RMSE_Clay<-sqrt(sum(validation[,7]^2,na.rm=TRUE)/length(validation[,7]))
AVE_Clay<-1-sum(validation[,7]^2,na.rm=TRUE)/sum((validation[,1]-mean(validation[,1],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Clay<-CCC(validation[,1], validation[,4], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Clay<-CCC_Clay$rho.c$est

ME_Sand<-mean(validation[,8],na.rm=TRUE)
RMSE_Sand<-sqrt(sum(validation[,8]^2,na.rm=TRUE)/length(validation[,8]))
AVE_Sand<-1-sum(validation[,8]^2,na.rm=TRUE)/sum((validation[,2]-mean(validation[,2],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Sand<-CCC(validation[,2], validation[,5], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Sand<-CCC_Sand$rho.c$est

ME_Silt<-mean(validation[,9],na.rm=TRUE)
RMSE_Silt<-sqrt(sum(validation[,9]^2,na.rm=TRUE)/length(validation[,9]))
AVE_Silt<-1-sum(validation[,9]^2,na.rm=TRUE)/sum((validation[,3]-mean(validation[,3],na.rm=TRUE))^2,na.rm = TRUE)
CCC_Silt<-CCC(validation[,3], validation[,6], ci = "z-transform", conf.level = 0.95, na.rm = TRUE)
CCC_Silt<-CCC_Silt$rho.c$est

ME<-cbind(ME_Clay,ME_Sand,ME_Silt)
RMSE<-cbind(RMSE_Clay,RMSE_Sand,RMSE_Silt)
AVE<-cbind(AVE_Clay,AVE_Sand,AVE_Silt)
CCC<-cbind(CCC_Clay,CCC_Sand,CCC_Silt)

Val_Ensemble<-rbind(ME,RMSE,AVE,CCC)
Val_Ensemble

Val<-cbind(Val_MACHISPLIN,Val_landmap,Val_SG,Val_Ensemble)
colnames (Val) <-c("Clay","Sand","Silt",
              "Clay","Sand","Silt",
              "Clay","Sand","Silt",
              "Clay","Sand","Silt")
Val

write.csv(Val,file = paste0("Results/Tables_validation/Models_Validation_",prof,".csv"))

