#!/usr/bin/env bash

# Copyright 2017 F5 Networks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

while true; do
    string=`tmsh show sys failover`
    if [[ $string == *"active"* ]]
    then
        break
    else
        echo "runlevel is 'unknown' - waiting for 10s"
        sleep 10
    fi
done
echo "runlevel is now valid."
exit 0