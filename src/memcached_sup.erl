-module(memcached_sup).
-behaviour(supervisor).

%% API
-export([
      start_link/0,
      connect/4
    ]).

%% Supervisor callbacks
-export([
      init/1
    ]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

connect(Super, Host, Port, Opts) ->
  supervisor:start_child(?MODULE, [Super, Host, Port, Opts]).

init(_Args) ->
  _Config = case application:get_env(memcached) of
    {ok, MC} -> MC;
           _ -> []
  end,
  Strategy = {simple_one_for_one, 5, 10},
  Planning = [
    {memcached, {memcached, start_link, []},
    temporary, brutal_kill, worker, [memcached]}
  ],
  {ok, {Strategy, Planning}}.

