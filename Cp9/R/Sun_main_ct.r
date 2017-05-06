#setwd("C:\\Users\\mdas\\Desktop\\Data Science\\workflow analysis\\Automation\\Cp9\\R")

# the input file containing the event sequence
inputFileName="cp9_wa_ct_all.csv"

# the start state. As per the encoded string in the imput data
start_state="launch"


# workflow levels limit.
limit=10 #%LIMIT%

df_ct <- extractEventSequence(inputFileName, start_state, limit)
print("extractEventSequence")

#print(df)

#export df to df_cols.csv
#df_col_sun <- read.csv(textConnection(df_sun[["V1"]]), header = FALSE)
#convert our comma separated DF dataframe into one with columns
write.csv(df_ct, file="cp9_sun_ct.csv")