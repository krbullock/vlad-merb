# vlad-merb - Merb support for Vlad
# Copyright (c) 2009 Kevin R. Bullock. 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

require 'vlad'

module Vlad
  module Merb
    # Only needed to mollify Hoe.
    VERSION = '2.0.0'
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
  set :use_sudo,          nil

  # maybe needed later
  #set :merb_log_file,      nil
  #set :merb_pid_file,      nil
  #set :merb_prefix,        nil

  # Runs +cmd+ using sudo if the +:use_sudo+ variable is set.
  def maybe_sudo(cmd)
    if use_sudo
      sudo cmd
    else
      run cmd
    end
  end

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
    maybe_sudo cmd
  end

  desc "Stop the app servers"
  remote_task :stop_app, :roles => :app do
    cmd = "#{merb_command} -m #{current_path} -K all"
    maybe_sudo cmd
  end
end
