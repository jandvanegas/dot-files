
return {
	settings = {
    metals = {
      cmd = {"metals"},
      filetypes = {"scala"},
      init_options = {
        compilerOptions = {
            snippetAutoIndent = false
            },
        isHttpEnabled = true,
        statusBarProvider = "show-message"
      },
      message_level = 4,
      root_dir = util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml")
    }
	}
}
