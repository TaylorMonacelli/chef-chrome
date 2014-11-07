# Chrome helper
module Chrome
  def chrome_version
    return unless platform?('windows')
    install_dir = node['chrome']['win_preferences'].slice(
      0,
      node['chrome']['win_preferences'].rindex('\\')
    )
    entries = ::Dir.entries(install_dir).reverse
    entries.each do |name|
      return name if name[/^[\d|.].*$/]
    end
  end
end

Chef::Provider.send(:include, Chrome)
Chef::Recipe.send(:include, Chrome)
Chef::Resource.send(:include, Chrome)
