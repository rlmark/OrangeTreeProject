class OrangeTree
  attr_accessor :height, :age, :oranges

  def initialize
    @age = 0
    @height = 0
    @oranges = 0
  end

  def one_year_taller
    puts "The tree is #{@height} feet tall"
    @height += 2
    return @height
  end

  def one_year_pass
    @age += 1
  end

  def show_age
    puts "Your tree is #{@age} years old."
  end

  def count_the_oranges
    if @oranges == 0
      puts "You have no oranges yet"
    else
      puts "There are #{@oranges} oranges on your tree"
    end
  end

  def grow_oranges
    if @age > 3
      # + random because nature is random
      @oranges = @oranges + @age + rand(2..5)
    end
  end

  def winter
    @oranges = 0
  end

  def pick_an_orange
    if @oranges > 1
      puts "You pick an orange"
      @oranges -= 1
    end
  end

  def circle_of_life
    while @age <= 10
      show_age
      one_year_taller
      grow_oranges
      count_the_oranges
      pick_an_orange
      one_year_pass
      winter
      puts ""
    end
    puts "Your tree has died away of old age."
  end


end

# onetree = OrangeTree.new
# onetree.circle_of_life

class OrangeGrove
  attr_accessor :age, :treecount, :sum_oranges

  def initialize
    @age = 0
    @treecount = []
    @sum_oranges = 0

    # this should only make 4 trees
    (0..3).map do
      treecount.push(OrangeTree.new)
    end

  end

  def count_all_the_oranges
    # write a for loop which pulls the oranges attribute of each tree, then adds them
    @treecount.each do |tree|
      tree.grow_oranges
      puts "During year #{tree.age}, this tree made #{tree.oranges} oranges"
      @sum_oranges += tree.oranges
      tree.winter
    end
    puts "Your trees made #{@sum_oranges} oranges in your grove this year"
    @sum_oranges = 0
  end

  def grove_ages
    # create a function which alters the age of each of the trees
    @treecount.each do |tree|
      @age = tree.one_year_pass #age +=1
      # puts "DEBUG each tree is #{tree.age} years old"
    end

    puts "your grove is #{@age} years old"
  end

  def grove_lifecycle
     @treecount.each do |tree|
       while tree.age < 10
         grove_ages
         count_all_the_oranges
         puts ""
       end
     end
  end


end

 new_grove = OrangeGrove.new
 new_grove.grove_lifecycle
