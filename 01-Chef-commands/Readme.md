# Bootstrap the node
```
knife bootstrap <public ip> --connection-user 'admin' --connection-password '<your ip>' --sudo --node-name 'vm2'
```

# List the chef nodes
```
knife node list
```

# Genreate the cookbook
```
chef generate cookbook myapache -b --chef-license accept
```

# upload the recipe to the chef server
```
berks upload
```

# Run chef client 
```
sudo chef-client
```

# Generate Receipe
```
chef generate recipe . lamp
```

# check the receipe syntax
'''
ruby -c recipe_name
'''

# Run the converge 
'''
kitchen converge default-redhat8
'''

# login the 
'''
kitchen login default-redhat8

'''

# To  get node parameter run following command in inside the kitchen
'''
ohai
'''