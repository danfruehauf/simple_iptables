node.set['simple_iptables_ng']['entries'] = [{ :data_bag => 'test1' }]

include_recipe "simple_iptables_ng::default"
