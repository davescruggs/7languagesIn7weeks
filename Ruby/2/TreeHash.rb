class Tree
	attr_accessor :children, :node_name
	
	
	def initialize(treeHash)
		@node_name = treeHash.keys[0]
		@children = Array.new()
		subhash = treeHash[node_name]
		puts subhash
		if(subhash) then subhash.each {|key, value| children << Tree.new({key=>value})} end
	end
	
	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	
	def visit(&block)
		block.call self
	end
end

testtree = Tree.new( {'grandpa' => {'dad'=>{'child 1'=>{}, 'child 2' => {}}, 'uncle'=>{'child 3'=>{}, 'child 4'=>{}}}})
testtree.visit_all {|node| puts node.node_name}
