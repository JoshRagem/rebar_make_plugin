-module(rebar_make_resource).

-behavior(rebar_resource).

-export([lock/2
        ,download/3
        ,needs_update/2
        ,make_vsn/1]).

lock(Dir, {make, Source}) ->
    {make, rebar_git_resource:lock(Dir, Source)}.

download(Dir, {make, Source={git, _}}, State) ->
    rebar_git_resource:download(Dir, Source, State),
    rebar_utils:sh("make",[{cd, Dir}]);
download(Dir, {make, Source={git, _, _}}, State) ->
    rebar_git_resource:download(Dir, Source, State),
    rebar_utils:sh("make",[{cd, Dir}]).

needs_update(Dir, {make, Source}) ->
    rebar_git_resource:needs_update(Dir, Source).

make_vsn(Dir) ->
    rebar_git_resource:make_vsn(Dir).
