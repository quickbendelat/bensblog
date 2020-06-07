# change the date when updating the table 
tbl_update_date <- "2020-06-02"

# tie summary tablej for inputting new ties
ties_input_df <- ties_data <- tibble::tribble(~name,              ~no_ties, ~no_steps,  ~fold_in_half, ~end_tied_with, ~url,                                              ~shaping_difficulty,       ~no_loop_thrus,
                                              "double_eldredge",  2,        6,          "N",           "little", "https://www.youtube.com/watch?v=jLYWJX4779A",     3,                         3,  
                                              "double_trinity",   1,        6,          "N",           "little", "https://www.youtube.com/watch?v=6-0FdqYjv6s",     1,                         6,
                                              "eldredge",         1,        6,          "N",           "little", "https://www.youtube.com/watch?v=FXyWSAmwVZ4",     1,                         0,
                                              "eldredge2",        1,        6,          "N",           "little", "https://www.youtube.com/watch?v=FukqiewJuPw",     2,                         2,
                                              "trinity_eldredge", 1,        5,          "N",           "little", "https://www.youtube.com/watch?v=Ls_MgWrTVrk",     1,                         2,
                                              "trinity",          1,        4,          "N",           "little", "https://www.youtube.com/watch?v=IX_GixAhXeY",     2,                         2,
                                              "rosebud1",         1,        6,          "Y",           "little",       "https://www.youtube.com/watch?v=s-S1WSFTpuU",     2,                         1,
                                              "rosebud2",         1,        4,          "N",           "little",       "https://www.youtube.com/watch?v=-diYX2FH_AE",     2,                         0,
                                              "vidalia",          1,        5,          "N",           "little", "https://www.youtube.com/watch?v=ENYCWzrB9d8",     2,                         3,
                                              "valentine",        1,        5,          "Y",           "little", "https://www.youtube.com/watch?v=XwvNQYIZnSI",     3,                         1,
                                              "sweetheart",       1,        4,          "Y",           "little", "https://www.youtube.com/watch?v=nfoqEexLghI",     4,                         3,
                                              "romance",          1,        5,          "Y",           "little", "https://www.youtube.com/watch?v=XdRsQ3KuTqM",     3,                         5,
                                              "cupid",            1,        3,          "N",           "both", "https://www.youtube.com/watch?v=VWfEccMG_HI",     5,                         1,
                                              "vampire",          1,        5,          "Y",           "little", "https://www.youtube.com/watch?v=wFTkThHwagI",     1,                         0,
                                              "embrace",          1,        3,          "Y",           "little", "https://www.youtube.com/watch?v=mwfLpoyqeKE",     1,                         3,
                                              "deivao_twist",     1,        6,          "N",           "little", "https://www.youtube.com/watch?v=mCANkZKtES4",     1,                         3)  

# tie column definitions
base_tie_rating_tbl <- tibble::tribble(~shaping_diff, ~base,
                                        1,             1,
                                        2,             1.5,
                                        3,             2,
                                        4,             2.8,
                                        5,             3.2)

no_steps_mult_tbl <- tibble::tribble(~no_steps, ~mult,
                                     1,         1,
                                     2,         1,
                                     3,         1,
                                     4,         1.3,
                                     5,         1.3,
                                     6,         1.3,
                                     7,         1.5,
                                     8,         1.5,
                                     9,         1.5,
                                     10,        1.5)

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

no_ties_mult_tbl <- tibble::tribble(~no_ties, ~mult,
                                    1,         1,
                                    2,         1.2)

fold_in_half_mult_tbl <- tibble::tribble(~fold_in_half, ~mult,
                                         "N",         1,
                                         "Y",         1.3)

end_tied_mult_tbl <- tibble::tribble(~end_tied, ~mult,
                                     "little",  1,
                                     "big",     1.5,
                                     "both",    1.5)

# tie summary data table configured for the main page
ties_data <- ties_input_df  %>% 
  mutate(img_id = row_number(),
         close_id = img_id - 1,
         image = paste0('<img id="myImg', img_id, '" src="/img/', name, '.jpg"> <div id="myModal', img_id, '" class="modal"> <span class="close">&times;</span> <img class="modal-content" id="img', img_id,'"> <div id="caption"></div>
</div> <script>
// Get the modal
var modal = document.getElementById("myModal', img_id, '");

// Get the image and insert it inside the modal
var img = document.getElementById("myImg', img_id,'");
var modalImg = document.getElementById("img', img_id, '");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
}
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[', close_id, '];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}
</script>'),
         name = paste0("<a href='", url, "'target='_blank'>", name, "</a>")
  ) %>% 
  select(-url, -img_id, -close_id) %>% 
  mutate(overall_difficulty = pmap(list(shaping_difficulty, no_ties, no_steps, fold_in_half, no_loop_thrus, end_tied_with), tie_overalldiff_calc)) %>% 
  unnest(overall_difficulty) %>% 
  mutate(overall_difficulty = round(10 * overall_difficulty/max(overall_difficulty), digits = 2)) %>%
  select(name, overall_difficulty, image)

# detailed time summary data table
ties_detailed_tbl <- ties_input_df  %>% 
  mutate(image = paste0('<img src = "/img/', name, '.jpg"></img>'),
         name = paste0("<a href='", url, "'target='_blank'>", name, "</a>")
  ) %>% 
  mutate(overall_difficulty = pmap(list(shaping_difficulty, no_ties, no_steps, fold_in_half, no_loop_thrus, end_tied_with), tie_overalldiff_calc)) %>% 
  unnest(overall_difficulty) %>% 
  mutate(overall_difficulty = round(10 * overall_difficulty/max(overall_difficulty), digits = 2)) %>%
  select(name, overall_difficulty, shaping_difficulty, no_ties, no_steps, no_loop_thrus, image)
