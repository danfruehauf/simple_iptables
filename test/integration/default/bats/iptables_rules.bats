@test "basic rules created" {
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT all -- \* \* 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED'
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT all -- lo \* 0.0.0.0/0 0.0.0.0/0'
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT tcp -- \* \* 0.0.0.0/0 0.0.0.0/0 tcp dpt:22'
}

@test "user defined rules created" {
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT tcp -- \* \* 192.168.0.0/24 0.0.0.0/0 state NEW tcp dpt:123'
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT tcp -- \* \* 192.168.0.0/24 0.0.0.0/0 state NEW tcp dpt:234'
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT tcp -- \* \* 192.168.10.0/24 0.0.0.0/0 state NEW tcp dpt:345'
  iptables -L INPUT -n -v | tr -s " " | grep 'ACCEPT tcp -- \* \* 192.168.10.0/24 0.0.0.0/0 state NEW tcp dpt:456'
}
