include_recipe "chef_handler"

boundary_account = data_bag_item("boundary", "account")

cookbook_file "#{Chef::Config[:file_cache_path]}/chef-boundary-events-handler.rb" do
  source "chef-boundary-events-handler.rb"
  mode "0600"
end

chef_handler "BoundaryEvents" do
  source "#{Chef::Config[:file_cache_path]}/chef-boundary-events-handler.rb"
  arguments [
             :orgid => boundary_account["orgid"],
             :apikey => boundary_account["apikey"]
  ]
  action :enable
end
