pkgs <- read.table("package.list")[,1]
install.packages(pkgs)
