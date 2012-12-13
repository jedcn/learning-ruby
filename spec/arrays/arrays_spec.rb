describe("Arrays") do

  describe("Construction") do

    it("can be created with [ ] (literal style)") do
      array = [ 1, 2, 3 ]
    end

    it("can be created with Array.new (constructor style)") do
      array = Array.new
    end

    it("can be created with a Array[] syntax") do
      array = Array[ 1, 2, 3 ]
    end

    it("can be created with a Array.[]() syntax") do
      array = Array.[]( 1, 2, 3 )
    end

  end

  describe("Basic Usage") do

    before(:each) do
      @array = [ 0, 1, 2 ]
    end

    it(".length will tell you how many items are in it") do
      @array.length.should == 3
    end

    it(".size will tell you how many items are in it") do
      @array.size.should == 3
    end

    it("[1] will let you access the second item") do
      @array[1].should == 1
    end

    it("[array.length - 1] will let you access the last item") do
      @array[@array.length - 1].should == 2
    end

    it("[-1] will let you access the last item") do
      @array[-1].should == 2
    end

    it(".each will iterate through each item") do
      @array.each.with_index do |item, index|
        item.should == @array[index]
      end
    end

  end

  describe(".slice") do

    before(:each) do
      @array = [ 0, 1, 2, 3, 4, 5 ]
    end

    it("can return a single item just like [] does") do
      @array.slice(0).should == 0
      @array.slice(-1).should == 5
      @array.slice(0).should == @array[0]
      @array.slice(-1).should == @array[-1]
    end

    it("can return a continuous chunk of the array") do
      start_index = 0
      total_elements = 2
      @array.slice(start_index, total_elements).should == [ 0, 1 ]

      start_index = 1
      total_elements = 3
      @array.slice(start_index, total_elements).should == [ 1, 2, 3 ]
    end

    it("when asked to collect elements 'beyond' the end of the array, it collects what it can") do
      start_index = 4
      total_elements = 10
      @array.slice(start_index, total_elements).should == [ 4, 5 ]

      start_index = 5
      total_elements = 10
      @array.slice(start_index, total_elements).should == [ 5 ]

      start_index = 6
      total_elements = 10
      @array.slice(start_index, total_elements).should == [ ]
    end

    it("when asked to start with a negative number, it works backward and then goes forward") do
      @array.slice(-2, 2).should == @array.slice(4, 2)
      @array.slice(-2, 10).should == @array.slice(4, 10)
    end

  end
end
