tv <- function(input){
  #input can either be csv file or data	
  newdata <- if(is.character(input) && file.exists(input)){
    read.csv(input)
  } else {
    as.data.frame(input)
  }
  stopifnot("age" %in% names(newdata))
  stopifnot("marital" %in% names(newdata))
  
  newdata$age <- as.numeric(newdata$age)
  
  #tv_model is included with the package
  newdata$tv <- predict.gam(tv_model, newdata = newdata)
  return(newdata)
}