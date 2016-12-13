-module(rebar_make_plugin).

-export([init/1]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    {ok, rebar_state:add_resource(State, {make, rebar_make_resource})}.
