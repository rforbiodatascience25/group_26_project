

# -------- function to load raw data --------------------------

raw_load_or_download <- function(data_file, data_url) {
  
  # Ensure Data folder exists
  data_folder <- file.path("..", "_raw")
  if (!dir.exists(data_folder)) {
    message("Creating ../_raw folder…")
    dir.create(data_folder, recursive = TRUE)
  }
  
  # Ensure data_file has full path
  if (!startsWith(data_file, file.path("..", "_raw"))) {
    data_file <- file.path(file.path("..", "_raw"), data_file)
  }
  
  # Load from disk OR download & save it through the link above: 
  if (file.exists(data_file)) {
    message(paste0("Loading ", data_file, " from local file…"))
    df <- read_csv(
      file = data_file,
      show_col_types = FALSE
    )
  } else {
    message("Local file not found. Downloading from WHO's website…")
    df <- read_csv(
      file = data_url,
      show_col_types = FALSE
    )
    message(paste0("Saving dataset to ", data_file, "."))
    write_csv(
      x = df,
      file = data_file
    )
  }
  df
}



# ----------------------------------------------------------------------