cleaning <- function(penguins_raw){
    penguins_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments)%>%
    drop_na(culmen_length_mm)
}
