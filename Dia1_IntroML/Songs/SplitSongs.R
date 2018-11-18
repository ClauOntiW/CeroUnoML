setwd("~/YearPredictionMSD.txt") #fijamos el directorio de trabajo
dir()
t1 <- Sys.time()
songs <- read.csv('YearPredictionMSD.txt', stringsAsFactors = FALSE, header = FALSE)
t1 <- Sys.time() - t1
t1 # lectura 1.21231 mins
names(songs) <- c('y', paste0('X', 1:90))
set.seed(0) #fijamos una semilla para reproducir la particion
n <- dim(songs)[1]
index <- sample(1:n, round(n/100)) #muestra de 1%
train.index <- sample(index, round(length(index)/70))
sample <- songs[index, ]
train <- sample[train.index, ]
test <- sample[-train.index, ]
write.csv(train, 'SongsTrain.csv')
write.csv(test, 'SongsTest.csv')
