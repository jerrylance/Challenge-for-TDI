# Challenge for TDI, Section 1
# Zeyu Liu
# 10/31/2019
# display the corrent directory
getwd()
setwd("C:/Users/39384/OneDrive/Desktop/TDI challenge/")

# load the .csv data file
Arrest1 = read.csv("Arrest_Data_from_2010_to_Present.csv",header = T)
fix(Arrest1)
# How many bookings of arrestees were made in 2018?
attach(Arrest1)
year2018 = grep("2018", Arrest.Date)
Arrest = Arrest1[c(year2018),]
dim(Arrest)

# These code is consider to omit the NA,if need.
##Arrest =na.omit(Arrest)
##dim(Arrest)
##fix(Arrest)

summary(Arrest)
attach(Arrest)
# How many bookings of arrestees were made in the area with the most arrests in 2018?
table(Area.Name)
which.max(table(Area.Name))

# What is the 95% quantile of the age of the arrestee in 2018? Only consider the following charge groups for your analysis:
range(Age)
A = data.frame(Age,Charge.Group.Description)
A1 = subset(A,Charge.Group.Description=='Vechicle Theft'|Charge.Group.Description=='Robbery'|Charge.Group.Description=='Burglary'|Charge.Group.Description=='Receive Stolen Property')
summary(Age,data=A1)

quantile(Age, c(0.05,0.5,0.95), data = A1)

# calculate the Z-score of the average age for each charge group. Report the largest absolute value among the calculated Z-scores.
B = data.frame(Age,Charge.Group.Description)
B1 = subset(B,Charge.Group.Description!='Pre-Delinquency'&Charge.Group.Description!='Non-Criminal Detention')
B2 = na.omit(B1)
is.na(B2)

# here the data has many blank not NA, so we need to delete them
B3 = subset(B2,Charge.Group.Description!='')

summary(B3, maxsum = 100)
attach(B3)

z1 = grep('Against Family/Child',Charge.Group.Description)
z1 = data.frame(B3[c(z1),])

z2 = grep('Aggravated Assault',Charge.Group.Description)
z2 = data.frame(B3[c(z2),])

z3 = grep('Burglary',Charge.Group.Description)
z3 = data.frame(B3[c(z3),])

z4 = grep('Disorderly Conduct',Charge.Group.Description)
z4 = data.frame(B3[c(z4),])

z5 = grep('Disturbing the Peace',Charge.Group.Description)
z5 = data.frame(B3[c(z5),])

z6 = grep('Driving Under Influence',Charge.Group.Description)
z6 = data.frame(B3[c(z6),])

z7 = grep('Drunkeness',Charge.Group.Description)
z7 = data.frame(B3[c(z7),])

z8 = grep('Federal Offenses',Charge.Group.Description)
z8 = data.frame(B3[c(z8),])

z9 = grep('Forgery/Counterfeit',Charge.Group.Description)
z9 = data.frame(B3[c(z9),])

z10 = grep('Fraud/Embezzlement',Charge.Group.Description)
z10 = data.frame(B3[c(z10),])

z11 = grep('Gambling',Charge.Group.Description)
z11 = data.frame(B3[c(z11),])

z12 = grep('Homicide',Charge.Group.Description)
z12 = data.frame(B3[c(z12),])

z13 = grep('Larceny',Charge.Group.Description)
z13 = data.frame(B3[c(z13),])

z14 = grep('Liquor Laws',Charge.Group.Description)
z14 = data.frame(B3[c(z14),])

z15 = grep('Miscellaneous Other Violations',Charge.Group.Description)
z15 = data.frame(B3[c(z15),])

z16 = grep('Moving Traffic Violations',Charge.Group.Description)
z16 = data.frame(B3[c(z16),])

z17 = grep('Narcotic Drug Laws',Charge.Group.Description)
z17 = data.frame(B3[c(z17),])

z18 = grep('Other Assaults',Charge.Group.Description)
z18 = data.frame(B3[c(z18),])

