include_recipe 'monit'

node['monit']['rake']['jobs'].each do |name, vars|
  monitrc name do
    template_source 'rake.conf.erb'
    variables name: name, job: vars['job']
  end
end
