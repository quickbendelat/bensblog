tie_overalldiff_calc <- function(shaping_diff, no_ties, no_steps, fold_in_half, no_loops, end_tied) {
  
  no_ties_mult <- ifelse(no_ties == 1, 1, 1.2) 
  
  fold_in_half_mult <- ifelse(fold_in_half == "N", 1, 1.3) 
  
  end_tied_mult <- ifelse(end_tied == "both", 1.5, 1) 
  
  if(no_steps < 4) {
    no_steps_mult <- 1
  } else if(no_steps < 7) {
    no_steps_mult <- 1.3
  } else {
    no_steps_mult <- 1.5
  }
  
  no_loops_mult_tbl <- tibble::tribble(~no_loops,  ~mult,
                                       0,          1,
                                       1,          1.1,
                                       2,          1.2,
                                       3,          1.3,
                                       4,          1.5,
                                       5,          1.6,
                                       6,          1.7,
                                       7,          1.8,
                                       8,          1.9,
                                       9,          2.0,
                                       10,         2.1)
  
  no_loops_mult <- no_loops %>% 
    enframe(name = NULL, value = "no_loops") %>% 
    left_join(no_loops_mult_tbl, by = "no_loops") %>% 
    pull(mult)
  
  if(shaping_diff == 1) {
    base <- 1
  } else if(shaping_diff == 2) {
    base <- 1.5
  } else if(shaping_diff == 3) {
    base <- 2
  } else if(shaping_diff == 4) {
    base <- 2.8
  } else {
    base <- 3.2
  }
  
  overall_diff <- base * no_ties_mult * fold_in_half_mult * end_tied_mult  * no_steps_mult  * no_loops_mult
  
}