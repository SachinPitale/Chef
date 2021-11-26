name "webserver"
description "Web Server for HR"
run_list "recipe[apache::default]"
override_attributes({
"starter_name" => " Sachin",
})