z19 = grep('Prostitution/Allied',Charge.Group.Description)
z19 = data.frame(B3[c(z19),])

z20 = grep('Rape',Charge.Group.Description)
z20 = data.frame(B3[c(z20),])

z21 = grep('Receive Stolen Property',Charge.Group.Description)
z21 = data.frame(B3[c(z21),])

z22 = grep('Robbery',Charge.Group.Description)
z22 = data.frame(B3[c(z22),])

z23 = grep('Sex',Charge.Group.Description)
z23 = data.frame(B3[c(z23),])

z24 = grep('Vehicle Theft',Charge.Group.Description)
z24 = data.frame(B3[c(z24),])

z25 = grep('Weapon',Charge.Group.Description)
z25 = data.frame(B3[c(z25),])

scale(z1$Age) 
scale(z2$Age) 
scale(z3$Age) 
scale(z4$Age) 
scale(z5$Age) 
scale(z6$Age) 
scale(z7$Age) 
scale(z8$Age) 
scale(z9$Age) 
scale(z10$Age) 
scale(z11$Age) 
scale(z12$Age) 
scale(z13$Age) 
scale(z14$Age) 
scale(z15$Age)
scale(z16$Age) 
scale(z17$Age) 
scale(z18$Age) 
scale(z19$Age) 
scale(z20$Age) 
scale(z21$Age) 
scale(z22$Age)
# options(digits=10)
scale(z23$Age)   # The largest absolute value
scale(z24$Age) 
scale(z25$Age) 

# what is the projected number of felony arrests in 2019?
attach(Arrest1)
year19 = grep("2019", Arrest.Date)
Ayear19 = Arrest1[c(year19),]
A1year19 = subset(Ayear19,Arrest.Type.Code=='F')
dim(A1year19)

year18 = grep('2018', Arrest.Date)
Ayear18 = Arrest1[c(year18),]
A1year18 = subset(Ayear18,Arrest.Type.Code=='F')
dim(A1year18)

year17 = grep("2017", Arrest.Date)
Ayear17 = Arrest1[c(year17),]
A1year17 = subset(Ayear17,Arrest.Type.Code=='F')
dim(A1year17)

year16 = grep("2016", Arrest.Date)
Ayear16 = Arrest1[c(year16),]
A1year16 = subset(Ayear16,Arrest.Type.Code=='F')
dim(A1year16)

year15 = grep("2015", Arrest.Date)
Ayear15 = Arrest1[c(year15),]
A1year15 = subset(Ayear15,Arrest.Type.Code=='F')
dim(A1year15)

year14 = grep("2014", Arrest.Date)
Ayear14 = Arrest1[c(year14),]
A1year14 = subset(Ayear14,Arrest.Type.Code=='F')
dim(A1year14)

year13 = grep("2013", Arrest.Date)
Ayear13 = Arrest1[c(year13),]
A1year13 = subset(Ayear13,Arrest.Type.Code=='F')
dim(A1year13)

year12 = grep("2012", Arrest.Date)
Ayear12 = Arrest1[c(year12),]
A1year12 = subset(Ayear12,Arrest.Type.Code=='F')
dim(A1year12)

year11 = grep("2011", Arrest.Date)
Ayear11 = Arrest1[c(year11),]
A1year11 = subset(Ayear11,Arrest.Type.Code=='F')
dim(A1year11)

year10 = grep("2010", Arrest.Date)
Ayear10 = Arrest1[c(year10),]
A1year10 = subset(Ayear10,Arrest.Type.Code=='F')
dim(A1year10)
train.arrest = c(dim(A1year10)[1],dim(A1year11)[1],dim(A1year12)[1],dim(A1year13)[1],dim(A1year14)[1],
                 dim(A1year15)[1],dim(A1year16)[1],dim(A1year17)[1],dim(A1year18)[1])

