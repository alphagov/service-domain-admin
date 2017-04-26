class DomainsController < ApplicationController
  def index
    route53 = Aws::Route53::Client.new(region: 'eu-west-1')

    @domain_name = route53.get_hosted_zone(id: ENV['HOSTED_ZONE_ID']).hosted_zone.name
    @ns_records = route53.list_resource_record_sets(hosted_zone_id: ENV['HOSTED_ZONE_ID']).resource_record_sets.select { |set| set.type == 'NS' }.reject { |set| set.name == @domain_name }
  end
end
