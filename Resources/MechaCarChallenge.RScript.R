library(dplyr)
#Part 1
mpg<- read.csv('MechaCar_mpg.csv', stringsAsFactors = F) #read the data
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mpg) #check the slope of each independent variable
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mpg)) #find p-value and r squared

#Correlation Matrix
mpg_matrix<- as.matrix(mpg[,c("vehicle_length", "vehicle_weight", "spoiler_angle",
                              "ground_clearance", "AWD", "mpg")])
cor(mpg_matrix)

#Test each variable
#Vehicle Length as a variable
model_length<- lm(mpg ~ vehicle_length, mpg)
yvals<-model_length$coefficients['vehicle_length']*mpg$vehicle_length +model_length$coefficients['(Intercept)']

plt<- ggplot(mpg, aes(x=vehicle_length, y=mpg))
plt+geom_point() + geom_line(aes(y=yvals), color = 'red') +labs(x="Vehicle Length", y="MPG")

#Ground Clearance as a variable
model_length<- lm(mpg ~ ground_clearance, mpg)
yvals<-model_length$coefficients['ground_clearance']*mpg$ground_clearance +model_length$coefficients['(Intercept)']
round(cor(mpg$vehicle_length, mpg$mpg),2)

plt<- ggplot(mpg, aes(x=ground_clearance, y=mpg))
plt+geom_point() + geom_line(aes(y=yvals), color = 'blue') +labs(x="Ground Clearance", y="MPG")
round(cor(mpg$ground_clearance, mpg$mpg),2)

#Part 2
suspension<- read.csv("Suspension_Coil.csv")
head(suspension)

#Getting stats for PSI column
total_summary<- suspension %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep')

#Create a Lot Summary with PSI stats
lot_summary<- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), Vehicles=n(),.groups='keep')

#Part 3
t.test((suspension$PSI), mu=1500) #p-value > 0.05, we fail to reject the null hypothesis. True mean is 1500

#create subsets
lot1<-suspension %>% filter(Manufacturing_Lot == "Lot1")
lot2<-suspension %>% filter(Manufacturing_Lot == "Lot2")
lot3<-suspension %>% filter(Manufacturing_Lot == "Lot3")

#t-test each subset
t.test(lot1$PSI,mu=1500) #p-value > .05, fail to reject the null hypothesis. True mean is 1500
t.test(lot2$PSI, mu = 1500) #p-value > .05, fail to reject the null hypothesis. True mean is 1500
t.test(lot3$PSI, mu=1500) #p-value < .05, reject the null hypothesis. True mean is not 1500
