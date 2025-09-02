######################################################################
#### Unimodal functions of all competitions
######################################################################
comp <- c("0") #CEC05
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:4)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 0:2)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in (x <- 0:10)[c(seq(-6,-3))] ){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
	con=file("train_ALL_uni.txt", "w")
	writeLines(lines, con)
	close(con)

######################################################################
#### Multimodal functions of all competitions
######################################################################
comp <- c("0") #CEC05
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 5:13)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 3:12)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in (x <- 2:5)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_ALL_mul.txt", "w")
  writeLines(lines,con)
  close(con)

######################################################################
#### Hybrid functions of all competitions
######################################################################
comp <- c("0") #CEC05
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 14:24)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- c(13,14,15,16,17,18))){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in (x <- 11:18)){
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_ALL_hyb.txt", "w")
  writeLines(lines, con)
  close(con)

#######################################################################
#### MIXTURE of instances of all competitions up to 100 dimensions
#### Note that not all functions are defined to 100 dimensions
#######################################################################
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:49)){ #functions with up to 100 dimensions
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_MIXTURE.txt", "w")
  writeLines(lines, con)
  close(con)

#### Unimodal instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 0:11)){  #functions with up to 100 dimensions
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_MIXTURE_uni.txt", "w")
  writeLines(lines, con)
  close(con)

#### Multimodal instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 12:25)){  #functions with up to 100 dimensions
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_MIXTURE_mul.txt", "w")
  writeLines(lines, con)
  close(con)

#### Hybrid instances of mixture up to 100 dimensions
comp <- c("3")
lines <- c()
for (i in 1:length(comp)){
  for (j in (x <- 26:49)){ #functions with up to 100 dimensions
    for (d in c(10,20)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("train_MIXTURE_hyb.txt", "w")
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
  con=file("test_CEC05.txt", "w")
  writeLines(lines, con)
  close(con)

#### CEC14 with up to 50 dimensions
lines <- c()
comp <- c("1") #CEC14
for (i in 1:length(comp)){
  for (j in (x <- 0:18)){
    for (d in c(2,10,20,30,50,100)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_CEC14.txt", "w")
  writeLines(lines, con)
  close(con)
  

#### SOFT_COMPUTING large scale
lines <- c()
comp <- c("2") #SOFT_COMPUTING
for (i in 1:length(comp)){
  for (j in x <- 0:18){
    for (d in c(50,100,200,500,1000)){
      lines <- c(lines, paste(comp[i],";",j,";",d,sep=""))
    }
  }
}
  con=file("test_SOCO.txt", "w")
  writeLines(lines, con)
  close(con)


#### MIXTURE with up to 100 dimensions
lines <- c()
comp <- c("3") #MIXTURE
for (i in 1:length(comp)){
  for (j in (x <- 0:49)[c(seq(-50,-42))]){ #functions with up to 100 dimensions
    for (d in c(50,100)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
mm <- c(seq(41,49)) #functions with up to 50 dimensions
for (i in 1:length(comp)){
  for (j in mm){
    for (d in c(50)){ 
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_MIXTURE.txt", "w")
  writeLines(lines, con)
  close(con)

#### MIXTURE large scale dimensions
lines <- c()
comp <- c("3") #MIXTURE
for (i in 1:length(comp)){
  for (j in c(0,4,5,7,8,9,12,14,16,18,20,26,27,28,29,30,31,32,33)){ #functions with up to 100 dimensions
    for (d in c(200,500)){
      lines <- c(lines, paste("--competition ", comp[i]," --problem ",j," --dimensions ",d,sep=""))
    }
  }
}
  con=file("test_MIXTURE_LargeScale.txt", "w")
  writeLines(lines, con)
  close(con)
