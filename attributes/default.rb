# For package install
default[:tomcat][:version] = "6.0.35-1ubuntu3.4"

# For archive download and install
default[:solr][:version] = ""
default[:solr][:download_url] = ""
default[:solr][:archive_name] = ""
default[:solr][:war_name] = ""
default[:solr][:base_dir] = "/var/solr"
default[:solr][:package_version] = "1.4.1+dfsg1-2ubuntu2"
default[:solr][:max_time] = 5000

default[:solr][:multicore][:enabled] = false

default[:solr][:replication][:enabled] = false
default[:solr][:replication][:poll_interval] = "00:00:60"
default[:solr][:port] = 8983
