name "dbserver"
description "DB Server Role"
run_list "role[base]","recipe[mysql]"