test.arrest = c(dim(A1year19)[1])
test = data.frame(2019,test.arrest)
x = c(2010:2018)
train = data.frame(x,train.arrest)
plot(train, xlab="year", ylab="Felony arrest")
lm.fit=lm(train.arrest~x)
summary(lm.fit)
 
predict(lm.fit, data.frame(x=c(2019)), interval="confidence")
lm.fit1=predict(lm.fit, data.frame(x=c(2019)), interval="prediction")
abline(lm.fit,lwd=3,col="red")
plot(lm.fit1)

# How many arrest incidents occurred within 2 km from the Bradbury Building in 2018?
# remove the location=(0.0,0.0)
A2year18 = subset(Ayear18,Location!='(0.0, 0.0)')
dim(A2year18)
location = A2year18$Location

# remove "()"
locationsub = gsub("[()]","",location)
locationsub1 = data.frame(locationsub) 

library(tidyverse) # Use this package to divide tHe location to be Latitude and Longtitude
Seplocation=separate(data = locationsub1, col = locationsub, into = c("Lat", "Lon"), sep = ", ")
LatB = Seplocation$Lat
LonB = Seplocation$Lon
  
LatA = rep(34.050536,times=104260)
LonA = rep(-118.247861,times=104260)
# convert numeric
class(LonB)
LonB = as.numeric(LonB)
class(LatB)
LatB = as.numeric(LatB)

location3 = data.frame(LatA,LatB,LonA,LonB)

C = sin(LatA)*sin(LatB) + cos(LatA)*cos(LatB)*cos(LonA-LonB)
R = 6371
Distance = abs(R*acos(C)*pi/180)
Distance1 = data.frame(Distance)
Distance2 = subset(Distance1,Distance <= 2)
dim(Distance2)

# How many arrest incidents were made per kilometer on Pico Boulevard during 2018? 
# Consider all location data which the listed address mentions "Pico".
attach(Arrest)
ArrestP = grep("PICO",Address)
ArrestPico = data.frame(Arrest[c(ArrestP),])

location4 = ArrestPico$Location

# Remove outliers by filtering out locations where either the latitude or longitude is 2 standard deviations beyond the mean of the subset of identified points.
# remove "()"
locationsub2 = gsub("[()]","",location4)
locationsub3 = data.frame(locationsub2) 

library(tidyverse) # Use this package to divide tHe location to be Latitude and Longtitude
Seplocation1=separate(data = locationsub3, col = locationsub2, into = c("Lat", "Lon"), sep = ", ")
LatB4 = Seplocation1$Lat
LonB4 = Seplocation1$Lon
# convert numeric
class(LonB4)
LonB4 = as.numeric(LonB4)
class(LatB4)
LatB4 = as.numeric(LatB4)
c(mean(LatB4),mean(LonB4))
LatA4 = mean(LatB4)
LonA4 = mean(LonB4)
LatA4 = rep(LatA4,times=613)
LonA4 = rep(LonA4,times=613)
location5 = data.frame(LatA4,LatB4,LonA4,LonB4)
summary(location5)
plot(LatB4)
plot(LonB4)
sd(LatB4)
sd(LonB4)
par(mfrow=c(2,2))
lm.fit2=lm(LatB4~LonB4)
plot(lm.fit2)
summary(lm.fit2)
# in the plot, so we need to remove the point(168),(360)and(306)
LatB4 = LatB4[-306]
LatB4 = LatB4[-360]
LatB4 = LatB4[-168]

LonB4 = LonB4[-306]
LonB4 = LonB4[-360]
LonB4 = LonB4[-168]

lm.fit3=lm(LatB4~LonB4)
plot(lm.fit3)
summary(lm.fit3)
# To estimate the length, calculate the distance from the most western and eastern coordinate points. Use the spherical Earth projected to a plane equation for calculating distances.
which.max(LonB4)
LonB4[590] # -118.1739

which.min(LonB4)
LonB4[45] # -118.453

