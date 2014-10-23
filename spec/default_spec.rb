require 'spec_helper'
 
describe 'simple_iptables_ng::default' do
  let (:chef_run) do
    ChefSpec::Runner.new do |node|
      node.automatic.merge!(JSON.parse(File.read('test/fixtures/nodes/test.json')))
    end.converge(described_recipe)
  end

  before do
    stub_data_bag_item("simple_iptables_ng", "test1").and_return(JSON.parse(File.read('test/fixtures/data_bags/simple_iptables_ng/test1.json')))
  end

  it 'should include iptables-ng recipe' do
    expect(chef_run).to include_recipe 'iptables-ng::install'
  end

  it 'should create mandatory rules' do
    expect(chef_run).to create_iptables_ng_rule('000_established_conns').
      with(rule: '-m state --state RELATED,ESTABLISHED -j ACCEPT')

    expect(chef_run).to create_iptables_ng_rule('000_localhost').
      with(rule: '-i lo -j ACCEPT')
  end

  it 'should create policies' do
    expect(chef_run).to create_iptables_ng_chain('INPUT').
      with(policy: 'DROP [0:0]')

    expect(chef_run).to create_iptables_ng_chain('OUTPUT').
      with(policy: 'ACCEPT [0:0]')
  end

  it 'should create rules from node definition' do
    expect(chef_run).to create_iptables_ng_rule('chef_iptables_0').
      with(rule: '-p tcp -m state --state NEW -s 10.0.0.1/32 --dport 22 -j ACCEPT')
  end

  it 'should create rules from data bags' do
    expect(chef_run).to create_iptables_ng_rule('chef_iptables_1').
      with(rule: '-p tcp -m state --state NEW -s 192.168.0.0/24 --dport 123 -j ACCEPT')

    expect(chef_run).to create_iptables_ng_rule('chef_iptables_2').
      with(rule: '-p tcp -m state --state NEW -s 192.168.0.0/24 --dport 234 -j ACCEPT')

    expect(chef_run).to create_iptables_ng_rule('chef_iptables_3').
      with(rule: '-p tcp -m state --state NEW -s 192.168.10.0/24 --dport 345 -j ACCEPT')

    expect(chef_run).to create_iptables_ng_rule('chef_iptables_4').
      with(rule: '-p tcp -m state --state NEW -s 192.168.10.0/24 --dport 456 -j ACCEPT')
  end
end
