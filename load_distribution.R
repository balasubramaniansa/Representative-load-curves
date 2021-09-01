#Jan-Feb DATA

start_day = 1
number_of_days = 1
block1_number_of_hours<-7
block2_number_of_hours<-6
block3_number_of_hours<-5
block4_number_of_hours<-3
block5_number_of_hours<-3
block1<-c(1,7)
block2<-c(8,13)
block3<-c(14,18)
block4<-c(19,21)
block5<-c(22,24)
jan_feb_data<-as.data.frame(seq(from=start_day,by=1, length=number_of_days))
other_names<-c('Hour1', 'Hour2', 'Hour3', 'Hour4', 'Hour5', 'Hour6', 'Hour7',
               'Hour8', 'Hour9', 'Hour10', 'Hour11', 'Hour12', 'Hour13',
               'Hour14', 'Hour15', 'Hour16', 'Hour17', 'Hour18',
               'Hour19', 'Hour20', 'Hour21',
               'Hour22', 'Hour23', 'Hour24')
jan_feb_data[,other_names]<-NA
names(jan_feb_data)<-c('Day', other_names)

weights_jan_feb_block1<-c(0.143374884193962, 
                   0.138450220919929,
                   0.1372890624046,
                   0.140429333238312,
                   0.143133416546381,
                   0.145498210325547,
                   0.151824872371269)
weights_jan_feb_block2<-c(0.171589347767214,
                          0.17115794270613,
                          0.169322755565148,
                          0.166764944572984,
                          0.162485367011891,
                          0.158679642376633)
weights_jan_feb_block3<-c(0.206742703307131,
                          0.204614301656572,
                          0.201546574295495, 
                          0.197065859469591, 
                          0.190030561271211)
weights_jan_feb_block4<-c(0.339429532508897,
                          0.336830902124829, 
                          0.323739565366274)
weights_jan_feb_block5<-c(0.333260391404824,
                          0.3394397478411,
                          0.327299860754076
                          )

#Generating Hours 1-7 data for each day

day = 1
for(i in 1:number_of_days){
Load_jan_feb = mean(rlnorm(1000, 8.937236326, 0.051609621 )) * block1_number_of_hours
load_data<-c()
for (weight in weights_jan_feb_block1){
  load<-weight * Load_jan_feb
  load_data<-c(load_data, load)
}
jan_feb_data[day,(block1[1]+1):(block1[2]+1)]<-load_data
day = day + 1
}

#Generating Hours 8-13 data for each day

day = 1
for(i in 1:number_of_days){
  Load_jan_feb = mean(rlogis(1000, 8495.74059, 205.09864)) * block2_number_of_hours
  load_data<-c()
  for (weight in weights_jan_feb_block2){
    load<-weight * Load_jan_feb
    load_data<-c(load_data, load)
  }
  jan_feb_data[day,(block2[1]+1):(block2[2]+1)]<-load_data
  day = day + 1
}

#Generating Hours 14-18 data for each day

day = 1
for(i in 1:number_of_days){
  Load_jan_feb = mean(rlogis(1000, 7432.84711, 293.89481)) * block3_number_of_hours
  load_data<-c()
  for (weight in weights_jan_feb_block3){
    load<-weight * Load_jan_feb
    load_data<-c(load_data, load)
  }
  jan_feb_data[day,(block3[1]+1):(block3[2]+1)]<-load_data
  day = day + 1
}

#Generating Hours 19-21 data for each day

day = 1
for(i in 1:number_of_days){
  Load_jan_feb = mean(rnorm(1000, 8121.90251, 419.86198)) * block4_number_of_hours
  load_data<-c()
  for (weight in weights_jan_feb_block4){
    load<-weight * Load_jan_feb
    load_data<-c(load_data, load)
  }
  jan_feb_data[day,(block4[1]+1):(block4[2]+1)]<-load_data
  day = day + 1
}

#Generating Hours 22-24 data for each day

day = 1
for(i in 1:number_of_days){
  Load_jan_feb = mean(rlnorm(1000, 8.938002023, 0.052501351 )) * block5_number_of_hours
  load_data<-c()
  for (weight in weights_jan_feb_block5){
    load<-weight * Load_jan_feb
    load_data<-c(load_data, load)
  }
  jan_feb_data[day,(block5[1]+1):(block5[2]+1)]<-load_data
  day = day + 1
}

write.csv(jan_feb_data, file='C:\\Users\\bala\\Desktop\\jan_feb_data.csv')
