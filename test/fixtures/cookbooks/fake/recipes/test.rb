node.set['simple_iptables']['entries'] = [{ :data_bag => 'test1' }]

include_recipe "simple_iptables::default"
