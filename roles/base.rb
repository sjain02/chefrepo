name "base"
description "contains recipe for all nodes"
run_list "recipe[security]", "recipe[localusers]"

