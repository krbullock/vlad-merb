require 'vlad'

module Vlad
  module Merb
    VERSION = '2.0.0' #:nodoc:

    # Runs +cmd+ using sudo if the +:merb_use_sudo+ variable is set.
    def self.maybe_sudo(cmd)
      if merb_use_sudo
        sudo cmd
      else
        run cmd
      end
    end
  end
end

namespace :vlad do
  ##
  # Merb app server

  set :merb_command,      "merb"
  set :merb_adapter,      nil
  set :merb_environment,  "production"
  set :merb_address,      "127.0.0.1"
  set :merb_port,         4000
  set :merb_servers,      3
  set :merb_user,         nil
  set :merb_group,        nil
  set :merb_use_sudo,     nil

  # maybe needed later
  #set :merb_log_file,      nil
  #set :merb_pid_file,      nil
  #set :merb_prefix,        nil

  desc "(Re)Start the app servers"
  remote_task :start_app, :roles => :app do
    Rake::Task['vlad:stop_app'].invoke
    cmd = "#{merb_command} -m #{current_path}"
    cmd << " --adapter #{merb_adapter}" if merb_adapter
    cmd << " --environment #{merb_environment}"
    cmd << " --host #{merb_address}"
    cmd << " --port #{merb_port}"
    cmd << " --cluster-nodes #{merb_servers}"
    cmd << " --user #{merb_user}" if merb_user
    cmd << " --group #{merb_group}" if merb_group
    Vlad::Merb.maybe_sudo cmd
  end

  desc "Stop the app servers"
  remote_task :stop_app, :roles => :app do
    cmd = "#{merb_command} -m #{current_path} -K all"
    Vlad::Merb.maybe_sudo cmd
  end
end
