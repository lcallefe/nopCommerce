class AvengersHeadQuarter
  attr_accessor :list, :avenger

  def initialize(list = [], avenger = "")
    @list = list
    @avenger = avenger
  end

  def put
    @list << @avenger
  end
end

describe AvengersHeadQuarter do
  it "deve adicionar um vingador" do
    hq = AvengersHeadQuarter.new
    hq.avenger = "SpiderMan"

    hq.put

    expect(hq.list).to include "SpiderMan"
  end
end
