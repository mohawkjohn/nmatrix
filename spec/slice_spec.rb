require "nmatrix"

describe "Slice operation" do
  before :each do
    @m = NMatrix.new(:dense, [3,3], (0..9).to_a, :int32)
  end

  context "with copping" do
    it 'should return an NMatrix' do
      n = @m.slice(0..1,0..1)
      n.should eql( NMatrix.new(:dense, [2,2], [0,1,3,4], :int32))
    end

    it 'should return a copy of 2x2 matrix to self elements' do
      n = @m.slice(1..2,0..1)
      n.shape.should eql([2,2])

      n[0,0].should == @m[1,0]
      n[0,0] = -9
      @m[1,0].should eql(3)
    end

    it 'should return a 1x2 matrix with refs to self elements' do
      n = @m.slice(0,1..2)
      n.shape.should eql([1,2])

      n[0,0].should == @m[0,1]
      n[0,0] = -9
      @m[0,1].should eql(1)
    end

    it 'should return a 2x1 matrix with refs to self elements' do
      n = @m.slice(0..1,1)
      n.shape.should eql([2,1])

      n[0,0].should == @m[0,1]
      n[0,0] = -9
      @m[0,1].should eql(1)
    end

  end

  
  context "be reference" do
    it 'should return an NMatrix' do
      n = @m[0..1,0..1]
      n.should eql( NMatrix.new(:dense, [2,2], [0,1,3,4], :int32))
    end

    it 'should return a 2x2 matrix with refs to self elements' do
      n = @m[1..2,0..1]
      n.shape.should eql([2,2])

      n[0,0].should == @m[1,0]
      n[0,0] = -9
      @m[1,0].should eql(-9)
    end

    it 'should return a 1x2 matrix with refs to self elements' do
      n = @m[0,1..2]
      n.shape.should eql([1,2])

      n[0,0].should == @m[0,1]
      n[0,0] = -9
      @m[0,1].should eql(-9)
    end

    it 'should return a 2x1 matrix with refs to self elements' do
      n = @m[0..1,1]
      n.shape.should eql([2,1])

      n[0,0].should == @m[0,1]
      n[0,0] = -9
      @m[0,1].should eql(-9)
    end

    it 'should set value from NMatrix'

    it 'should be cleaned up by garbage collector without errors'  do
      STDERR.puts "A"
      1.times do
        n = @m[1..2,0..1]
      end
      STDERR.puts "B"
      GC.start
      STDERR.puts "C"
      @m.should eql(NMatrix.new(:dense, [3,3], (0..9).to_a, :int32))
      STDERR.puts "D"
      n = nil
      1.times do
        m = NMatrix.new(:dense, [2,2], [1,2,3,4])
        n = m[0..1,0..1]
      end
      STDERR.puts "E"
      GC.start
      STDERR.puts "F"
      n.should eql(NMatrix.new(:dense, [2,2], [1,2,3,4]))
      STDERR.puts "G"
    end
  end
end
