zvm_after_init() {
  # Ctrl+F -> fzf file picker (no hidden files)
  #bindkey '^F' _fzf_file_no_hidden

  # Ctrl+\ -> toggle autosuggestions (useful for screen recordings)
  bindkey '^\' autosuggest-toggle
}
