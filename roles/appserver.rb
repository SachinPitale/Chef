name "appserver"
description "App Server for HR"
run_list "recipe[apache::default]"
override_attributes({
"starter_name" => " Sachin",
})
