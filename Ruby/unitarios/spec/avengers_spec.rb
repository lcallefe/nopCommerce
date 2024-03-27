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

  it "Thor deve ser o primeiro da lista" do
    hq = AvengersHeadQuarter.new
    avangers = ["Thor", "SpiderMan", "Ironman"]

    avangers.each do |avenger|
      hq.avenger = avenger
      hq.put
    end

    expect(hq.list).to start_with "Thor"
  end

  it "Ironman deve ser o último da lista" do
    hq = AvengersHeadQuarter.new
    avangers = ["Thor", "SpiderMan", "Ironman"]

    avangers.each do |avenger|
      hq.avenger = avenger
      hq.put
    end

    expect(hq.list).to end_with "Ironman"
  end

  it "nome deve conter \"peter\"" do
    avenger = "Peter Parker"

    expect(avenger).to match /Parker/
  end
end
