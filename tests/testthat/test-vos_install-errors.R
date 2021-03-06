context("vos install errors")


#
# Platform-specific tests are hard to evaluate on Linux-based CI
#

test_that("We can download the windows installer", {

  skip_on_cran()

  virtuoso:::download_windows_installer()

  })


test_that("We can set the correct paths", {

  skip_on_cran()
  #skip_on_os("linux")
  #skip_on_os("mac")

  virtuoso:::vos_set_path()
  expect_true(has_virtuoso())

})


test_that("We get errors running windows installer on non-windows",
          {
            skip_on_cran()
            skip_on_os("windows")
            expect_error(virtuoso:::vos_install_windows(prompt = FALSE))
            expect_error(vos_uninstall_windows())
          })


test_that("We get errors running mac installer on non-mac",
          {
            skip_on_cran()
            skip_on_os("mac")
            skip_on_os("windows")
#            expect_error(virtuoso:::vos_install_osx(prompt = FALSE))
#            expect_error(virtuoso:::vos_install_osx(brew = TRUE, prompt = FALSE))

            ## remarkably / scarily, this doesn't throw an error...
            #expect_error(virtuoso:::install_brew())


          })

test_that("We get error message on linux install", {

  ## only run by vos_install() if `virtuoso-t` not found in PATH

  expect_error(virtuoso:::vos_install_linux())
})
