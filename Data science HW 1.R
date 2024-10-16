#Homework 1- SDS
#1. How many of these bonds were approved by voters, and how many were defeated? Are there any differences in the rates of approved bonds across the four different government types?  Calculate the appropriate descriptive statistics to answer these questions.

#this is the table for how much was carried and defeated in the results
table(Homework1_Bonds$Result)

#this is to calculate the percentages of how many carried and defeated in four different types of government
prop.table(table(Homework1_Bonds$Type,Homework1_Bonds$Result), 1)

#2. Some of these bonds were on the ballot during presidential elections and therefore had very high voter turnout. Calculate a new variable in the dataframe called “Votes_Total” that is the sum of the votes “for” and “against” the bond measure.  When and where did the bond measure with the highest voter turnout occur? What was it for?

#make a new dataframe that is called Votes_Total which indicate the sum of votes for and votes against
Homework1_Bonds$Votes_Total <- Homework1_Bonds$VotesFor + Homework1_Bonds$VotesAgainst

#this is to find when there was a maximum Votes total
which.max(Homework1_Bonds$Votes_Total)

#this is to find the all information about row 1072
Homework1_Bonds[1072,]

#3. Let’s look at the margins by which the carried bonds were approved, ignoring those with very low voter turnout. Create a subset of this dataset that contains the bond measures that were approved and had at least 100 total votes.Next, create a new variable within the subset dataframe that gives the percentage of total votes that were for the bond measure and make a graph of the distribution of this new variable. Describe its distribution with the appropriate statistics.

#make a new subset that has more than 100 total votes and result was carried
Bonds100 <- Homework1_Bonds[Homework1_Bonds$Votes_Total >= 100 & Homework1_Bonds$Result == 'Carried', ]

#this is to add the column that gives the proportion of votes for the bond
Bonds100$percentages <- Bonds100$VotesFor/Bonds100$Votes_Total

#histogram that showsthe proportion of votes that has least 100 votes
hist(Bonds100$percentages, main='Histogram of Bonds100', xlab = 'Percentages(%)' )

#this shows minimum, 1st quartile, median, 3rd quartile, and maximum
fivenum(Bonds100$percentages)

#4. Is the margin a bond was approved by related to its cost?Use your subset from #3 to create a graph to display this relationship. Then, answer this question, citing the appropriate descriptive statistic. 

#this shows correlation of proportion vote and costs
cor(Bonds100$percentages, Bonds100$Amount)

#graph that shows relationship between the margin a bond was approved and costs
plot(Bonds100$percentages,
     main='Proportion of Votes For and Cost',
     xlab='Proportion of Votes For', ylab='cost')

#I like men
