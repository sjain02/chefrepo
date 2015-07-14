default["apache"]["sites"]["saurabhjain1"]={ "site_title" => "Saurabh Jain Website", "port"=> 80, "domain" => "saurabhjain1.mylabserver.com" }
default["apache"]["sites"]["saurabhjain1b"]={ "site_title" => "Saurabh Jain2 Website", "port" => 80, "domain" => "saurabhjain1b.mylabserver.com" }
default["apache"]["sites"]["saurabhjain2"]={ "site_title" => "Saurabh Jain2 Website", "port" => 80, "domain" => "saurabhjain2.mylabserver.com" }

case node["platform"]
	when "ubuntu"
		default["apache"]["package"]="apache2"
	when "centos"
		default["apache"]["package"]="httpd"
end

