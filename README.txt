= vlad-merb

* http://bitbucket.org/krbullock/vlad-merb

== DESCRIPTION:

Merb support for Vlad. Vlad's documentation includes some example code to make
vlad:start and vlad:stop work with Merb; this plugin makes it so you don't have
to add it to every deploy file of every app, and makes it a bit more robust.

== FEATURES/PROBLEMS:

* Adds Merb support for vlad:start_app and vlad:stop_app tasks.

== SYNOPSIS:

    # lib/tasks/vlad.rake
    begin
      require 'vlad'
      Vlad.load(:app => :merb)
    rescue LoadError
    end

== REQUIREMENTS:

* Vlad[http://rubyhitsquad.com/Vlad_the_Deployer.html]

* Merb[http://www.merbivore.com/]

== INSTALL:

    $ sudo gem install vlad-merb

== VARIABLES:

merb_command::      Defaults to 'merb'.
merb_adapter::      The Rack adapter to use. Defaults to 'mongrel' See
                    'merb --help' for available adapters.
merb_environment::  The Merb environment to use (one of: development, test,
                    production).
merb_address::      The IP address to bind to. Defaults to '127.0.0.1'. Note
                    that this is different from Merb's default bind address.
merb_port::         The starting port that the Merb daemons should listen on.
                    Defaults to 4000.
merb_servers::      The number of Merb daemons to run. Defaults to 3.
merb_user::         The user that the Merb daemons should run as. Must be
                    specified along with merb_group.
merb_group::        The group that the Merb daemons should run as.

== LICENSE:

(The GNU General Public License v2)

Copyright (c) 2009 Kevin R. Bullock.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
