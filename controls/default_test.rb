control 'Chef Workstation is installed' do
  describe file('/opt/chef-workstation/bin/chef') do
    it { should exist }
  end

  describe command('/opt/chef-workstation/bin/chef --version') do
    its('stdout') { should match /Chef Workstation version: / }
  end
end

control 'Chef Workstation is at least 21.2.278' do
  # chef_version_output = command('/opt/chef-workstation/bin/chef --version').stdout
  # version = chef_version_output.match(/Chef Workstation version: (\d+\.\d+\.\d+)/)[1]
  # major_version = version.split('.')[0].to_i
  # minor_version = version.split('.')[1].to_i
  # patch_version = version.split('.')[2].to_i
  # # puts("'#{major_version}.#{minor_version}.#{patch_version}'")
  # describe(major_version) do
  #   it { should be >= 21 }
  # end
  # describe(minor_version) do
  #   it { should be >= 2 }
  # end
  # describe(patch_version) do
  #   it { should be >= 278 }
  # end

  describe(chefws_version) do
    its('major_version') { should be >= 21 }
    its('minor_version') { should be >= 2 }
    its('patch_version') { should be >= 278 }
  end
end
