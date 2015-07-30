# ButtonBlock
A prototype for a Button object that use a block pattern as opposed to the TargetAction pattern.

The problem is that the target-action pattern requires three steps.

1. Button initialization
2. Add a target-action
3. implement a method that the target-action will be called on

However, if we choose a block based approach we will be able to shorten the steps to 1.

1. Button initialization (and block that will be run with clicked)
 
I believe that this idea is much simpiler and takes away the dependancy to a particular target.
