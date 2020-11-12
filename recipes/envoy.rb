# frozen_string_literal: true

# SPDX-FileCopyrightText: (c) 2020 Begley Brothers Inc. <BegleyBrothers@gmail.com>
# SPDX-License-Identifier: All Rights Reserved
#

#
# Cookbook:: kfchub
# Recipe:: envoy
#
# Copyright:: 2020, Begley Brothers Inc., All Rights Reserved.

execute 'curl -L https://getenvoy.io/cli | bash -s -- -b /usr/local/bin'
execute "getenvoy run standard:#{nodet['envoy']['version']} -- --version"
