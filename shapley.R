#Shapley standard formula computation from 1951
shapley_value_standard_formula <- function(i,set){
  if (i %in% unlist(strsplit(set, ","))){
    set_aux <- strsplit(set, ",")   # split by comma
    length_set<-length(set_aux[[1]])
    set_without_i_aux <- set_aux[[1]]
    set_without_i<-paste(set_without_i_aux[set_without_i_aux != i], collapse = ",")
    phi_i=(values[[set]]-values[[which(names(values) == set_without_i)]])*(factorial(length_set-1)*factorial(n-length_set))/factorial(n)
  
    return(phi_i)
  }
  else return(0)
}




#Shapley formula used by Wilson in 1991
shapley_value_wilson_findwho_formula <- function(i,set){
  set_aux <- strsplit(set, ",")   # split by comma
  length_set<-length(set_aux[[1]])
  if (i %in% unlist(strsplit(set, ","))){
    phi_i=(values[[set]])*(factorial(length_set-1)*factorial(n-length_set))/factorial(n)
    
    return(phi_i)
  }
  else {
    #It contains a transformation to avoid errors when the list is null
    phi_i=-(values[[which(names(values) == set)]])*(factorial(length_set)*factorial(n-length_set-1))/factorial(n)
    
    return(phi_i)
  }
}

#Shapley value computation with properly format transformations
shapley_value <- function(values,players){
  
  n<-length(strsplit(players, ",")[[1]])
  phi_values<-vector(mode = "list", length = 0)
  
  for (i in strsplit(players, ",")[[1]]) {
    phi_i <- 0
    for (set in names(values)){
      #phi_i=phi_i+shapley_value_standard_formula(i,set)
      phi_i=phi_i+shapley_value_wilson_findwho_formula(i,set)
    }
    phi_values[[i]]=phi_i 
  }
  return(phi_values)
}



#Inputs
values <- list(0, 1, 1, 2, 3, 4, 5, 6)
names(values) <- c("", "1", "2", "12", "1,2", "1,12", "2,12", "1,2,12")
players<-"1,2,12"

shapley_value(values,players)


