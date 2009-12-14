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

{application, couchweb,
 [{description, "CouchDB Web Interface"},
  {vsn, "0.1"},
  {modules, [
	     couchweb,
	     couchweb_app,
         couchweb_res_all_dbs,
		 couchweb_res_db,
         couchweb_res_info,
         couchweb_res_uuids,
	     couchweb_sup,
		 json_pp
	    ]},
  {registered, []},
  {mod, {couchweb_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
