{application,memcached_client,
             [{description,"Memcached Client"},
              {vsn,"0.1.0"},
              {modules,[chash,memcached,memcached_app,memcached_sup]},
              {registered,[memcached_sup]},
              {env,[{memcached,[{"127.0.0.1",11211}]}]},
              {mod,{memcached_app,[]}},
              {applications,[kernel,stdlib]}]}.
