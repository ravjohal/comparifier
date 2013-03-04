# require 'railsmachine/recipes'

#default_environment["PATH"] = "/usr/local/bin:/usr/bin:/usr/local/bin:/usr/ccs/bin:/export/home/rails/flex2_sdk/bin"
#default_environment["LD_LIBRARY_PATH"] = "/lib:/usr/lib:/usr/local/lib"

set :application, "comparifier"
set :repository, "http://svn2.assembla.com/svn/MySideProject/trunk/teamIT/dev/comparifier"
# set :repository,  "svn://wiki.provade.com/PunchoutTester/trunk"
set :use_sudo, false
set :checkout, "export"
set :user, "comparif"
set :password, "teamIT4money"
set :scm_user, "teamitdeveloper"
set :scm_password, "letmeinNOW"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set(:deploy_to) {"/home1/comparif/ror/comparifier/test/#{application}"}

#TODO: Need to copy Main.html, Main.swf, AC_Otags, history folder to the public folder...also, rename that damn Main.html at some point...right?
#TODO: Change the permissions to 775 with the chmod -R 775 [file] command!!!!!

set(:mongrel_conf) {"#{current_path}/config/mongrel_cluster.yml"}

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "test.comparifier.com"
role :web, "test.comparifier.com"
role :db,  "test.comparifier.com", :primary => true

#desc 'Copy production specific files from server-side repo to their proper places in the rails folder structure'
#task :copy_production_config, :role=>:app do
#  run("cp /home1/comparif/ror/comparifier/test/#{application}/prodfiles/config/*.* #{current_path}/config")
#end
#
desc 'CANNOT DO THE SOME OF FOLLOWING TASK BECAUSE THE FLEX FILES, WHEN COMPILED ARE NOT VERSIONED ANY LONGER....THEREFORE DO NOT EXIST ON SVN SERVER'
task :copy_static_files, :role=>:app do
  run("cp -r #{current_path}/public/bin/history #{current_path}/public")
  run("cp -r #{shared_path}/config/* #{current_path}/config")
  run("cp -Ra #{shared_path}/public/.htaccess #{current_path}/public")
  run("cp -r #{shared_path}/public/* #{current_path}/public")
end

desc 'Change the permissions of the current folder and its subcontents to 755'
task :change_permissions, :role=>:app do
  run("chmod -R 755 #{current_path}")
  copy_static_files
end

task :create_swf_files, :role=>:app do
#  run("cd #{current_path}; mxmlc -output public/tester.swf -services config/WEB-INF/flex/services-config.xml -context-root '/weborb' flex/tester.mxml") # build tester.swf
#  run("cd #{current_path}; mxmlc -output public/Main.swf -context-root app/flex/comparifier/src/Main.mxml") # build tester.swf
end
#
#desc 'Restart mongrel cluster'
#task :after_update, :role=>:app do
##  copy_production_config
##  restart_mongrel_cluster
#  create_swf_files
#end

after 'deploy:symlink', 'change_permissions'





# require 'railsmachine/recipes'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

#set :application, "comparifier"             # Can be whatever you want, I use the project name from my SVN repository
#set :domain, "comparifier.com"                           # The URL for your app
#set :user, "comparif"                                 # Your HostingRails username
#
## For a Subversion repository
#set :repository,  "http://svn2.assembla.com/svn/MySideProject/trunk/teamIT/dev/comparifier"   # The repository location for svn+ssh access
## set :repository, "http://svn.#{domain}/svn/#{application}/trunk"                      # The repository location for http access from the server
## set :local_repository, "http://svn.#{domain}:port/svn/#{application}/trunk"           # The repository location for http access from the local machine (this could be different from above if you use ssh port forwarding for svn access
#
##set :scm_username, "icebox49"                   #if http
##set :scm_password, "ankit82"                   #if http
#
#set :use_sudo, false                                  # HostingRails users don't have sudo access
#set :deploy_to, "/home/comparif/ror/comparifier/teamIT/dev/comparifier"   # Where on the server your app will be deployed
#set :deploy_via, :checkout                            # For this tutorial, svn checkout will be the deployment method, but check out :remote_cache in the future
#set :group_writable, false                            # By default, Capistrano makes the release group-writable. You don't want this with HostingRails
#set :mongrel_port, "12002"                           # Mongrel port that was assigned to you
## set :mongrel_nodes, "4"                             # Number of Mongrel instances for those with multiple Mongrels
#
#default_run_options[:pty] = true
## Cap won't work on windows without the above line, see
## http://groups.google.com/group/capistrano/browse_thread/thread/13b029f75b61c09d
## Its OK to leave it true for Linux/Mac
#
#ssh_options[:keys] = %w(teamIT.pub)              # If you are using ssh_keys
#
#role :app, domain
#role :web, domain
#role :db,  domain, :primary => true
#
#desc 'Copy production specific files from server-side repo to their proper places in the rails folder structure'
#task :copy_production_config, :role=>:app do
#  run("cp /export/home/rails/rbdocs/#{application}/prodfiles/config/*.* #{current_path}/config")
#end
#
#task :create_swf_files, :role=>:app do
#  run("cd #{current_path}; mxmlc -output public/tester.swf -services config/WEB-INF/flex/services-config.xml -context-root '/weborb' flex/tester.mxml") # build tester.swf
#  run("cd #{current_path}; mxmlc -output public/PODispatch.swf -services config/WEB-INF/flex/services-config.xml -context-root '/weborb' flex/PODispatch.mxml") # build tester.swf
#end
#
#desc 'Restart mongrel cluster'
#task :after_update, :role=>:app do
#  copy_production_config
#  restart_mongrel_cluster
#  create_swf_files
#end