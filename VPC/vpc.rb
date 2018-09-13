CloudFormation do

    Parameter('VpcCidr') do 
        String
        AllowedPattern '((\d{1,3})\.){3}\d{1,3}/\d{1,2}'
        Description 'Designated IP range for the vpc'
    end

    Parameter('VpcName') do 
        String 
    end

    Parameter('Environment') do 
        String 
        AllowedPattern '[A-Za-z]+'
    end

    Parameter('PublicSubnetCidr') do 
        String 
        AllowedPattern '((\d{1,3})\.){3}\d{1,3}/\d{1,2}'
    end 

    Parameter('PrivateSubnetCidr') do 
        String 
        AllowedPattern '((\d{1,3})\.){3}\d{1,3}/\d{1,2}'
    end 

    Mapping('SubnetForRegion', 'ap-northeast-1': {
        AvailabilityZoneOne: 'ap-northeast-1a',
        AvailabilityZoneTwo: 'ap-northeast-1c'
    })

    EC2_VPC(:VPC) do 
        CidrBlock Ref('VpcCidr')
        EnableDnsSupport 'true'
        EnableDnsHostnames 'true'
        InstanceTenancy 'default'
        Tags [{
            "Key": "Name",
            "Value": Ref('VpcName')
        }]
    end

    EC2_InternetGateway(:InternetGateway) do 
        Tags [{
            "Key": "Name",
            "Value": "InternetGateway"
        }]            
    end
    
    EC2_VPCGatewayAttachment(:AttachGateway) do 
        VpcId Ref('VPC')
        InternetGatewayId Ref('InternetGateway')    
    end

    EC2_RouteTable(:PublicRouteTable) do 
        VpcId Ref('VPC')
        Tags [{
            "Key" => "Name",
            "Value" => "PublicRouteTable"
        }]
    end

    EC2_Route(:PublicRoute) do 
        DependsOn :InternetGateway
        RouteTableId Ref('PublicRouteTable')
        DestinationCidrBlock '0.0.0.0/0'
        GatewayId Ref('InternetGateway')
    end

    EC2_Subnet('PublicSubnet') do 
        VpcId Ref('VPC')
        CidrBlock Ref('PublicSubnetCidr')
        AvailabilityZone FnFindInMap('SubnetForRegion', Ref('AWS::Region'), :AvailabilityZoneOne)
    end
end 