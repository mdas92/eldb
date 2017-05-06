
extractEventSequence <- function(inputFileName, start_state, limit, oFileName = "") {
  
  # read the input file to create sequence
  df <- read.csv(inputFileName, header = TRUE, quote = "\"", stringsAsFactors = FALSE, strip.white = TRUE);
  odf <- data.frame()
  eventList <- strsplit(df[,3], ',')
  sessionList <- df[,2]
  
  idx=1
  
  print("no. of event sequences")
  print(length(eventList))  
  
  for( j in 1:length(eventList)) {
    print(j)
    eventSeq <- eventList[j]
    sessionNo <- sessionList[j]
    pos=0 # pos is the position of the start state in the event sequence
    eventVector_temp <- unlist(eventSeq)
    
 #   progress <- j*100/length(eventList)
#    if(progress %% 10 ==0)
#      print(paste0("Progress %: ", progress))
    
    eventVector=c()
    count=1
    eventVector[count]<-eventVector_temp[1]
    if(length(eventVector_temp)>1)
    {
      for(i in 2:length(eventVector_temp))
      {
        if(identical(eventVector[count],eventVector_temp[i])==FALSE){
          count=count+1
          eventVector[count]<-eventVector_temp[i]
        }
      }
    }
    
    newEventVector <- c()
    max_it=length(eventVector)
    
    pos <- match(start_state, eventVector, nomatch = 0)
    
    # if start_state is not present skip the event sequence
    if(pos==0)
      next
    
    
    #removing vectors with less than 2 events
    if(max_it<3)
      next
    
    newEventVector[1]= toString(sessionNo)
    newEventVector[2]= "start"
    newEventVector[3]= start_state
    
    
    # assign sequence number from the start state
    if(max_it<(pos+limit) ) { 
      if((pos+1)<=max_it) {
        tmp = paste(eventVector[pos],"-",sep="")
        for( i in (pos+1):max_it) 
        { 
          len=length(newEventVector)
          #modify naming scheme
          if(i != pos+1)
            tmp = paste(tmp,eventVector[i-1],"-",sep="")
          
          newEventVector[len+1] = paste(tmp,eventVector[i],sep = "")
          
        }
      }
      newEventVector[(length(newEventVector)+1)] = paste(newEventVector[length(newEventVector)],"-",'end',sep = "")
    }
    else 
    {
      max_it=limit+pos
      if((pos+1)<=max_it) {
        tmp = paste(eventVector[pos],"-",sep="")
        for( i in (pos+1):max_it) 
        { 
          len=length(newEventVector)
          #modify naming scheme
          if(i != pos+1)
            tmp = paste(tmp,eventVector[i-1],"-",sep="")
          
          newEventVector[len+1] = paste(tmp,eventVector[i],sep = "")
          
        }
      }
    }
    #   print(cnt)
    #print(newEventVector)
    
    if(idx!=0)
    {     #if a session has only Start and End, then omit it.
      if(length(newEventVector)<=5)
        next
      
      odf[idx,1] = paste(newEventVector[length(newEventVector)],sep = "", collapse = ",")
      idx=idx+1
    }
  }
  return(odf)
}

