service "tomcat6" do
  supports :restart => true, :status => true
  action [:enable, :start]
end

directory node[:solr][:data_dir] do
  owner "tomcat6"
  group "tomcat6"
  recursive true
  action :create
end

template File.join(node[:solr][:config_dir], "solrconfig.xml") do
  source "solrconfig.xml.erb"
  variables({
    :max_time => node[:solr][:max_time],
    :data_dir => node[:solr][:data_dir],
    :write_lock_timeout => node[:solr][:write_lock_timeout]
  })
  notifies :restart, "service[tomcat6]", :delayed
end

