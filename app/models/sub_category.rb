class SubCategory < ActiveRecord::Base
    
    validates_presence_of :name, :browseId
    validates_uniqueness_of :name, :browseId
    validates_numericality_of :browseId
    
    belongs_to :category
    
end