K1 = 111.13209-0.56605*cos(2*mean(LonB4))+0.0012*cos(4*mean(LonB4))
K2 = 111.41513*cos(mean(LonB4))-0.09455*cos(3*mean(LonB4))+0.00012*cos(5*mean(LonB4))
D1 = (K1*(-118.1739-mean(LonB4)))^2
D2 = (K2*(-118.453-mean(LonB4)))^2
D = sqrt(D1+D2)  # D=20.4590432544374
# report the number of arrest incidents per kilometer on Pico Boulevard in 2018.

Nparrest = 613/D # 29.9623004055699


# Report the average of the top 5 of the calculated ratio.
# Consider all records prior to January 1, 2019.
Ayear10_18=rbind(Ayear10,Ayear11,Ayear12,Ayear13,Ayear14,Ayear15,Ayear16,Ayear17,Ayear18)
A1year10_18 = subset(Ayear10_18,Charge.Group.Code!='NA')

table(A1year10_18$Area.ID)
table(A1year10_18$Charge.Group.Code)

Area1 = subset(A1year10_18,Area.ID == 1)
table(Area1$Charge.Group.Code)


# P = P11/P21 = (113*S)/(A1*2255) 
# P = p12/P22 = (188*s)/(A1*2714)
# S = 1151720, A1 = 116369


P1 = table(Area1$Charge.Group.Code)/table(A1year10_18$Charge.Group.Code)
# mean(P1)

Area2 = subset(A1year10_18,Area.ID == 2)
ta2 = table(Area2$Charge.Group.Code)
ta2[29] = NA # because Area2 don't have 99 code.But we need add
ta2
P2 = ta2/table(A1year10_18$Charge.Group.Code)

Area3 = subset(A1year10_18,Area.ID == 3)
ta3 = table(Area3$Charge.Group.Code)
ta3
ta3[29] = NA
P3 = ta3/table(A1year10_18$Charge.Group.Code)

Area4 = subset(A1year10_18,Area.ID == 4)
ta4 = table(Area4$Charge.Group.Code)
ta4
P4 = ta4/table(A1year10_18$Charge.Group.Code)

Area5 = subset(A1year10_18,Area.ID == 5)
ta5 = table(Area5$Charge.Group.Code)
ta5
ta5[29] = NA
P5 = ta5/table(A1year10_18$Charge.Group.Code)

Area6 = subset(A1year10_18,Area.ID == 6)
ta6 = table(Area6$Charge.Group.Code)
ta6
P6 = ta6/table(A1year10_18$Charge.Group.Code)

Area7 = subset(A1year10_18,Area.ID == 7)
ta7 = table(Area7$Charge.Group.Code)
ta7
ta7[29] = NA
P7 = ta7/table(A1year10_18$Charge.Group.Code)

Area8 = subset(A1year10_18,Area.ID == 8)
ta8 = table(Area8$Charge.Group.Code)
ta8
ta8[29] = NA
P8 = ta8/table(A1year10_18$Charge.Group.Code)

Area9 = subset(A1year10_18,Area.ID == 9)
ta9 = table(Area9$Charge.Group.Code)
ta9
ta9[29] = NA
P9 = ta9/table(A1year10_18$Charge.Group.Code)

Area10 = subset(A1year10_18,Area.ID == 10)
ta10 = table(Area10$Charge.Group.Code)
ta10
P10 = ta10/table(A1year10_18$Charge.Group.Code)

Area11 = subset(A1year10_18,Area.ID == 11)
ta11 = table(Area11$Charge.Group.Code)
ta11
ta11[29] = NA
P11 = ta11/table(A1year10_18$Charge.Group.Code)

Area12 = subset(A1year10_18,Area.ID == 12)
ta12 = table(Area12$Charge.Group.Code)
ta12
ta12[29] = NA
P12 = ta12/table(A1year10_18$Charge.Group.Code)

Area13 = subset(A1year10_18,Area.ID == 13)
ta13 = table(Area13$Charge.Group.Code)
ta13
ta13[29] = NA
P13 = ta13/table(A1year10_18$Charge.Group.Code)

