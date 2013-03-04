require 'happymapper'

xml = <<-EOF
<products> 
  <product> 
    <title> A Title</title> 
    <BrowseNode>
      <BrowseNodeId>111</BrowseNodeId>
      <Name>First Node</Name>
        <feature>feature 0000000</feature>
      <BrowseNode>
        <feature>This is feature text 1</feature>
        <feature>This is feature text 2</feature> 
      </BrowseNode>
      <BrowseNode>
        <feature>feature 3</feature>
        <feature>feature 4</feature>
      </BrowseNode>
    </BrowseNode>
  </product>
</products>
EOF


class Children < ActiveRecord::Base
  include HappyMapper
  
  has_many :BrowseNodes, Category


#class Feature
#  include HappyMapper
#
#  element :name, String, :tag => '.'
#end
#
#class FeatureBullet1
#  include HappyMapper
#
#  tag 'BrowseNode'
#  has_many :features, Feature
#end
#
#class Product
#  include HappyMapper
#
#  element :title, String
#  has_one :BrowseNode, FeatureBullet1
#end
#
#Product.parse(xml).each do |product|
#  puts product.title
#  product.BrowseNode.features.each { |f| puts "  - #{f.name}" }  
#end
end
