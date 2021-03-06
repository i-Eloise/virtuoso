context("vos install")

test_that("Virtuoso is installed", {

  virtuoso:::vos_set_path()
  expect_message(vos_install(prompt = FALSE),
                 "Virtuoso installation found.")

})

test_that("We can download installers", {
  skip_on_os("mac") # slow download, annoying for local testing.
  skip_on_os("windows")
  skip_on_cran() ## slow download
  dmg <- download_osx_installer()
  expect_true(file.exists(dmg))

  exe <- download_windows_installer()
  expect_true(file.exists(exe))

})
