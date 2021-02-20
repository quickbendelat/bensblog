# change the date when updating the table 
tbl_update_date <- "2021-02-02"

# tie summary table for inputting new ties
ties_input_df <- tibble::tribble(
                                 ~name,                        ~no_ties, ~no_steps, ~no_loop_thrus, ~shaping_difficulty, ~fold_in_half, ~end_tied_with,  ~url,
                                 "viper",                      1,        6,         0,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=6_J77a5TedQ",
                                 "edison",                     1,        5,         2,              1,                   "Y",           "little",        "https://www.youtube.com/watch?v=mq9r0IGQ3SQ",
                                 "lily",                       1,        5,         1,              1,                   "Y",           "little",         NA,
                                 "fibonacci",                  1,        6,         4,              1,                   "Y",           "little",        "https://www.youtube.com/watch?v=JiNksSWvm2g",
                                 "fusion",                     1,        4,         2,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=aefkk3Hxl4c",
                                 "atomic",                     1,        4,         2,              4,                   "N",           "little",        "https://www.youtube.com/watch?v=ZZT1vXQfHUA",
                                 "nuclear",                    1,        5,         5,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=-7UoBjKQ4Dk",
                                 "pumpkin",                    1,        6,         3,              1,                   "Y",           "little",        "https://www.youtube.com/watch?v=pedx7iFho_Q",
                                 "vortex",                     1,        7,         0,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=SU156Kqs108",
                                 "tiephoon",                   1,        7,         0,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=whqtF9Y6zRo",
                                 "cyclone",                    1,        4,         4,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=I_-kkuascXk",
                                 "tornado",                    1,        7,         0,              3,                   "N",           "little",        "https://www.youtube.com/watch?v=KgfHW6-vevM",
                                 "hurricane",                  1,        5,         4,              1,                   "Y",           "little",        "https://www.youtube.com/watch?v=8puIctlO1j0",
                                 "romeo_and_juliet",           2,        7,         2,              4,                   "N",           "little",        "https://www.youtube.com/watch?v=eQmsYCISGrI",
                                 "celestial",                  1,        5,         0,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=wm_bgjakWpY",
                                 "astro",                      1,        8,         2,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=ZrfDjcjttLk",    
                                 "double_trinity2",            1,        7,         6,              1,                   "N",           "little",         NA,
                                 "supernova",                  1,        3,         1,              1,                   "Y",           "little",         NA,
                                 "cosmo",                      1,        6,         1,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=whxZ9j3rTgk",
                                 "nebula",                     1,        5,         0,              2,                   "N",           "little",         NA,
                                 "eclipse",                    1,        4,         1,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=IhbSTCJLJzU",
                                 "shuttle",                    1,        6,         3,              5,                   "Y",           "little",        "https://www.youtube.com/watch?v=Cb7wP8rWvnI",
                                 "singularity",                1,        4,         1,              2,                   "N",           "little",        "https://www.youtube.com/watch?v=1sBpxlEZ8wo",
                                 "saturn",                     1,        5,         1,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=LKzvTVtfPTU",  
                                 "conch",                      1,        6,         1,              3,                   "N",           "little",        "https://www.youtube.com/watch?v=UQYT-oGdpf4",
                                 "pentanity",                  1,        6,         3,              2,                   "N",           "little",         NA,
                                 "caped_eldredge",             1,        7,         4,              3,                   "Y",           "big",           "https://www.youtube.com/watch?v=6X3DdiKq-jc",
                                 "double_trinity_eldredge",    2,        7,         7,              1,                   "N",           "little",         NA,
                                 "double_intrinity",           2,        5,         4,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=G11Be_KRWr8",
                                 "water",                      1,        4,         2,              1,                   "Y",           "little",         NA,
                                 "intrinity",                  1,        4,         4,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=38uEMP_jEkg",
                                 "double_eldredge",            2,        6,         3,              3,                   "N",           "little",        "https://www.youtube.com/watch?v=jLYWJX4779A",
                                 "double_trinity",             1,        6,         6,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=6-0FdqYjv6s",
                                 "eldredge",                   1,        6,         0,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=FXyWSAmwVZ4",
                                 "eldredge2",                  1,        6,         2,              2,                   "N",           "little",        "https://www.youtube.com/watch?v=FukqiewJuPw",
                                 "trinity_eldredge",           1,        5,         2,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=Ls_MgWrTVrk",
                                 "trinity",                    1,        4,         2,              2,                   "N",           "little",        "https://www.youtube.com/watch?v=IX_GixAhXeY",
                                 "rosebud1",                   1,        6,         1,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=s-S1WSFTpuU",
                                 "rosebud2",                   1,        4,         0,              2,                   "N",           "little",        "https://www.youtube.com/watch?v=-diYX2FH_AE",
                                 "vidalia",                    1,        5,         3,              2,                   "N",           "little",        "https://www.youtube.com/watch?v=ENYCWzrB9d8",
                                 "valentine",                  1,        5,         1,              3,                   "Y",           "little",        "https://www.youtube.com/watch?v=XwvNQYIZnSI",
                                 "sweetheart",                 1,        4,         3,              4,                   "Y",           "little",        "https://www.youtube.com/watch?v=nfoqEexLghI",
                                 "romance",                    1,        5,         5,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=XdRsQ3KuTqM",
                                 "cupid",                      1,        3,         1,              5,                   "N",           "both",          "https://www.youtube.com/watch?v=VWfEccMG_HI",
                                 "vampire",                    1,        5,         0,              1,                   "Y",           "little",        "https://www.youtube.com/watch?v=wFTkThHwagI",
                                 "embrace",                    1,        3,         3,              2,                   "Y",           "little",        "https://www.youtube.com/watch?v=mwfLpoyqeKE",
                                 "deivao_twist",               1,        6,         3,              1,                   "N",           "little",        "https://www.youtube.com/watch?v=mCANkZKtES4"
                   )

# tie column definitions
base_tie_rating_tbl <- tibble::tribble(~shaping_diff, ~base,
                                        1,             1,
                                        2,             1.5,
                                        3,             2,
                                        4,             2.6,
                                        5,             3.2,
                                        6,             3.4,
                                        7,             3.6,
                                        8,             3.8)

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
         name = case_when(!is.na(url) ~ paste0("<a href='", url, "'target='_blank'>", name, "</a>"),
                          TRUE ~ name)
         ) %>% 
  select(-url, -img_id, -close_id) %>% 
  mutate(overall_difficulty = pmap(list(shaping_difficulty, no_ties, no_steps, fold_in_half, no_loop_thrus, end_tied_with), tie_overalldiff_calc)) %>% 
  unnest(overall_difficulty) %>% 
  mutate(overall_difficulty = round(10 * overall_difficulty/max(overall_difficulty), digits = 2)) %>%
  select(name, overall_difficulty, image)

# detailed time summary data table
ties_detailed_tbl <- ties_input_df  %>% 
  mutate(image = paste0('<img src = "/img/', name, '.jpg"></img>'),
         name = case_when(!is.na(url) ~ paste0("<a href='", url, "'target='_blank'>", name, "</a>"),
                          TRUE ~ name)
  ) %>% 
  mutate(overall_difficulty = pmap(list(shaping_difficulty, no_ties, no_steps, fold_in_half, no_loop_thrus, end_tied_with), tie_overalldiff_calc)) %>% 
  unnest(overall_difficulty) %>% 
  mutate(overall_difficulty = round(10 * overall_difficulty/max(overall_difficulty), digits = 2)) %>%
  select(name, overall_difficulty, shaping_difficulty, no_ties, no_steps, no_loop_thrus, fold_in_half, end_tied_with, image)
