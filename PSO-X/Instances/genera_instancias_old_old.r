######################################################################
#### Unimodal functions of all competitions
######################################################################
comp <- c("0") #CEC05
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:4)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 0:2)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in (x <- 0:10)[c(seq(-6,-3))] ){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
	con=file("train_unimodal_all_50.txt", "w")
	writeLines(lines, con)
	close(con)

######################################################################
#### Multimodal functions of all competitions
######################################################################
comp <- c("0") #CEC05
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 5:13)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 3:12)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in (x <- 2:5)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_multimodal_all_50.txt", "w")
  writeLines(lines,con)
  close(con)

######################################################################
#### Hybrid functions of all competitions
######################################################################
comp <- c("0") #CEC05
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 14:24)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- c(13,15,16))){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- c(14,17,18))){ #functions that fail in some dimensions
    for (d in seq(1,49)[c(-10,-1,-2,-4,-7,-11,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in (x <- 11:18)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_hybrid_all_50.txt", "w")
  writeLines(lines, con)
  close(con)

#######################################################################
#### MIXTURE of instances of all competitions up to 100 dimensions
#### Note that not all functions are defined to 100 dimensions
#######################################################################
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:49)[c(-36,-39,-40,seq(-50,-42))]){ #functions with up to 100 dimensions
    for (d in seq(1,99)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(35,38,39) #functions that fail in some dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in seq(1,99)[c(-10,-1,-2,-4,-7,-11,-20,-30,-50)]){ #These ones fail in 4,7 and 11
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### Unimodal instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:11)){  #functions with up to 100 dimensions
    for (d in seq(1,99)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_uni_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### Multimodal instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 12:25)){  #functions with up to 100 dimensions
    for (d in seq(1,99)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_mul_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### Hybrid instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 26:49)[c(-39,-40,-36,seq(-50,-42))]){ #functions with up to 100 dimensions
    for (d in seq(1,99)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(35,38,39) #Functions that fail in some dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in seq(1,99)[c(-10,-1,-2,-4,-7,-11,-20,-30,-50)]){ #These ones fail in 4,7 and 11
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(seq(41,49)) #functions with up to 50 dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_hyb_100.txt", "w")
  writeLines(lines, con)
  close(con)

######################################################################
#### Mixture of instances of all competitions with up to 49 dimensions 
#### (what we actually used with irace)
######################################################################
comp <- c("3") #MIXTURE
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:49)[c(-39,-40,-36)]){ #this functions 38 and 39 fail in some dimensions
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(35,38,39) #Functions that fail in some dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in seq(1,49)[c(-10,-1,-2,-4,-7,-11,-20,-30,-50)]){ #These ones fail in 4,7 and 11
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_50.txt", "w")
  writeLines(lines, con)
  close(con)

#### Unimodal instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:11)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_uni_50.txt", "w")
  writeLines(lines, con)
  close(con)

#### Multimodal instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 12:25)){
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_mul_50.txt", "w")
  writeLines(lines, con)
  close(con)

#### Hybrid instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 26:49)[c(-39,-40,-36)]){  #functions with up to 100 dimensions
    for (d in seq(1,49)[c(-10,-1,-2,-20,-30,-50)]){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(35,38,39) #Functions that fail in some dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in seq(1,49)[c(-10,-1,-2,-4,-7,-11,-20,-30,-50)]){ #These ones fail in 4,7 and 11
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_mixture_hyb_50.txt", "w")
  writeLines(lines, con)
  close(con)

######################################################################
#### Test instances 2, 10, 30, 50 and 100 dimensions 
######################################################################

#### CEC05 with up to 50 dimensions
lines <- c()
comp <- c("0") #CEC05
for (i in 1:length(comp)){
  for (j in (x <- 0:24)){
    for (d in c(2,10,20,30,50)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_CEC05_50.txt", "w")
  writeLines(lines, con)
  close(con)

#### CEC05 with up to 100 dimensions
lines <- c()
comp <- c("0") #CEC05
for (i in 1:length(comp)){
  for (j in (x <- 0:24)[c(-3,-7,-8,-10,-14,seq(-25,-16))]){ #functions with up to 100 dimensions
    for (d in c(2,10,20,30,50,100)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(2,6,7,9,13,seq(15,24)) #functions with up to 50 dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in c(2,10,20,30,50)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_CEC05_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### CEC05 large scale
lines <- c()
comp <- c("0") #CEC05
for (i in 1:length(comp)){
  for (j in (x <- 0:24)[c(-3,-7,-8,-10,-14,seq(-25,-16))]){ #functions with up to 100 dimensions
    for (d in c(100,200,500,1000)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_CEC05_LargeScale.txt", "w")
  writeLines(lines, con)
  close(con)



#### CEC14 with up to 50 dimensions
lines <- c()
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 0:18)){ #functions with up to 100 dimensions
    for (d in c(2,10,20,30,50,100)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_CEC14_50.txt", "w")
  writeLines(lines, con)
  close(con)
  
#### CEC14 with up to 100 dimensions
lines <- c()
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 0:18)[c(-1,-4,-6,-7)]){ #functions with up to 100 dimensions
    for (d in c(2,10,20,30,50,100)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(0,3,5,6) #functions with up to 50 dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in c(2,10,20,30,50)){
      lines <- c(lines, paste(comp[i],";",j,";",d,sep=""))
    }
  }
}
  con=file("test_CEC14_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### CEC14 large scale 
lines <- c()
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 0:18)[c(-1,-4,-6,-7)]){ #functions with up to 100 dimensions
    for (d in c(100,200,500,1000)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_CEC14_LargeScale.txt", "w")
  writeLines(lines, con)
  close(con)



#### SOFT_COMPUTING with up to 50 dimensions
lines <- c()
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in x <- 0:18){
    for (d in c(2,10,20,30,50)){
      lines <- c(lines, paste(comp[i],";",j,";",d,sep=""))
    }
  }
}
  con=file("test_SOCO_50.txt", "w")
  writeLines(lines, con)
  close(con)

#### SOFT_COMPUTING with up to 100 dimensions
lines <- c()
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in x <- 0:18){
    for (d in c(2,10,20,30,50,100)){
      lines <- c(lines, paste(comp[i],";",j,";",d,sep=""))
    }
  }
}
  con=file("test_SOCO_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### SOFT_COMPUTING large scale
lines <- c()
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in x <- 0:18){
    for (d in c(100,200,500,1000)){
      lines <- c(lines, paste(comp[i],";",j,";",d,sep=""))
    }
  }
}
  con=file("test_SOCO_LargeScale.txt", "w")
  writeLines(lines, con)
  close(con)


#### MIXTURE with up to 50 dimensions
lines <- c()
comp <- c("3") #MIXTURE
for (i in 1:length(comp)){
  for (j in (x <- 0:49)){ #functions with up to 100 dimensions
    for (d in c(10,20,30,50)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_MIXTURE_50.txt", "w")
  writeLines(lines, con)
  close(con)


#### MIXTURE with up to 100 dimensions
lines <- c()
comp <- c("3") #MIXTURE
for (i in 1:length(comp)){
  for (j in (x <- 0:49)[c(seq(-50,-42))]){ #functions with up to 100 dimensions
    for (d in c(10,20,30,50,100)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(seq(41,49)) #functions with up to 50 dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in c(10,20,30,50)){ 
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_MIXTURE_100.txt", "w")
  writeLines(lines, con)
  close(con)

#### MIXTURE large scale dimensions
lines <- c()
comp <- c("3") #MIXTURE
for (i in 1:length(comp)){
  for (j in c(0,4,5,7,8,9,12,14,16,18,20,26,27,28,29,30,31,32,33)){ #functions with up to 100 dimensions
    for (d in c(200,500,1000)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_MIXTURE_LargeScale.txt", "w")
  writeLines(lines, con)
  close(con)
