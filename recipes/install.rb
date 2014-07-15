['xmx_percent', 'xms_percent'].each do |attr|
  if node['solr']['tomcat'][attr].to_i >= 90 then
    log "xmx_issue" do
      message "#{attr} value #{node['solr']['tomcat'][attr]}% is too high! Overriding with a sane value"
      level :warn
    end
    node.normal['solr']['tomcat'][attr] = 80
  end
end

['xmx', 'xms'].each do |attr|
  node.normal['solr']['tomcat'][attr] = node['memory']['total'].to_i/1024 * node['solr']['tomcat']["#{attr}_percent"].to_i/100
end

custom_options = node[:tomcat][:java_options_custom]
node.normal[:tomcat][:java_options] = "-Xmx#{node['solr']['tomcat']['xmx']} -Xms#{node['solr']['tomcat']['xms']} -Djava.awt.headless=true -XX:+UseConcMarkSweepGC #{custom_options}"

include_recipe 'tomcat'

case node[:solr][:install_method]
when 'from_archive'
  include_recipe 'chef-solr::from_archive'
when 'from_package'
  include_recipe 'chef-solr::from_package'
else
  Chef::Log.info("You must set an install method via node[:solr][:install_method]")
end
