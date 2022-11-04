# función apply2 Evaluacion1

apply2 <- function(df,margin,fun,...){
  rows <- dim(df)[1]
  cols <- dim(df)[2]
  
  r <- c()
  if (margin == 1){
        for (i in 1:rows){
          r[i] <- fun(as.numeric(df[i,]),...) 
        }
  } else if(margin == 2){
    for (i in 1:cols){
      r[i] <- fun(as.numeric(df[,i]),...)
    }
  } else message('error in margin')
  
  return(r)
}


