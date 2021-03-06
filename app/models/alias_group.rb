module Intrigue
module Model
  class AliasGroup < Sequel::Model
    one_to_many :entities
    many_to_one :project

    def self.scope_by_project(project_name)
      named_project = Intrigue::Model::Project.first(:name => project_name)
      where(Sequel.&(:project => named_project))
    end

  end
end
end