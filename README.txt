= vlad-merb

* http://hitsquad.rubyforge.org/vlad-merb/
* http://rubyforge.org/projects/hitsquad/
* http://bitbucket.org/krbullock/vlad-merb/

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
merb_use_sudo::     Whether to use sudo to run the 'merb' command on the remote
                    host. Probably necessary if specifying merb_user and
                    merb_group. Defaults to false.

== LICENSE:

(The MIT License)

Copyright (c) 2009 Kevin Bullock and the rest of the Ruby Hit Squad

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
