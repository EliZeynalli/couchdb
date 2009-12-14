% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License. You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
% License for the specific language governing permissions and limitations under
% the License.

-module(couchweb_res_info).
-export([
    init/1,
    content_types_provided/2,
    to_json/2,
    to_text/2
]).

-include_lib("couchdb/couch_db.hrl").
-include_lib("webmachine/webmachine.hrl").

init([]) ->
    {ok, undefined}.
    
content_types_provided(Wrq, Ctx) ->
    {[
        {"application/json", to_json},
        {"text/plain", to_text},
        {"text/html", to_text}], Wrq, Ctx}.

to_json(RD, Ctx) ->
    Body = {[
        {couchdb, <<"Welcome">>},
        {version, list_to_binary(couch_server:get_version())}
    ]},
    {?JSON_ENCODE(Body) ++ <<"\n">>, RD, Ctx}.

to_text(RD, C0) ->
    {Json, RD1, C1} = to_json(RD, C0),
    {json_pp:print(binary_to_list(list_to_binary(Json))), RD1, C1}.
