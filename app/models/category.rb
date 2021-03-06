require 'rubygems'
require 'rexml/document'
require 'happymapper'

class Category < ActiveRecord::Base
has_many :comparifier_attributes
has_many :items

include REXML
#include HappyMapper
#
#tag 'BrowseNode'
#element :vendorCategoryId, String, :tag=>'BrowseNodeId'
#element :name, String, :tag=>'Name'

#has_one :children, Children


# this is being used for the xml way...
  def from_xml(xml, searchIndex)
    browse_categories = []
    # Will take in each BrowseNode element //BrowseNodeLookupResponse/BrowseNodes/BrowseNode
     
#    parentId = xml.elements['BrowseNodeId[1]'].text
#    parentName = xml.elements['Name[1]'].text

    parentId = xml.attributes['BrowseNodeId']
    parentName = xml.attributes['Name']

    p "name: " + parentName + " id: " + parentId + " !!!!!!!"
    xml.each_element("//Children/BrowseNode"){|element|
      browseNodeId = element.attributes['BrowseNodeId']
      name = element.attributes['Name']
      category = Category.new
      category.name = name
      category.description = name + " " + browseNodeId
      category.vendorCategoryId = browseNodeId
      category.vendor = "Amazon"
      category.parentCategoryId = parentId
      category.searchIndex = searchIndex
      category.parentCategoryName = parentName
      category.operation = "BrowseNodeLookup"
      
      puts "\n NAME: \n" + name + " \n";
      
      #I am not including any general categories that were requested into the array that will be sent off to Flex
#      if name != "" && !(requestBrowseIds.include?(browseNodeId))
        browse_categories.push(category)
##       category.save
#      end
    }    
     browse_categories
 end
 
# This method is being used by the Product Advertising Gem: 
 def extract_children(category_response, searchIndex)
   # log = Logger.new('../log/debug.log')
    browse_categories = []
    category_response.response.browse_nodes.each{|top_browse_nodes|
    parentId = top_browse_nodes.browse_node_id
    parentName = top_browse_nodes.name
   # log.debug "\n Top Browse Node Name: " + top_browse_nodes.name.to_s + "\n"
      #Since the calls are dynamic, i need to handle the noMethodError because children is not always a method that's part of the top_browse_nodes object
      begin
          top_browse_nodes.children.each{|child|
            puts "\n >>>>>>Child Name: " + child.name.to_s + "\n"
            browseNodeId = child.browse_node_id
            name = child.name
            category = Category.new
            category.name = name
            category.description = name + " " + browseNodeId
            category.vendorCategoryId = browseNodeId
            category.vendor = "Amazon"
            category.parentCategoryId = parentId
            category.searchIndex = searchIndex
            
            #puts "\n IN CATEGORY OBJECT SEARCHINDEX: " + category.searchIndex + " \n\n"
            
            category.parentCategoryName = parentName
            category.operation = "BrowseNodeLookup"
            browse_categories.push(category)
          }
        rescue NoMethodError
          next
      end
    }
      browse_categories
 end
end
