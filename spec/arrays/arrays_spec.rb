describe("Arrays") do

  describe("Construction") do

    it("can be created with a literal syntax") do
      array = [ 1, 2, 3 ]
    end

    it("can be created with a constructor syntax") do
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


end
