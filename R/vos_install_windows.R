
download_windows_installer <- function(){
  exe <- "Virtuoso_OpenSource_Server_7.20.x64.exe"
  download_url <- paste0("https://sourceforge.net/projects/virtuoso/",
                         "files/virtuoso/7.2.5/",
                         "Virtuoso_OpenSource_Server_7.20.x64.exe")
  installer <- normalizePath(file.path(
    tempdir(),
    exe),
    mustWork = FALSE)
  message(paste("downloading", exe,  "..."))
  curl::curl_download(download_url,
                      installer)
  installer
}


#' @importFrom curl curl_download
vos_install_windows <- function(prompt = is_interactive()){
  installer <- system.file("windows",
                           "Virtuoso_OpenSource_Server_7.20.x64.exe",
                           package = "virtuoso")
  if(installer == "") # not packaged
    installer <- download_windows_installer()

  if(prompt){
    proceed <- askYesNo(paste(
      "R will open the Windows Installer in another window.",
      "When asked to 'Create DB and start Virtuoso', UNCHECK this option.",
      "Ready to proceed?\n"))
    if(!proceed) return(message("Install cancelled"))
    processx::run(installer)
  } else {
    message("Attempting unsupervised installation of Virtuoso Open Source")
    processx::run(installer,
                  c("/SP-", "/VERYSILENT", "/SUPPRESSMSGBOXES", '/TASKS=""'))
  ## NOTE: you can use `installer.exe /?` to see list of the above argument
  ## options in a Windows cmd shell

  }
}

#vos_set_path_windows <- function(vos_home = virtuoso_home_windows()){
#  bin_dir <- normalizePath(file.path(vos_home, "bin"), mustWork = FALSE)
#  lib_dir <- normalizePath(file.path(vos_home, "lib"), mustWork = FALSE)
#  path <- Sys.getenv("PATH")
#  if(!has_virtuoso())
#    Sys.setenv("PATH" = paste(path, bin_dir, lib_dir, sep=";"))
#}


vos_uninstall_windows <- function(vos_home = virtuoso_home_windows()){
  run(file.path(vos_home, "unins000.exe"))
}
