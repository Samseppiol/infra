CloudFormation do
    Parameter('VPC') do 
        String
    end 

    subnetdetails = {
        "ap-southeast-2a" => 1,
        "ap-southeast-2b" => 2,
        "ap-southeast-2c" => 3
    }
          
    subnetdetails.each do |k, v|
        cidr = "10.0.#{v}.0/24"
        name = "subnet-#{k}"
        EC2_Subnet(name) do
            VpcId Ref('VPC')
            CidrBlock "#{cidr}"
            AvailabilityZone "#{k}"
        end 
    end 
end