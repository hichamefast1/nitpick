module Dust
  class BranchDuster < Duster
    def process_if(exp)
      cond = process(exp.shift)
      yes_branch = process(exp.shift)
      no_branch = process(exp.shift)
      
      scan_for [Warnings::UselessBranch, Warnings::IdenticalBranch],
           :with => [yes_branch, no_branch]
      
      s(:if, cond, yes_branch, no_branch)
    end
  end
end