Area14 = subset(A1year10_18,Area.ID == 14)
ta14 = table(Area14$Charge.Group.Code)
ta14
ta14[29] = NA
P14 = ta14/table(A1year10_18$Charge.Group.Code)

Area15 = subset(A1year10_18,Area.ID == 15)
ta15 = table(Area15$Charge.Group.Code)
ta15
ta15[29] = NA
P15 = ta15/table(A1year10_18$Charge.Group.Code)

Area16 = subset(A1year10_18,Area.ID == 16)
ta16 = table(Area16$Charge.Group.Code)
ta16
P16 = ta16/table(A1year10_18$Charge.Group.Code)

Area17 = subset(A1year10_18,Area.ID == 17)
ta17 = table(Area17$Charge.Group.Code)
ta17
ta17[29] = NA
P17 = ta17/table(A1year10_18$Charge.Group.Code)

Area18 = subset(A1year10_18,Area.ID == 18)
ta18 = table(Area18$Charge.Group.Code)
ta18
ta18[29] = NA
P18 = ta3/table(A1year10_18$Charge.Group.Code)

Area19 = subset(A1year10_18,Area.ID == 19)
ta19 = table(Area19$Charge.Group.Code)
ta19
ta19[29] = NA
P19 = ta19/table(A1year10_18$Charge.Group.Code)

Area20 = subset(A1year10_18,Area.ID == 20)
ta20 = table(Area20$Charge.Group.Code)
ta20
ta20[29] = NA
P20 = ta20/table(A1year10_18$Charge.Group.Code)

Area21 = subset(A1year10_18,Area.ID == 21)
ta21 = table(Area21$Charge.Group.Code)
ta21
ta21[29] = NA
P21 = ta21/table(A1year10_18$Charge.Group.Code)

# now use the equation before
# P = P11/P21 = (113*S)/(A1*2255)
# P = p12/P22 = (188*s)/(A1*2714)
# S = 1151720, A1 = 116369

S = 1151720
table(A1year10_18$Area.ID)

A = c(116369,56184,63703,37986,44126,102988,29067,25864,
      61337,36263,46219,65701,63482,74641,56024,43618,
      36660,45266,58456,47108,40658)

Ra1 = P1 * S / A[1]
Ra2 = P2 * S / A[2]
Ra3 = P3 * S / A[3]
Ra4 = P4 * S / A[4]
Ra5 = P5 * S / A[5]
Ra6 = P6 * S / A[6]
Ra7 = P7 * S / A[7]
Ra8 = P8 * S / A[8]
Ra9 = P9 * S / A[9]
Ra10 = P10 * S / A[10]
Ra11 = P11 * S / A[11]
Ra12 = P12 * S / A[12]
Ra13 = P13 * S / A[13]
Ra14 = P14 * S / A[14]
Ra15 = P15 * S / A[15]
Ra16 = P16 * S / A[16]
Ra17 = P17 * S / A[17]
Ra18 = P18 * S / A[18]
Ra19 = P19 * S / A[19]
Ra20 = P20 * S / A[20]
Ra21 = P21 * S / A[21]

Raall = data.frame(Ra1,Ra2,Ra3,Ra4,Ra5,Ra6,Ra7,Ra8,Ra9,
                   Ra10,Ra11,Ra12,Ra13,Ra14,Ra15,Ra16,
                   Ra17,Ra18,Ra19,Ra20,Ra21)
# The max 5
sort(c(Ra1,Ra2,Ra3,Ra4,Ra5,Ra6,Ra7,Ra8,Ra9,
       Ra10,Ra11,Ra12,Ra13,Ra14,Ra15,Ra16,
       Ra17,Ra18,Ra19,Ra20,Ra21))
# the average of the top 5 of the calculated ratio
ARatio = (3.19515727 + 3.77209933 + 4.33137020 + 5.31646370 + 9.07434181)/5
ARatio
