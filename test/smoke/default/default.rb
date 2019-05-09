describe directory('/opt/packages/') do
  it { should exist }
end

describe file('/opt/packages/CylancePROTECT.el7.rpm') do
  it { should exist }
end

describe directory('/opt/cylance') do
  it { should exist }
end

describe file('/opt/cylance/config_defaults.txt') do
  it { should exist }
end

describe service('cylancesvc') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
