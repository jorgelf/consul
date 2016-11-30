module Abilities
  class Everyone
    include CanCan::Ability

    def initialize(user)
      can [:read, :map], Debate
      can [:read, :map, :map_indiv_votes, :map_barrios_votes, :map_distritos_votes, :summary], Proposal
      can :read, Comment
      can :read, SpendingProposal
      can :read, Legislation
      can :read, User
      can [:search, :read], Annotation
      can :new, DirectMessage
    end
  end
end
