 module CaKnifePlugins
 require 'chef/rest'
 require 'json'
    class CaRecipes < Chef::Knife
    banner "knife ca recipes VALUE"
    def run 
      output = "[" 
      recipes = []
      environment = config[:environment]
      recipes_json =  rest.get_rest("/environments/#{environment}/recipes")
      cookbooks_json = rest.post_rest("/environments/#{environment}/cookbook_versions", { 'run_list' => recipes_json })
      cookbooks_json.each do |key, value|

        next unless value.manifest["recipes"]
        cookbookname = value.manifest[:cookbook_name]

        value.manifest["recipes"].each do |manifest_record|
          checksum = manifest_record[:checksum]
          path = manifest_record[:path]
          recipename = manifest_record[:name]
          recipename.gsub!('.rb','')

          output = output + "\"#{cookbookname}::#{recipename}::#{value.version}::#{checksum}\","

        end
      end

      output = output.chop
      output = output + "]"
      puts output

    end
  end
end
