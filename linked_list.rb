class LinkedList 
	attr_accessor :head, :tail
	
	def initialize
		@head = nil
		@tail = nil
	end	

	def append
		node = Node.new
		if @tail.nil?
			@head = node
			@tail = node
		else
			@tail.next_node = node
			@tail = node
		end
	end	

	def prepend
		node = Node.new
		if @head.nil?
			@head = node
			@tail = node

		else	
			node.next_node = @head
			@head = node
		end
	end

	def size
		Node.count
	end

	def head
		@head
	end	

	def tail
		@tail
	end

	def at(index)
		if index < 0
			puts "Node wasn't found"
		elsif index > size
			puts "Node wasn't found"
		else
			node = @head
			index.times do
				node = node.next_node
			end
			puts node
		end	
	end

	def pop
		if @tail.nil?
			puts "There are no elements to remove"
		else
			node = @tail
			@tail = @tail.next_node
			Node.count -= 1
		end
	end

	def contains(value)
		if size < 0 
			puts "The list is empty"
		else
			node = @head
			size.times do
				if value == node.value
					return true
				else
					node = node.next_node
				end 
				return false
			end
		end
	end

	def find(data)
		if size < 0
			puts "The list is empty"
		else
			node = @head
			size.times do |num| 
				if data == node.value
					return num
				else
					node = node.next_node
				end
				return nil
			end
		end
	end

	def to_s
		if size < 0 
			puts "There are no items in the list"
		else
			node = @head		
			size.times do
				print "(#{node.value}) -> "
				node = node.next_node
			end
			print "nil"
			puts
		end
	end	

end

class Node
	attr_accessor :value, :next_node, :count
	@count = 0
	def initialize
		@value = nil
		@next_node = nil
		self.class.count += 1
	end		
	
	def self.count
		@count
	end
	
	def self.count=(value)
    	@count = value
  	end
end


